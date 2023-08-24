Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF07869D1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E808110E0DB;
	Thu, 24 Aug 2023 08:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0E110E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:15:31 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37O7Cjks007456; Thu, 24 Aug 2023 09:15:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=IxyIQc4Fb6bG6qQNXM0rV+6B2zrlK1+qb3NNenSkUvU=; b=
 x72Xc9JlBfM+iGAQzfqtakyWbXWrCoXDuq3GuTkG7dt1eMpjRAZdwPOHAVqMjH3h
 BwtTXsH8AU6J3zoGAVHyT+jK6MoDgwxc9o8q6nKSwGIPgh1TM0ToTZrwP70aBL+h
 tH83/SiI/cIT7TsK5TcKUW7thhfS7yv4z0AiKTPpvtapb5nFi2NgnAHwD8DZcLbC
 RsDKn0dTUfSS0ca8gHZqYs/2iC3SqqnYY03a0m23/lg1JeLxjOUbwtzPPCgbvOBF
 /Bt+XApis2gU32KtC4HN+9vuaJ0/s5V4NfcA9uCPwjy9OnX0K7VmA5sTCvGeXcd8
 qKSRVftuEKhCI2rtoFcqPw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3snw8kr730-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 24 Aug 2023 09:15:02 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 09:15:01 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.108)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Thu, 24 Aug 2023 09:15:01 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPd149u5eo1muWRl3Q0rhY6kqXzmuL8zmenz1+oAZw/QE4BptNHLg803DHmiCvfF8+y9yYxTV5PMG9Ulxu/kVI0XXuIHn+jJbLkiHS/Nwudo6sp0aWR+vrlAS2RiPiAlhkzvcpNboWwEPm1pkYMK2yH5i6YXmgfTzYPtbQNq3H0JlaEw+sjgGzf+/4I2Bwpvn/aRTWon8Sgge5ybnhEVq939lZftp10sT2DxoYWJ446NhCA1JK6/1NvAYkfbNhaIXeZ/I1ENRVlSsEODyCxlmDL3BmA6i7tlBWYzZkJ5U4wfI60Q5e3YKuQuqbCUuVZji1jJBNspEs1pkn7gRmL63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxyIQc4Fb6bG6qQNXM0rV+6B2zrlK1+qb3NNenSkUvU=;
 b=QR+RRSdUtCXtrGoCH2IwOmpdsXZqJeGmQh2WNwEh9VkB7fEvV4VYNJaoPzHGfT0czpivYm8OM35jd7uPew9fWND8jrtILPHSgvW/DbNoZazf7VgOkqDH4yKwaPHCeKs/k2omLA6wKGQWfyyykLuf4Z8YrfUu1Bfcz74btbHg0NBFuov/7V0dHhYpN1h+cD2d2f/s+Jvj9DLMn/0T/g14ENsO6dU2Ulr81oQXhf8+l5wxImcPah/moThgXEWux44bP9/TFxgI9qbVb0/yEuOvxrdZ7FxinYIr5Ybc7lcv/5cn+2h40WtjjrkNig7UJ0J3wP/y6QKlu30bEf3m/KmhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxyIQc4Fb6bG6qQNXM0rV+6B2zrlK1+qb3NNenSkUvU=;
 b=j3vlrC+5HfladTqmNSmYWqdqBiYTEqWeOhrEPRR4Y1DptL+jBZaKnwex/3uD8si2NgT6fQQ/vPJZ4b/vQroAKm4X7NAX/2JU2F1TGP/KDEzIy7RewV5p+CbVMoiO6Q0UJ0iXkoRP0LuOYoFSTscrJ5d4Pq2kcVVav+5KuQcTBf8=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB5691.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:15:00 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 08:15:00 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: Re: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
Thread-Topic: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
Thread-Index: AQHZ0BtDfpzVTCaduUicOr+1137Z36/4gt6AgAChY4CAAAGugA==
Date: Thu, 24 Aug 2023 08:14:59 +0000
Message-ID: <48ed1bb6358671d8793fc505c6c9bfd23ce6d946.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <CAK7LNARQZjudwHe=u-Q1_y4HwpeamL-RiMnJ3fcPy93gaeQefA@mail.gmail.com>
 <315242e09345d492724ab115e931c667504842ff.camel@imgtec.com>
