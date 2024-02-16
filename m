Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241D857558
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 05:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71310E5BD;
	Fri, 16 Feb 2024 04:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAkSIRzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020010E17B;
 Fri, 16 Feb 2024 04:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708057724; x=1739593724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RPFq/SY8Q65N637AJlU7NFDb/xSS86n7fM2uhMWGctU=;
 b=JAkSIRzzmQOz04GZLXw6NzEG6125YVi/u70cJ60+4LqA2eW4XdJtAVNy
 x+NwsvduAX4nYUHX/CRoHhviRXDknJTgUzLDaC/c2jQ3lltKVWny2vEKN
 M/jDcb9iwdNI6n3ofGen61PXbRLcEj+gm3EaDivvAt5EKtc5gFytHsefX
 RkmlUeDy+KdDfFZRk3xGRiojoZ7le2H+CjzSlIzQCZlynr7Xbq9jl7QaV
 zinz/CpG0kezMHBLxlVrjygGbAdypLd2YIp+/2ildXhhHH214b7mmcKN1
 QA6tHE8Yeh7ioD3pbQ/03+LIpfiKZHZYrFN8jNkOLmH6g/yRS/FOsWQNX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5988565"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="5988565"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 20:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8392017"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 20:28:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 20:28:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 20:28:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 20:28:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 20:28:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxqJHciFHEiQY0r/985H2nvSeHmWMgsOjc11bCaSrWlHB6Sh5VE+pZe9bxonMFI3Rcz2abKyOzAWZmgiunFFzMJAXTI5xW+MYuPTgF77DstHelqW/rLF3HGM9aoYmZVHnbUzxXWTPOww/jiBsk644BhcB/Gyg6G2MxfRvL0NbbzS9YyFHv5zVzTB0IaaOQC8dU6Mu/L1rWIB+IMhC53V59pSPicJNrBReK2oRvHKD1fuMKpULPAk4SQGcD+3Nq6lgRwAVcg+9ux/Dx60DKIHfKoHNxkZyeVbBduu7IdeCJjrAncSL6qpax+j9cd4WwOPNk49tRKcGYbXEUw821w9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPFq/SY8Q65N637AJlU7NFDb/xSS86n7fM2uhMWGctU=;
 b=cmxr4qwzbNB2SsQqL7sr3GlwFLrqSPwiwHvc9rfOfmXLNb2HB1ZRon2oO63kSFysp/pcq1LCdqTXpNyEE1SVS0WoiOXBKFsyGAAxvJfo7Wr6HmgQ9v+zCE3HRGTJx8cH8N2uKgCb0wmGtrsV6kCyDht88SJi8o+wwYgMrPxzF7c/Tc0i1A18LpaKkkr1xsO9/tUUbaKBRMFSohZSUTMnwpq6tmziG52rTsgFPldYzTan4Yaa8fScz9/PTYI1gAHPgHcxr11ARcAsod1zMv/U+IRvjQlUZBcZBWt56wOk+N5n0rhkCiUBqIuXyhsBJIqPZKp1y7TViZNQmh5ABiH7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 04:28:41 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::2397:93ca:29e3:378e]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::2397:93ca:29e3:378e%4]) with mapi id 15.20.7270.036; Fri, 16 Feb 2024
 04:28:41 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Simon Ser <contact@emersion.fr>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "G M,
 Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Thread-Topic: [RFC 0/5]  Introduce drm sharpening property
