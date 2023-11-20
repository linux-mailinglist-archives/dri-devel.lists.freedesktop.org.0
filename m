Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD17F11DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 12:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69110E3A2;
	Mon, 20 Nov 2023 11:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 868 seconds by postgrey-1.36 at gabe;
 Mon, 20 Nov 2023 11:22:48 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475CB10E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 11:22:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AKANcX4018182; Mon, 20 Nov 2023 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=gT9aEPkhkumDYCVozRemYeDZn3M4lWFebjHMbHqcLvM=; b=
 HnQurvJnyjVQBuMorvt2HWI09mCHDNLVphNvKd2FmOjHValQOvcCxdMEs16YTfU7
 F+1QK+F+GA5whrCEf3GUc+azXP0bDtdw9iZjNRP+h4F3mnh84lFn6pQ3ODBzp17w
 sf2xc0/G6sWzXDrsYTaqYZZEp4sFCZPVcIN6TGOzY6aFuMNgFd9/Hml1lXcp9t5x
 sRp45H6/ZAWWJctw2+Amxe/u96vCOlUy1S6c27YYvzQiQpupMqCnvaY8+LOSNy1Z
 I0skNvr/ubsK/2KEavXa2i0sCOAu/4dHeI3Yw1zpnESzdypTndBQsogFwHjhoLH2
 l1hiyzMUn3dfAbJnY94X7g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uep7whcrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 20 Nov 2023 11:07:39 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:07:37 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 11:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAdn3PYbudDShca67MUuU6LbNw5bskvcnqozvPrlTdZw09l8amcunV3gWSKys3vnPBK0qtAB+xBZe9Gs4XFyU1zP8cFT+axKJlck1v1PeQmnVr/0qyeSmeSInrTqbUGzZ7raMDgoHmTFnDScbzLTdE8FohY32hTKR1WEN5IDqAx3KvdiICnWIRs/8/wK1RuJPXE4T7FvXcgh7ZgWCcrqQ+v7GLv17V9o0KURn5l3rW3pt9wFv7vs3tdyHGXLU0VRZed9qZMXgSVB2w4EVG5psYQyttQg6ZTjp0xLwzITXFocfDfGyTX3uFbvrhBnpatS8oRGrF24kpkFw92P6yKboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT9aEPkhkumDYCVozRemYeDZn3M4lWFebjHMbHqcLvM=;
 b=GG/aDzkmQ7j9KOhyBEulnkbYZtbDJvE7fHrxXRAkNxXxpHaeC6r+3ygxU7Rx4VRMxoFZWVXqTMZVj1AaYP/K7QFxCGTI1XmSX2yebs5SCbEkWv5qH/0wP4PlY80zXMyCsHOBHT0EF2pz9ZJ8G/VR4jseqKsW8ea3rduY5CDH4lT5iRjOb6K8F8av8eZRtbaa+sFkw9/HjVwvy7R/E9dSKV/MVNkJNoEukk2YIquc4Il/vlz2ywbSaDR97sWKiSzZf+eDZCXn+LgsT+y3Ka0eVPAR9QEcsUVHLEe1cVgkw5a3KejEjRiMpvN7MXToqYE/QYjh6LH1SiEw0oScwwID0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT9aEPkhkumDYCVozRemYeDZn3M4lWFebjHMbHqcLvM=;
 b=eU7ALEdMCjm5a730hFfhrr4kDslnR63Sdc36ZxTMTlWzX3+ADjX/fKfsuVV5OyzDqYs/iqKk0eiVbcNfLZltmo68q/JCJQ89T3GVNUWjB4nt1pAWu7IUxh2spHJHj21vfC391e4DfjC81TTGpr47aNJfrMVSbzX5gcC+JUrUrkU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO4P265MB6076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 11:07:36 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 11:07:36 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] Re: [PATCH v8 02/20] drm/gpuvm: Helper to get range of
 unmap from a remap op.
Thread-Topic: [EXTERNAL] Re: [PATCH v8 02/20] drm/gpuvm: Helper to get range
 of unmap from a remap op.