In-Reply-To: <315242e09345d492724ab115e931c667504842ff.camel@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|CWLP265MB5691:EE_
x-ms-office365-filtering-correlation-id: 46206595-d458-4e27-c29a-08dba47a35e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J1OcXsz8dgbwFa1Z8xdYOPALjlkfKTuPdQi0hPJr9nAIrCwbTxChr0TpoIoQll1MgkKPkv0vFUmU47rOsk1teIvzQA6K49G3tBN2PJH99y0jrmI7/J/9IA2k4E+8WJ4L/o4Vp77y6UI1jQCGGnTL7F6zuqDnP7ZF8Zj2/waoMdgqxm166pau9/BNKP6zjAvQisNAmLbD68sdEMvYSSLCzlPRZVppqrHrcU7haf3ZACya42kfm736/eTSSzLDvyfbOM/J1sM3enWNF7r3qVZ+vTgoY5t23nCu0bqTvN7XeVs2pWCZSo612Wop66cDxnM7gg1/Ws3Y9Yl+nHjLsBuVPlziXNMJ6ypyIlLA3Nt1eWNrfdU3kRkdioM7kHdVppla1gUDAbWvkGUrcncJENtwVMEa9RdmEu458gHnzzhY9mm5gsdjPdcZAnQBR9W7p9Qk7oMTct336/I3oK16UP0hIgJgGMepSkZrZ0rFE3owJK0wrFzQ/dBc7tGiUz+2EMOjpOX6AaZV6MLpT9lVddr4RPzYn2/7Qbnv2ETk4O080G3mvURGdJY+yefi18BMx1yKO3ZoFUfMsxUH9H/pN9ZFNg/gKr3S7ne3H0jAVv3Fg8Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39850400004)(451199024)(186009)(1800799009)(66446008)(64756008)(54906003)(66946007)(76116006)(66476007)(66556008)(316002)(6916009)(122000001)(478600001)(91956017)(26005)(38070700005)(38100700002)(71200400001)(41300700001)(53546011)(86362001)(6486002)(6506007)(2906002)(6512007)(966005)(4326008)(8676002)(8936002)(2616005)(5660300002)(7416002)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0NaSjFEVEh2Y1ZTaWU5cCtSZlY5UkI4bnhacjlNa0x5VTR3cjdGTWFmbkVP?=
 =?utf-8?B?M0hXcGpSTHo0clVNblh2S1hlb3hRTVRWYWtSL0tjSElvalhpRzB0ejR3Smph?=
 =?utf-8?B?S2dpK1RSQUlRekovSFk1Syt1ajBHaGVYTS9tVDlRdTc1ZGJYVVVNUlF2cEZP?=
 =?utf-8?B?OEFscDFkalhsK0hoT24vMmozWWxMQ1ZEMU9jRGRHZlc1Rkw1WUpXTG1JZTlz?=
 =?utf-8?B?U1Y5U3R2cHZ1TmpNMytwczBDSy93eDFkMlkzWTQrVEY2WGY4eCtPV2JLcDIr?=
 =?utf-8?B?ZUVValdMQU5XVVJUeDRvVmxmNE80SlZJVlpndit3S01RajVYc1JnQWdLQjU1?=
 =?utf-8?B?WnJ5VmllUVNKQyswdDRwbWMzdmFhaWRUTG5VaVZiZEJQcU5zMGpPRFduYVpH?=
 =?utf-8?B?YVN6N3VKa2NQQU1QbjdFQlY4R2RCUit4MkV3VVh5TjlqcmZIaHBXbXBhN2lG?=
 =?utf-8?B?SitlQ2xTSVpMMGtKSU5tMnZHSHVtYllEc0ZSZGdzQ1lpNHJCM0dEekRJVEZx?=
 =?utf-8?B?dDBxZE5ta3cwNzFta3pldzUrRjJ2Nm1Jb3pzTGVRaHp3N0lEMVBwRXNFN1h1?=
 =?utf-8?B?Y3BOQjhEcENWQXN5RnlKcEFKTHg3ajlPWWtqaWQxZy9JWFJNZW1QVGdpTDNn?=
 =?utf-8?B?RWV3Y2xmRWROK05XS1BadkxoOWJhem9xSkw2WWYvS1ozb3M0OFdVTU5qTnVO?=
 =?utf-8?B?cXJDeElIMGhrK3dnaDdGVC9iSUwycXQ2MzVkN2YxYmRJaVFMSEUrK1BUYnFv?=
 =?utf-8?B?WUpwN1BFOWkxTEd6ZG1CZHE2c1NNVFZGTlR6azNhcEk3RmZKT1dreTNEYXkr?=
 =?utf-8?B?N0FCR21HcHY3SFlIamZIb3J5TzF5M2VGYm4yaE9iQkROeS9ad2FBY3B0OVRU?=
 =?utf-8?B?eDBpb0dmSUl4UHc5NWN1WXo3ZmNzaUhhaG02TUVBRWppOW1FMitxOHZkUWQ4?=
 =?utf-8?B?a0tFT1ptbzRpSE93Q21OTTBHUFFhbFkrNmVoY1lsdC9HR1prSUphVmN5WHFH?=
 =?utf-8?B?V1hWM00xbVB6eUErd2RPRzRCcWYyUkZQSmw2T3NoVmh4ekYxZ0Q3aGk3RTR0?=
 =?utf-8?B?RCtXUnZiSFBtQUxtamhaTzFWKzdNZzRNTi8vNVpGb1dtUzFIVU9Hd2lNMFB0?=
 =?utf-8?B?Y3JhL3RiMnNuTzYrRGoxN0Yyc3A3dEY4MEVRU0F2QVlTUUJYOXkyWVladUVN?=
 =?utf-8?B?bFMyQTNRTEpnTTZNZmRteUdhQnFEeVliRVpEaittR3A0aldsWkpnWU5NbDZP?=
 =?utf-8?B?MlZ3cGNmUm4yUWJKQWJwSDYxOTVjZ01nZ0dvQjRlMjFEc1d2d2RKSk4vQ051?=
 =?utf-8?B?SnpEbTFINUY0blNBa1UzR3BVU3VQVWh6SlgwOXhRMkNHNEVTb1JiRDlLSnVy?=
 =?utf-8?B?cTk3Vmx5TnVtZHlDcHRlajExbDRqM0dxWkMzTkZlRnVkQUhWN3ZJNEkwL1VP?=
 =?utf-8?B?eHBrSC9sUGFPeWJ0MjF4dE9TVE5RV05aQ2Q0QVVoQ1dsMUsxN2ZQbTNPOE1a?=
 =?utf-8?B?RmsrWUxwNDRmSHlCaDlsKzhPdmpmWWQ3dXhWUXY5UE5XMXNZL2htVUZMVThV?=
 =?utf-8?B?dUpmb2pCUXI1eHlkMytFYWlUb3plakZwNnZDdFBTTllrWGlSWHhmdVZuTmxo?=
 =?utf-8?B?a3dnS0YrSndkY3B1aUFlT3RWbzBQR1pjRWk4YUc5Y1FUNXQ3a0tNSFliVXdy?=
 =?utf-8?B?aXFWeWtPRXVjQzBsR0x4QUg3ejhUZ2owRFFpUlpRTTBwTXRydGdEZU56V2wx?=
 =?utf-8?B?N0VzbEJoMXRrOU1GVVQ5c0JoSlBFNVUrUkt5VkwyajJ0SWR1aFlBb0pDd2NS?=
 =?utf-8?B?bUQ3WmFvdDAwMHh5bFYzSjlCaUZ6eE9XOFduclFkaGsyTllFYzlaZzYwbXB5?=
 =?utf-8?B?OUIyVWhTMWJCeFJneisyWVQvbFpxMzFBOWlUempGOFM1T2tObklQUVZ0OXdj?=
 =?utf-8?B?TC9RMnZKeWQrTzlnck8vaVpycjNPVFNER2JPTFdjRThmT0NqQ0FhTjIraHli?=
 =?utf-8?B?TzN0SGJGVUhHY2xUc0xJWlk0ZXA4WU45SUFpVWtaTEF3N1M5cmhRbXBsbDFC?=
 =?utf-8?B?NHViTDl4T28ycDRkYThUV3VueVE3YXhqSmNDSzNMckdWSm9vK1lRd2czbTll?=
 =?utf-8?B?bWZUN1VFRzI1bDNNdzlHZ1czWjFncURkTXdrL1o0d0d0a0VKVEF1eEJLUlNF?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8276DEEA12F8047A4987D5B0480620A@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46206595-d458-4e27-c29a-08dba47a35e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 08:14:59.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +InzdxDBAyYTtga4NithrPv4yEVsIv6ESrKqSb5deRPkt0DdbsFVoKj8LVM1b+ovUHh6TBT217F7T/lrGEJR4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5691
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: wh9uFhFHPRZ5JkPqf0xsTc6KszS4Srrs
X-Proofpoint-GUID: wh9uFhFHPRZ5JkPqf0xsTc6KszS4Srrs
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
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA4LTI0IGF0IDA5OjA4ICswMTAwLCBTYXJhaCBXYWxrZXIgd3JvdGU6DQo+
IE9uIFRodSwgMjAyMy0wOC0yNCBhdCAwNzozMSArMDkwMCwgTWFzYWhpcm8gWWFtYWRhIHdyb3Rl
Og0KPiA+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDQ6MzXigK9BTSBTYXJhaCBXYWxrZXIgPHNh
cmFoLndhbGtlckBpbWd0ZWMuY29tPiB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFk
ZHMgdGhlIGluaXRpYWwgRFJNIGRyaXZlciBmb3IgSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzIFBv
d2VyVlINCj4gPiA+IEdQVXMsIHN0YXJ0aW5nIHdpdGggdGhvc2UgYmFzZWQgb24gb3VyIFJvZ3Vl
IGFyY2hpdGVjdHVyZS4gSXQncyB3b3J0aCBwb2ludGluZw0KPiA+ID4gb3V0IHRoYXQgdGhpcyBp
cyBhIG5ldyBkcml2ZXIsIHdyaXR0ZW4gZnJvbSB0aGUgZ3JvdW5kIHVwLCByYXRoZXIgdGhhbiBh
DQo+ID4gPiByZWZhY3RvcmVkIHZlcnNpb24gb2Ygb3VyIGV4aXN0aW5nIGRvd25zdHJlYW0gZHJp
dmVyIChwdnJzcnZrbSkuDQo+ID4gPiANCj4gPiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IEkg
ZmFpbGVkIHRvIGNvbXBpbGUgdGhpcyBwYXRjaCBzZXQuDQo+ID4gDQo+ID4gSSBhcHBsaWVkIHRo
aXMgc2VyaWVzIHRvIGxpbnV4IG5leHQtMjAyMzA4MjIgYW5kIHNldCBDT05GSUdfRFJNX1BPV0VS
VlI9bS4NCj4gPiANCj4gPiANCj4gPiBJIGdvdCB0aGlzIGVycm9yLg0KPiA+IA0KPiA+ICAgQ0Mg
W01dICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2NjYi5vDQo+ID4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY2NiLmM6NDoNCj4g
PiBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2NjYi5oOjc6MTA6IGZhdGFsIGVycm9y
Og0KPiA+IHB2cl9yb2d1ZV9md2lmLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gPiAg
ICAgNyB8ICNpbmNsdWRlICJwdnJfcm9ndWVfZndpZi5oIg0KPiA+ICAgICAgIHwgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gY29tcGlsYXRpb24gdGVybWluYXRlZC4NCj4gDQo+IEFw
b2xvZ2llcywgaXQgYXBwZWFycyBwYXRjaCA2ICh3aGljaCBpbmNsdWRlcyB0aGlzIGFuZCBvdGhl
ciBoZWFkZXJzKSBnb3QNCj4gYmxvY2tlZCBieSBvdXIgSVQgZW1haWwgcG9saWN5LiBXaWxsIHJl
c2VuZC4NCg0KSXQgYXBwZWFycyBpdCB3YXMgc2VudCwgYnV0IG1heSBoYXZlIGJlZW4gZHJvcHBl
ZCBkdWUgdG8gc2l6ZT8gSXQncyBhdCANCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2Fy
Y2hpdmVzL2RyaS1kZXZlbC8yMDIzLUF1Z3VzdC80MTg4MDIuaHRtbC4NCkFwb2xvZ2llcyBmb3Ig
dGhlIGNvbmZ1c2lvbi4NCg0KU2FyYWgNCg==