Thread-Index: AQHaXzje+hY9B6aMtUSnlRX/VsGgnrELFMOAgAFLpoA=
Date: Fri, 16 Feb 2024 04:28:41 +0000
Message-ID: <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
In-Reply-To: <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA2PR11MB4921:EE_
x-ms-office365-filtering-correlation-id: ea654b2b-6d1f-483e-ceaa-08dc2ea7c0f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nKynrgM+DDFSAIdPdkYBKHknLbI83ampbKUiFKUWNxfUYnW+/7a8q+fpI7mkXRBnsaZVWdxH9nEkQz3ItcLGOUYJcu/YEsqI9S4bg6lmLCmikDlv28rt+G7PaYSD6lsfKddEFfLUOA0iucsOXfuHglIeglcBRJqMm0kZ4X+RaBdkHoLWdXjeju218mbp04UuaXdCVf2lfkoNXmQYyQyv+RYDljt0R/YU6DEBg9KPVIUBEFwdg8bDWz1TuVkT5zRXHnQsBiQIIP+SG3x1X586rxZOnC37beo9FNv26YlpOODGsLwJc8raFUuJrkUQXhliaIGeQxwCu8mrzd078aNELryeLMF5nb0A6ekbXr7bMJXrxnossNIKVnonLaRjYRfPxiiC+XBgDIyCWmqQk0fGGnDohCss053nlhZgh+AsGmnHkq3dOCsGJJ+6lDlh63gj7tL/cvRNxcMHaMbIiSooXPBcCD4hUVhnEywxxDY0gOWjjpSgJxdqCZYVnq08BL0Up3Jmz8jL/wnVAbtu2jyp2Dpb9n+VNRkadIVIPP/iDvxeWHQR0Psw6APeYICX6RjA30aQ16wHDNNIcI7a00mAorE6/UzGkw1xl2zKtkkmGMrclPeuK+lsslNaq/qO0KWp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(71200400001)(26005)(55016003)(66899024)(66946007)(8676002)(4326008)(6916009)(2906002)(52536014)(66556008)(66476007)(66446008)(76116006)(5660300002)(64756008)(478600001)(6506007)(7696005)(316002)(9686003)(54906003)(53546011)(107886003)(86362001)(8936002)(38100700002)(82960400001)(38070700009)(83380400001)(122000001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2VmNG9wWjZ1V1BmR3FzN09laVJRajI4UUxLNVRUYzdFbHp4c0FFZFZSbFRx?=
 =?utf-8?B?d1NUbks3eUVoakllTlpCNG1OTGlZTFEyRmE3cVZtS1BMQlBwQUl0YmlpaUUv?=
 =?utf-8?B?V2JyOXVJYkF0TFpEamV6VlhURmUzZlBzaFVIUHkyRXZuMWNoNHR3TWU4cmpO?=
 =?utf-8?B?clRhRFhrN3E0YWFmcTF2RnNva3B5NDJlYWZLN0xqT0M2eVFPcVdlQnJjR0JY?=
 =?utf-8?B?S3FOTXJHcXZyVUlhVGZTeFZXU0NoMGIwUytERklXdlFjVEhyYkJNWG9jR3k0?=
 =?utf-8?B?MGxIZzIxYjl4ZSsvUXJ3V2RtV21Tbmlkd2REVEgyRmtCMXQ0WGtQd3NIY1A4?=
 =?utf-8?B?aEsrSDBQK0dkYXZWU25jUDZ2SXNQMWlKWUZ2MWxNenZRSnI0Y3lmOGNubmcr?=
 =?utf-8?B?bkNoaWN4aHd0RlBNME9YNUdBcUlrVEFGWUVJL1RxVkNiYnlpaTRVT25xSzhz?=
 =?utf-8?B?UmFOU0NONFJCRlgyWEpTbkFJQ2VnWFhDbGRBNm04NHJtb2NJZkNCaEhYeUdX?=
 =?utf-8?B?ejI4bFVQV3A3ZUJhcDRteXgraUxRNnFUOE1QUndDdG5FUmsrZ0lnS1U4ZllT?=
 =?utf-8?B?bkFXdHg1RFIwU3RLWWhFY0o3QWQ5bm1yUDZaYkRqLzBjNjNoTmpxcjBZNVhs?=
 =?utf-8?B?SUo1eUJ1T3p5UlJ3R2ExOWxIM3RtQ0E3QlMxeDkwNHBWb3F4WmQ1NXpiM2xy?=
 =?utf-8?B?eDlEQUQrK1I1T1ljbVJobCtCY2ltYVZvVFpkM2t3SVE3RlBENGZtQmtOWjB5?=
 =?utf-8?B?WkVUaCtMS21JN3BDb242NjgyWnQyQmVlWS9tYWkvc0piaVE0emY3aWxGQVFS?=
 =?utf-8?B?RHJNc3pVdXhPZCtCWnYybi80K3RObVVQeEhaOXhDOGdMcU9oQ2x1VS9lbC93?=
 =?utf-8?B?b1I5Ti95S2tlZm9lUjQyUENoN0Z1NndIL0NpQXA2N3dNL2lDL2xKZ2ZOT1FW?=
 =?utf-8?B?QlljQjRQU0grWjUwMFBydXgrbjFJRW1Ebzd0a3RhOFZJSkZHR3pIQ2FRYWNa?=
 =?utf-8?B?K3d4NVpmdEs3c3FGYVpiejc3WU1IUFV1QkM3dkZ5RjVRZ21iUlozWlNzY1dS?=
 =?utf-8?B?VnlwVW9VTUtaNElIQ2Y0aWl6RGdNK1c3Z3QzaGRGWHU5YVYyU05qelN0RUVL?=
 =?utf-8?B?bHArUTVGN0RiNlYrblF0TUwyTGxFSThQVGVBSU1WZXcwbWxObElNdGhaSkxn?=
 =?utf-8?B?L3FZNVNGSjVDQ2FLaVJrTkFKenlzakNnejVnL1RaWHI3SWV6cThCem5SQzk3?=
 =?utf-8?B?MU1OcTc2Z2JaVm1QdWxZVFBLQnI3QnJ2Wkk0S1hJTVlxL2IwaGpMcVREQ0pB?=
 =?utf-8?B?ODZ6UjExK24wTVpiZDRLUUNjOXc4Mm5KcmdZWnJBL2pkNzJwOENyRDFPa2Z6?=
 =?utf-8?B?SHd2ZWwxai84dWZQODFHN1VDbUViWVlFSmIwelFyM01ZMDVpUTZ3c3ViaUpU?=
 =?utf-8?B?MDlueHBzdUExVlllNFV2NWRkS01pVUtseVRxUDVMK3hYNENvZUtOYlZ5TjYx?=
 =?utf-8?B?MlE1ZW0vYTFEd0N5VTF5SHlLMDljZENKZkRIcldXQkhXZzJQUmxvZ3E2ZU1t?=
 =?utf-8?B?bG92VHBkalVnakJqQ09SOG1YS256U09jMW8wN2NlMDNibGxaUDBXR3Roam9N?=
 =?utf-8?B?S3lSdi9jd2FiSnZIWGdaWGhGdkFlcitqRiszenJoeUY0QUZ6VXJKS3dZMGpn?=
 =?utf-8?B?NUd1K2NCL2dkL0RQZFRac1BHVk14UVlUeWE3eFdoS2lJaUF2VlNXU3pJcVVi?=
 =?utf-8?B?cFFVa3NvMUxqaGlTWFQ3d0p4eTNZYU5ySEdUemlsUFdwOFUrRU40blQyNExk?=
 =?utf-8?B?R0RVdXNtRkYwcUNZM0ZYcmgvKzJSTTNkZmtvSmIvT3U2Wk15QXJKQm1IUjFl?=
 =?utf-8?B?ZUF0bVIrQVV4S2VuTThFanRMWW01UGZvSE9nVkloZHk3YmIvNXV2R3ZHSXZP?=
 =?utf-8?B?VXBMcU9CMXF0bWkwRkZWNDFROXBkT0VnaGI3M0c1WkI1UmpNck94VFNJNUR5?=
 =?utf-8?B?UW9OR1JQN3Z5TWY3WkJwQ1ZQZG91emRGQmNhb2d0SmhiMjE1K0d1b1pJSVBv?=
 =?utf-8?B?Sjg3dnlJcnR5UFdKMkkwZWJlZWZ6MkgzMGtSWmc0RjgvdDFpZUJDcWxyTFpi?=
 =?utf-8?Q?w+UgrsTyyRoaHWXF2v6QDCjxO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea654b2b-6d1f-483e-ceaa-08dc2ea7c0f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 04:28:41.1244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIkMiVW83vBbTsEFy6tf/Hi+Xic/L0cKPzKTYjHCJe/ThkDYHmZRFTKeV+3qj4rySGYZfnonIKlz1mX/mofHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4921
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgbm90IGludGVsIHNwZWNpZmljIGFuZCB0aGUgZ29hbCBpcyB0byBoYXZlIGEgZ2VuZXJp
YyBBUEkgZm9yIGNvbmZpZ3VyaW5nIFNoYXJwbmVzcywgYWNjZXNzaWJsZSB0byB2YXJpb3VzIHZl
bmRvcnMuIEludGVsIGN1cnJlbnRseSBvZmZlcnMgc2hhcnBuZXNzIHN1cHBvcnQgdGhyb3VnaCB0
aGUgRGlzcGxheSBFbmdpbmUsIHdoaWxlIG90aGVyIHZlbmRvcnMgc2VlbSB0byBzdXBwb3J0IFNo
YXJwbmVzcyB0aHJvdWdoIHRoZSBHUFUgdXNpbmcgR0wgc2hhZGVycyAoVnVsY2FuL09wZW4gR0wg
YmFzZWQpLg0KIA0KSW4gdGVybXMgb2Ygc2hhcnBuZXNzIGludGVuc2l0eSBhZGp1c3RtZW50LCB0
aGUgcGxhbiBpcyB0byBwcm92aWRlIHVzZXJzIHdpdGggdGhlIGFiaWxpdHkgdG8gY3VzdG9taXpl
IGFuZCByZWd1bGF0ZSBzaGFycG5lc3MgbGV2ZWxzLiBXZSBzdWdnZXN0IHNldHRpbmcgYSBtaW5p
bXVtIGFuZCBtYXhpbXVtIHN0cmVuZ3RoIHJhbmdlIGZyb20gMSB0byAyNTUsIHdoZXJlIGEgdmFs
dWUgb2YgMCBzaWduaWZpZXMgdGhhdCB0aGUgc2hhcnBuZXNzIGZlYXR1cmUgaXMgZGlzYWJsZWQs
IGluZGljYXRlZCBieSBhIHU4IGRhdGEgdHlwZS4gDQpGb3Igbm93IHdlIGhhdmUgbWFwcGVkIHRo
ZSBzdHJlbmd0aCB2YWx1ZSAwLjAgdG8gMTQuOTM3NSB0byAwLTIzOSBidXQgYXMgdGhlIGRhdGF0
eXBlIGlzIHU4IHVzZXIgY2FuIGdpdmUgdmFsdWUgdXB0byAyNTUgd2hpY2ggaXMgZ2V0cyBjbGFt
cGVkIHRvIDIzOS4NCg0KV2UgYXJlIGFsc28gb3BlbiB0byBoYXZlIGFsdGVybmF0aXZlIHNjYWxl
cywgc3VjaCBhcyAxLTEwMCBvciAxLTEwLCBhcyBsb25nIGFzIGEgZ2VuZXJhbCBjb25zZW5zdXMg
aXMgcmVhY2hlZCB3aXRoaW4gdGhlIGNvbW11bml0eSBjb21wcmlzaW5nIE9FTXMgYW5kIHZlbmRv
cnMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2ltb24gU2VyIDxj
b250YWN0QGVtZXJzaW9uLmZyPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTUsIDIwMjQg
MjowMyBQTQ0KPiBUbzogR2FyZywgTmVtZXNhIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQo+IENj
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUkZDIDAvNV0gSW50cm9kdWNlIGRybSBzaGFycGVu
aW5nIHByb3BlcnR5DQo+IA0KPiBIb3cgbXVjaCBvZiB0aGlzIGlzIEludGVsLXNwZWNpZmljPyBB
cmUgdGhlcmUgYW55IGhhcmR3YXJlIHZlbmRvcnMgd2l0aCBhIHNpbWlsYXINCj4gZmVhdHVyZT8g
SG93IG11Y2ggaXMgdGhlICJzaGFycG5lc3MiIGtub2IgdGllZCB0byBJbnRlbCBoYXJkd2FyZT8N
Cg==