Thread-Index: AQHaDAzFKiN2K/JpiUWrE4UFh12xELB6GwYAgAkQaIA=
Date: Mon, 20 Nov 2023 11:07:36 +0000
Message-ID: <60fb969e2faae2137c48e8840ca31626f9a403d8.camel@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
 <20231031151257.90350-3-sarah.walker@imgtec.com>
 <e517d560-3a1f-4e79-9bec-acdc77784bcd@redhat.com>
In-Reply-To: <e517d560-3a1f-4e79-9bec-acdc77784bcd@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO4P265MB6076:EE_
x-ms-office365-filtering-correlation-id: c754bef5-2225-42f6-efd3-08dbe9b8e713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RpJTosNYr7bfc2a7STcHWET61mZGv94sbRysgKdrdshcPbX5tdQv7J7iuOF1qspOWV2AVXtgMqc8Y2OAVr8+pEBZaazpDnLTNC9pAF5y+Z9dCHK+tjfQ1Yr3c/XWZpC5SaOIrgfD1BpymxobyC8ncG0U+6Cn/U3cT2bNJosST/AzmI/34lJwnYPEsBrbOKi0WryZ7PlcLGeDgLrAwUfN+qbG0qOTghNS+OhuqoXXSUf+S/pJhUrJDKqbXFvo6uNwVJTs7lMJMivqOaPoEC38+KPtCMKJPXwSLRwkLnv/MAY0IenBVmziBw0zL5RpzoLiDLt+k/WxtxRqYUlFOP+Ani/mk3AQ16bQzB1p8XMlBNb712pSdDVkT+6R9gdXffKKlhSVG1eKQt9or4LJ2F+TPZzkRTTFFK/DUlltXcOM2o5TdSxjdnmy7P1CktTbyQt/WcgVp+VoW77AzVZdP7hb5bq4VaL91dCOHvC+mMPSwZQxBgPMbHi/i7R3GQKM9I3OfkHU6C1AHodyPAQv7Q0kOkWpeSIugeRq3rLjioGZ3ARD+HjuCtZzf0ggmoR1ABH+GIbFk+hGpUG+nsFR8gJml6ubASR+p/Au2D5YrKAGWfMLj11uQNHpZbvBTRan8440BClms3PtLA7A1r6/1FFPWhZp4ipPiUXw/8dOEcEmX+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39840400004)(136003)(396003)(376002)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(186009)(1800799012)(316002)(6636002)(110136005)(91956017)(54906003)(66476007)(64756008)(66946007)(66556008)(66446008)(76116006)(53546011)(36756003)(6512007)(71200400001)(6506007)(2616005)(26005)(38070700009)(6486002)(478600001)(38100700002)(122000001)(86362001)(4001150100001)(2906002)(7416002)(5660300002)(8936002)(8676002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk94ZEFmUWZUZnJLekRCTlA1Wng2OE8rK0pFck5nOXN6MWhmQmlQbjk5Wk16?=
 =?utf-8?B?WVhpM1Zjc2hLTDdJVnVvNWlWaGM3VTBZOFJQejd6YjNyZllKNjcxVVkzRlVL?=
 =?utf-8?B?dE1DZDhybDE0bEc3TlUrVkptYVNTNVpSWnJkSm9hOW5lYjE4VzA1ZHBYWHhM?=
 =?utf-8?B?T1hqSGJvMUdHMVc3S1R5MVNQNzdBRm82RHRxRWc3L0Vpb3dLNmZVcnVjLzZZ?=
 =?utf-8?B?WlRzMk9kcTdQM2Rzc2NnZjNTcndaQXlCV2pmeWtBWWpEMEYwbVRNT01HdzE5?=
 =?utf-8?B?eU1DRThoMG1ucElFMHZBNTN4K0NMNVFVRis3ZGE1TDZyTTMwYkl3M21qYzZq?=
 =?utf-8?B?bjVHRy9OVndIMXhRTjJMeGpIM09aNkdvd1BHRTlrWVJoNkpmRDBqUEduWHBZ?=
 =?utf-8?B?c3plSnVVdkdhR3ZwaDh1R2xGd3VoVFhNaDltTVQ2enJUaXFzdFN2Wi9DR2o0?=
 =?utf-8?B?bkcySkxQWTNva3p0bDRtSXpNaW0rSFZhNTVXM0FTczk5eDJuU2d0UXBwMU1E?=
 =?utf-8?B?N05USmQrOSs1S3lxOE9PZWpLK08veiswekp5d2ZlRnprcGUzZmYzb2dpWVor?=
 =?utf-8?B?MDJTekRjVVcrNzlHMGJubVJ4YzR1S3VkdFRTTzh2QUVNUUNscnJvQzBXbElY?=
 =?utf-8?B?WWNMeEhVMnNhTUFoQTIxNStwVkhSTDVjdHFMZnFDRFpUZDFLZ3FSSXlyTlhE?=
 =?utf-8?B?MHpQcGlhSkY3MWwrV3FaM3RLd0pKaVh1WkhqYjVtQ0dKVmg2WkZrTXoxNjd3?=
 =?utf-8?B?c0RyQ3ZNa2hpS3JGeEN2cG1hU0liT3JJKzNvSVE2Q05jaFA3ZStaTjd1QUdH?=
 =?utf-8?B?V2dJeEZuZ3Fmb0syYWc2T1RpcEZkY1dXaEdLU3B3cDdJdjlmelVpYUE0UlBv?=
 =?utf-8?B?ZXBrVHhyVWxtQUJDaXpUdTliWG9Ba29LUGhYaVQzQ2t2T1lRYU15MmdpK05j?=
 =?utf-8?B?TW5CZDc4dGRrdkU1TE1kK1Z5Rm9oSFVOUmlySlJodnNEbERRRFgrTzB3ZXRt?=
 =?utf-8?B?cUgxQmhVZnlxcDVjQW83aUtVVGQ5cVVtTmdacERGb05KenYwcFVOMFduOS9N?=
 =?utf-8?B?QzVKSE0rYXlFQy95L21BNGc2enFSb243aHpvOTFBUk1ZOUVXVGhPY2FmQ2lr?=
 =?utf-8?B?ZTc4dEVKVmlsOFh4eDZVVGhjUzZOdkc3VEExTEYzRXRhd1ZiNjZneWorc3BQ?=
 =?utf-8?B?Vmx0SGRiNU16ZnV0ZkZRQittdU9OL1BEdFVibFA3N2Z1ejZlOHF0aG9kVWZ3?=
 =?utf-8?B?UFBwU1RrNm13OHdrdk9teUVmd1lqYlZGS3dEYVdzVHlDV2NsU0c3c2ZBdmNO?=
 =?utf-8?B?ZktGSzZIelRsVW1nVGFwZHNSV2NHazJHdkhPaUhmS213RFdXZjR2OG4zTTFy?=
 =?utf-8?B?OVRBYmRYcTR5ZWlTS2ZaV0lNRXMwbExaRk9KSEwvNVRqL1pNakRxZjJqc2dU?=
 =?utf-8?B?RGUzTTlXekEvMXloY1F5WnA5MTFFM2JQSFFwVEplaW5zck9Ra3lENDZqekx5?=
 =?utf-8?B?cFVXVXZCUFlGcVNvb3E5Y2tnYkEwQk1jeEsrbmp5M2Irb1dzMWZLcnJNT0tW?=
 =?utf-8?B?VVlBZkovQVNZOXA3SjdTWDgvMXJCbnBLWFdwK1ZFODVKV3lSWTdDemdiaWdG?=
 =?utf-8?B?WUNYb3lNc2k1cmtmNERTN1piSXg3WCtIT1I1VklESkV1OXlkQlgweDg3NnB2?=
 =?utf-8?B?NlljV1hKYmp5bnp3RXI4eGpQMlNFdy9iNFVrdHFFOVhvaEZCTUdBSncxNUV1?=
 =?utf-8?B?cVJ2OG9VL0NCbzJmY2hJTTBEdm9kN0x0b0ZuNXQrT095YXFucm9OK2F6bStF?=
 =?utf-8?B?ZzBJSXgxZStlNTdwRTlHVFRyR1l0M2wycEs4NUNqVTIxR2NxbXI0eUxDVW5n?=
 =?utf-8?B?R3JSTys2U3NaTGQ0aFA0azhRQnRaNmJQUUY3WUxFeEFnbWhDNDBaaWtleGNU?=
 =?utf-8?B?d0tBNkhYV1BKTEZoc0wzKzd0bVppa2VLWG9qQjRNWndyclpNeXVxSlYvRURO?=
 =?utf-8?B?T1l1dkxzVVUyUC85TmZ0ZzA5SnJNQ3FrenBLRlZjNlM4eDFUckNEcWdWc1hp?=
 =?utf-8?B?NGhkMU94V0VJRUNaaHhWbDh0VEE0UWp4K2Y4MXdUeFdXZzZTSkdZUFlueGxY?=
 =?utf-8?B?RGMrSEtORTNMYlVzWnNXODVlVnlxa0srMFIzL0lWQ3VSUkVyeW1QUVVrVkZu?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B1ED3B0AB3DC84EA8A2B49921324A67@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c754bef5-2225-42f6-efd3-08dbe9b8e713
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 11:07:36.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AYQQ5JpRMGqgJUhIEsr0eSJ17xkFvpPeiDQ1e8NL0Ep2mx0+9H8VmRGSCAeM8AHsR14LDPxhS2UBgsTYMSN1C5dyeE/j9x1vHCkm7m2qq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6076
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 1JidKZS822c7fy4twkS8dideXvxdTLlg
X-Proofpoint-ORIG-GUID: 1JidKZS822c7fy4twkS8dideXvxdTLlg
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "hns@goldelico.com" <hns@goldelico.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDE3OjQyICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiAqKiogQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVzIGZyb20gYSBzb3VyY2Ugbm90
IGtub3duIHRvIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcy4gVGhpbmsgYmVmb3JlIHlvdSBjbGlj
ayBhIGxpbmsgb3Igb3BlbiBhbiBhdHRhY2htZW50ICoqKg0KPiANCj4gT24gMTAvMzEvMjMgMTY6
MTIsIFNhcmFoIFdhbGtlciB3cm90ZToNCj4gPiBGcm9tOiBEb25hbGQgUm9ic29uIDxkb25hbGQu
cm9ic29uQGltZ3RlYy5jb20+DQo+ID4gDQo+ID4gRGV0ZXJtaW5pbmcgdGhlIHN0YXJ0IGFuZCBy
YW5nZSBvZiB0aGUgdW5tYXAgc3RhZ2Ugb2YgYSByZW1hcCBvcCBpcyBhDQo+ID4gY29tbW9uIHBp
ZWNlIG9mIGNvZGUgY3VycmVudGx5IGltcGxlbWVudGVkIGJ5IG11bHRpcGxlIGRyaXZlcnMuIEFk
ZCBhDQo+ID4gaGVscGVyIGZvciB0aGlzLg0KPiA+IA0KPiA+IENoYW5nZXMgc2luY2Ugdjc6DQo+
ID4gLSBSZW5hbWVkIGhlbHBlciB0byBkcm1fZ3B1dmFfb3BfcmVtYXBfdG9fdW5tYXBfcmFuZ2Uo
KQ0KPiA+IC0gSW1wcm92ZWQgZG9jdW1lbnRhdGlvbg0KPiA+IA0KPiA+IENoYW5nZXMgc2luY2Ug
djY6DQo+ID4gLSBSZW1vdmUgdXNlIG9mIF9fYWx3YXlzX2lubGluZQ0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IERvbmFsZCBSb2Jzb24gPGRvbmFsZC5yb2Jzb25AaW1ndGVjLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTYXJhaCBXYWxrZXIgPHNhcmFoLndhbGtlckBpbWd0ZWMuY29tPg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IERhbmlsbyBLcnVtbXJpY2ggPGRha3JAcmVkaGF0LmNvbT4NCj4gDQo+
IFdhbnQgbWUgdG8gYXBwbHkgdGhlIHBhdGNoPw0KDQpZZXMgcGxlYXNlISBUaGFua3MgYWdhaW4g
RGFuaWxvLg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgaW5jbHVkZS9kcm0vZHJtX2dwdXZtLmggfCAy
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjgg
aW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ3B1
dm0uaCBiL2luY2x1ZGUvZHJtL2RybV9ncHV2bS5oDQo+ID4gaW5kZXggYzdlZDZiZjQ0MWQ0Li5j
NjQ1ODVkYzRlOGUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dwdXZtLmgNCj4g
PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ3B1dm0uaA0KPiA+IEBAIC03MDIsNCArNzAyLDMyIEBA
IHZvaWQgZHJtX2dwdXZhX3JlbWFwKHN0cnVjdCBkcm1fZ3B1dmEgKnByZXYsDQo+ID4gICANCj4g
PiAgIHZvaWQgZHJtX2dwdXZhX3VubWFwKHN0cnVjdCBkcm1fZ3B1dmFfb3BfdW5tYXAgKm9wKTsN
Cj4gPiAgIA0KPiA+ICsvKioNCj4gPiArICogZHJtX2dwdXZhX29wX3JlbWFwX3RvX3VubWFwX3Jh
bmdlKCkgLSBIZWxwZXIgdG8gZ2V0IHRoZSBzdGFydCBhbmQgcmFuZ2Ugb2YNCj4gPiArICogdGhl
IHVubWFwIHN0YWdlIG9mIGEgcmVtYXAgb3AuDQo+ID4gKyAqIEBvcDogUmVtYXAgb3AuDQo+ID4g
KyAqIEBzdGFydF9hZGRyOiBPdXRwdXQgcG9pbnRlciBmb3IgdGhlIHN0YXJ0IG9mIHRoZSByZXF1
aXJlZCB1bm1hcC4NCj4gPiArICogQHJhbmdlOiBPdXRwdXQgcG9pbnRlciBmb3IgdGhlIGxlbmd0
aCBvZiB0aGUgcmVxdWlyZWQgdW5tYXAuDQo+ID4gKyAqDQo+ID4gKyAqIFRoZSBnaXZlbiBzdGFy
dCBhZGRyZXNzIGFuZCByYW5nZSB3aWxsIGJlIHNldCBzdWNoIHRoYXQgdGhleSByZXByZXNlbnQg
dGhlDQo+ID4gKyAqIHJhbmdlIG9mIHRoZSBhZGRyZXNzIHNwYWNlIHRoYXQgd2FzIHByZXZpb3Vz
bHkgY292ZXJlZCBieSB0aGUgbWFwcGluZyBiZWluZw0KPiA+ICsgKiByZS1tYXBwZWQsIGJ1dCBp
cyBub3cgZW1wdHkuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQNCj4gPiArZHJt
X2dwdXZhX29wX3JlbWFwX3RvX3VubWFwX3JhbmdlKGNvbnN0IHN0cnVjdCBkcm1fZ3B1dmFfb3Bf
cmVtYXAgKm9wLA0KPiA+ICsJCQkJICB1NjQgKnN0YXJ0X2FkZHIsIHU2NCAqcmFuZ2UpDQo+ID4g
K3sNCj4gPiArCWNvbnN0IHU2NCB2YV9zdGFydCA9IG9wLT5wcmV2ID8NCj4gPiArCQkJICAgICBv
cC0+cHJldi0+dmEuYWRkciArIG9wLT5wcmV2LT52YS5yYW5nZSA6DQo+ID4gKwkJCSAgICAgb3At
PnVubWFwLT52YS0+dmEuYWRkcjsNCj4gPiArCWNvbnN0IHU2NCB2YV9lbmQgPSBvcC0+bmV4dCA/
DQo+ID4gKwkJCSAgIG9wLT5uZXh0LT52YS5hZGRyIDoNCj4gPiArCQkJICAgb3AtPnVubWFwLT52
YS0+dmEuYWRkciArIG9wLT51bm1hcC0+dmEtPnZhLnJhbmdlOw0KPiA+ICsNCj4gPiArCWlmIChz
dGFydF9hZGRyKQ0KPiA+ICsJCSpzdGFydF9hZGRyID0gdmFfc3RhcnQ7DQo+ID4gKwlpZiAocmFu
Z2UpDQo+ID4gKwkJKnJhbmdlID0gdmFfZW5kIC0gdmFfc3RhcnQ7DQo+ID4gK30NCj4gPiArDQo+
ID4gICAjZW5kaWYgLyogX19EUk1fR1BVVk1fSF9fICovDQo=
