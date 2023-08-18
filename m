Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE8780DD8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 16:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31E89B62;
	Fri, 18 Aug 2023 14:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59A110E002
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 14:19:31 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37I7Dd4g020893; Fri, 18 Aug 2023 15:19:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=ZoX6Qy46IyrqqMs6taAbtcyFBzcFgcdcpv/bgYP2nbE=; b=
 yoJPUh1GbrEBn76ntdAjLFVtUzTFSsr3SVm3W57Bkw/IW21sjZDHv9OU8SROkJip
 krfHNiVSUiWJLbLf2bsXtQZxIZJBwTXBPzv6TB2v0NNH/4/Y8JuNz8vEdJas2wE9
 3AzsDh+YEGYZHVL/43RndFZ87JXGh3FJZHAO07gvENO3bhq/W7OZ+wwd8VUVbexs
 VvC9F6au+B6EW+tSpHaRQa91lqwoj7yq5S8wig2AElywKfwxc1a/Xw6WEeY1Ggve
 5jBhA0LwEAbjM1AJspHc9IbPJIRwPknbwRpiMoMx0XPnhmxVGWaxPv1yhcnpV8Ra
 HVgzenjaKuTEn/o6AfADCw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brcqdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Aug 2023 15:19:17 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 15:19:16 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 15:19:16 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgCBHnCsgPwMt3l3SL1DadajKtD08ucSCI3lRXp0VMsklinV1Fhu+cOfpsoia6yshib366t51L0FxohtMkzuh+4qO/YlAc+J8zt3LR3xNIudbnMorRHpmdumcr8SVE4Pa2hBz4Zt6tsYO5dboDIHqavpnA8Nk2vbphH/F+caJi7VJCn6fyUVYx+WOtGCsb9dvQPcRYPPKHmxvh9PGm4vKU4NTWHZk5Sj8NE2Y/P03r5YgaPrjbFp/vDPswNs3Wjrk9E3sXI8GeiKYfwf0GKVwLATJxZxkhf+gZkp587zmi/bOjDyhex6j0af0xly/6+unmoY2vIm9aK11fRRk1Sdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoX6Qy46IyrqqMs6taAbtcyFBzcFgcdcpv/bgYP2nbE=;
 b=ZEOs84jF1M2FxYuRyLTflbFxDRVJWN2FcqA1GoSrdSqlrgRv/l4HtZ5TeSHBf9rrFt5phqF6x2nsauTBubgtuQGFdN4WxM19g753RPcs/jq7s8uXZ32TejF4kY0ZJmnk2PkscO5R61EhMBvVhLnjWphsQkRt9YyT/b/9A/QFOFZOJZBGs0MYXl+ELypo04BlKE17PWfrrMtACV2Q8mI93iXzInteakW40wrf4b55NuPoq7C9C3QHmpVtxlNmyaSFDzZF0JfAqIe5FN1ZJpug6fLH3AE6wriV/ILXn0DXAXXdvGr+Io7PCPwThoZ20aCLL0V3MGkDkiTCLfRu1CrW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoX6Qy46IyrqqMs6taAbtcyFBzcFgcdcpv/bgYP2nbE=;
 b=KeddcdwJ3oIKbvSe956SeSGHM0o0s7c5fFmHnRz6+b1Ywq8T4cAILFo2cyoqLkHZp6dR0EAIGpyUF/hE0joACq1CD6qXsG86hu7bF0P6H8VVsRmakDdlon7QNbUUwznEerqwmN2VxYJsvoI47BrxwOslF6DZ+oL8nqjdqyCgGa8=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB6452.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 14:19:15 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 14:19:15 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "jannh@google.com" <jannh@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5 08/17] drm/imagination: Add GEM and VM
 related code
Thread-Topic: [EXTERNAL] Re: [PATCH v5 08/17] drm/imagination: Add GEM and VM
 related code
Thread-Index: AQHZ0BtWsM5Mo+ilDUefu6Ba2jfAhq/vF+WAgAEF0gA=
Date: Fri, 18 Aug 2023 14:19:14 +0000
Message-ID: <c07ae36e2e4cea234876a39e6c2cda0ea96d1513.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-9-sarah.walker@imgtec.com>
 <CAG48ez3260jKM_ni=fi3fS3MnLq-Z_dVzT5KDqkVEhhEpvBV1g@mail.gmail.com>
In-Reply-To: <CAG48ez3260jKM_ni=fi3fS3MnLq-Z_dVzT5KDqkVEhhEpvBV1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|CWLP265MB6452:EE_
x-ms-office365-filtering-correlation-id: efe318ee-9280-4183-3265-08db9ff61a02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EhLhOBs2h3wAAxRVh0jomFnxPY5WUdxKXrdTLv2rjseCOJ2CNbQyYvOFmcSEm2kVZwtzSkzFwKIE8YTYc5UWyLck+yAUimFTj9CbwFAIxuvSuqDOviPv67mC8gHgIqruek2gmvqC9/5r1Uu82eKiB68/qudTpUVNsD1qxY06ivS0EmOZB+S51+UMHZ3x3Stu+Q6REoUPVNE2oLeXuWyQpPjuzndt3H3/aYUtMNkfcKf+wl2IRqMCIYhzvJi7LkRc8opmVp+xVHgnuHBgcHVNPFYjs0LCnj0+KVV/egiJRwHKhIdvyXA/q3+EXr/2k1qeSFTLj8b/5SW3U2YX1kmXgR8PAnK4hyc6vNeBc5HwSa6ilpkaW3GArKCmM3ZFPYgVQqkh6AjxsA8hbb38prngJBpB5pEdLnXb1UKFORtpG87WMslVS9KGLCkO829iTvLZSvl/wz7hkmtQ4VYuQs9u4kNp/6EDPBpPwgbY5z7vADIbJcmqiIxMQdNAOrIKJ0iia6DM18F1AYA24Uuu0pM2BjO0WDUfKx/SAXCyPA76iXg+Eu/H9ucPDrLhWjTabBDnblVrVWmqk/pJlQwRKqTiLY9OaUk1DEnzFCg3XEVnex+AsIBD2Y5NFqvlPLvrZBzo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39850400004)(366004)(136003)(376002)(451199024)(1800799009)(186009)(2616005)(26005)(71200400001)(6486002)(53546011)(6506007)(6512007)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(7416002)(478600001)(41300700001)(76116006)(54906003)(64756008)(316002)(66446008)(66476007)(66556008)(66946007)(6916009)(91956017)(38070700005)(38100700002)(122000001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0dod3hWK29RRElGcS85MFlUeXpuYXAvM0hvd0FiR2JqQ01YU3hkemRORUVm?=
 =?utf-8?B?eFRxa3FzTG1YL2tNKy9HaGthb3pQY0EvMTV2T3BSZXc5b0k2TEZwMUpzb3NK?=
 =?utf-8?B?Y2RJY3RJNW1xK09rTWdHc1hSRXZaWnRZRjI4WjRjMnYzOTQwRGU5eGI3Vm5R?=
 =?utf-8?B?NktDam1IdnR4b3F5Njk3RFpPanU4T2JPRDJ1eXpMQlBnUElFOFlCM3hkYWFj?=
 =?utf-8?B?dVdEd2pwTUV2bGU5Zk9UNHhQbTJ5ZWoybUNWVElBNDV3azl3WmRodkRoOGdT?=
 =?utf-8?B?Q2ZvRUZhTEZQbGxsaGkrcU10VlhIbkVYMm9SN0RDWjhRbjdwaFdLMXVoVndC?=
 =?utf-8?B?YTBJb1hVKy9wOVBOd2o4T1A2bEEzbkoyY04wbUpjZXlhYkgzcGpBREFlZ3hr?=
 =?utf-8?B?blUwMW5aZjBGTURyNk90R05YZzc2TXFZVy9Xaml4ajFSeTJTb0dGUHBDK2h3?=
 =?utf-8?B?RVRId2plRnNyekVVUXVUWTd1SGF6UE1nbTJNZXF6aVhiSjVCTGVRZ2NXeEV3?=
 =?utf-8?B?TDNSUkFLWWNFdWVhMmxOUzIvcnZVOVBFdlpuSkpkbWZYMkh4eU5oK1lJZzNn?=
 =?utf-8?B?K1ZyRmMvSW4rRnJLdmVuZUI0dU5WVG8rL2xJNDNWd1VydWRaSXVLMkVvQlI4?=
 =?utf-8?B?SnBEQ2psRHpkS1J3S0UwcTByeWVkOXl2U1l5MUVHMGlNT25ya2h1Z1Bia3NE?=
 =?utf-8?B?UUl3YVZkU2JKaEFCSW5VaDBLckxwRHNYUHQ1ZVliNkdCME8wSzNNaVFnTnhL?=
 =?utf-8?B?N3IwVlB2elBnUUJBVDVvOEd2QXlEaldQRTh6TnE4Q1Uyd3BubDJYQU9rUDJw?=
 =?utf-8?B?OHIwYWVmdEUwZEJoRUMxT1hzWGpXa0dGNTllMmxrUWU3bFdqTkw2VmwvLzVK?=
 =?utf-8?B?TTBFbzNUNlpNQ292S2tLSUMyRHpzVS9zQ3ZqY0lvMGRIdTUxNG40Znkyc3Y4?=
 =?utf-8?B?OTZwelAwQmc2dnp1TFo0QmRkdDRuaU0yNGxqMVpSMXQ3akU2Qk81cjhSOVJT?=
 =?utf-8?B?cWNJczFSQTJucnNvQ1JBbXBrc25ramlBbHk4dkRLa2dIbFA1UWhBbDFNdlEv?=
 =?utf-8?B?UldoczJORmdoRlh2c2MwRnQwVTNMaTQ4U3RmNUNXa0V3TnJWZ293OFRmZmRW?=
 =?utf-8?B?dVBvRUQ0QWNjNnhTTlo5ODEwY3AvbzlhaFdGdDBnYVdXOEdlMTlnM1NJWUIz?=
 =?utf-8?B?OGJxK0lJN2xTSng3Z2JTOGJOaUo2QkcrSWdSQThNV29XaEhSczlyK1pibUZx?=
 =?utf-8?B?RHFVMGJ4ZWptbmthZVFEd0dJTmVHaDBJWDVra2NWaDJyMy9XVW5kUExuQnph?=
 =?utf-8?B?VG9RbHJFc3JiUGQ5RmZtWFFlV1VqWjRSWFB6aVdXYzJjeHZrbjJNVW54RTlm?=
 =?utf-8?B?SlQ2ZGZESXFnRmlsb3V5c3lVTzd3SEhROFNzVG02cTc0RFZWNDIvMU5rWUZ0?=
 =?utf-8?B?clBjMktwcUQ4WW5GdDJtUk5GTjJSeUw5bDMrSkcxemNJUUhieGFEM2ptbklJ?=
 =?utf-8?B?YzdKelB4QVhxUnBJNkpoMitHaE90VmZjTkV4YWRhbWpyMmpCTGtiTjVaYmFX?=
 =?utf-8?B?RFRaQUtXWmJxQXZ1cmh1dVNJQzhOMmI5M24yNjVTMGg5OTRWNFBNUDcyTm5N?=
 =?utf-8?B?VGVuczRzSWRRamhoWVVvbmxFZTZ2MTlxbG96eWY1NjBnT2dheDdaM1hzVjZx?=
 =?utf-8?B?UjRvaFpvaDJaanVOTG9YUGVuUkl3SmdsMU5hYnhRRnlBZGNxNDVHNFBraGo2?=
 =?utf-8?B?eWZPbkkrUmZ2dFdma2pibncxMzc3YS9DRFMycERYZkdMb0Nhd0JMWlJMR1N5?=
 =?utf-8?B?Um90OWYwaE13aWY2MERaT0hhT0ZHTUl3VGcxYnA4MXVIdCt1TFBFRzZtQlhz?=
 =?utf-8?B?aGZZUVh3czlRVlRrL0o0V3VrYjU3dC9CbFliRXZua3U2a3NJZ1dMcmJ2TUJm?=
 =?utf-8?B?TE9SNEd0OEUyemo5c0x6THU1dld1eW9nNXIwWHViMkxFb0JqdFdjZXdLT3hx?=
 =?utf-8?B?YmlhQlMvRlVKTHBCeFBtMllGVEFNU0twemMzYkFyZ0VZb3lZV3lvOUNocmV3?=
 =?utf-8?B?OEtuN2V2OW1YN2dtM2ZzWnIzU0pMMjB0T2hLK2F5amNucDc1dGlzNzAybkpE?=
 =?utf-8?B?K1I5MlpPMlR0OXo2WmtTUWNpTWZLVlpDWkxMS2owS05Wd08vcXorWjI3TFhP?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD88B7DC1D171F468A34985228670C8E@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efe318ee-9280-4183-3265-08db9ff61a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 14:19:14.9681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+e+2zmSTedP3JI0LGQ1CQAXnPCYSfD+3EVfNd4cJ9b07zgLFaTJyyaT0LZ3AYSP5P5IQM2SEIK1Z+G80xd1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6452
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: fVabkErBM_QrvcfEg3IePEvXu1P1MBN3
X-Proofpoint-GUID: fVabkErBM_QrvcfEg3IePEvXu1P1MBN3
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA4LTE4IGF0IDAwOjQyICswMjAwLCBKYW5uIEhvcm4gd3JvdGU6DQo+ICoq
KiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJjZSBub3Qga25vd24g
dG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91IGNsaWNrIGEgbGlu
ayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBIaSENCj4gDQo+IFRoYW5rcywgSSB0
aGluayBpdCdzIGdyZWF0IHRoYXQgSW1hZ2luYXRpb24gaXMgd3JpdGluZyBhbiB1cHN0cmVhbQ0K
PiBkcml2ZXIgZm9yIFBvd2VyVlIuIDopDQo+IA0KPiBPbiBXZWQsIEF1ZyAxNiwgMjAyMyBhdCAx
MDoyNeKAr0FNIFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+IHdyb3RlOg0K
PiA+ICsjZGVmaW5lIFBWUl9CT19DUFVfQ0FDSEVEIEJJVF9VTEwoNjMpDQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIFBWUl9CT19GV19OT19DTEVBUl9PTl9SRVNFVCBCSVRfVUxMKDYyKQ0KPiA+ICsNCj4g
PiArLyogQml0cyA2Mi4uMyBhcmUgdW5kZWZpbmVkLiAqLw0KPiA+ICsvKiBCaXRzIDIuLjAgYXJl
IGRlZmluZWQgaW4gdGhlIFVBUEkuICovDQo+ID4gKw0KPiA+ICsvKiBPdGhlciB1dGlsaXRpZXMu
ICovDQo+ID4gKyNkZWZpbmUgUFZSX0JPX1VOREVGSU5FRF9NQVNLIEdFTk1BU0tfVUxMKDYxLCAz
KQ0KPiA+ICsjZGVmaW5lIFBWUl9CT19SRVNFUlZFRF9NQVNLIChQVlJfQk9fVU5ERUZJTkVEX01B
U0sgfCBHRU5NQVNLX1VMTCg2MywgNjMpKQ0KPiANCj4gSW4gY29tbWl0IDFhOWM1NjhmYjU1OSAo
ImRybS9pbWFnaW5hdGlvbjogUmV3b3JrIGZpcm13YXJlIG9iamVjdA0KPiBpbml0aWFsaXNhdGlv
biIpIGluIHBvd2VydnItbmV4dCwgUFZSX0JPX0ZXX05PX0NMRUFSX09OX1JFU0VUIChiaXQgNjIp
DQo+IHdhcyBhZGRlZCBpbiB0aGUga2VybmVsLW9ubHkgZmxhZ3MgZ3JvdXAsIGJ1dCB0aGUgbWFz
aw0KPiBQVlJfQk9fUkVTRVJWRURfTUFTSyAod2hpY2ggaXMgdXNlZCBpbiBwdnJfaW9jdGxfY3Jl
YXRlX2JvIHRvIGRldGVjdA0KPiBrZXJuZWwtb25seSBhbmQgcmVzZXJ2ZWQgZmxhZ3MpIGxvb2tz
IGxpa2UgaXQgd2Fzbid0IGNoYW5nZWQgdG8NCj4gaW5jbHVkZSBiaXQgNjIuIEkgdGhpbmsgdGhh
dCBtZWFucyBpdCBiZWNvbWVzIHBvc3NpYmxlIGZvciB1c2Vyc3BhY2UNCj4gdG8gcGFzcyB0aGlz
IGJpdCBpbiB2aWEgcHZyX2lvY3RsX2NyZWF0ZV9ibygpPw0KDQpZZXMsIHRoaXMgaXMgYSBidWcu
IFdpbGwgZml4IChhbmQgcmVmYWN0b3IgYSBiaXQpLg0KDQo+ID4gKy8qKg0KPiA+ICsgKiBwdnJf
cGFnZV90YWJsZV9sMl9lbnRyeV9yYXdfc2V0KCkgLSBXcml0ZSBhIHZhbGlkIGVudHJ5IGludG8g
YSByYXcgbGV2ZWwgMg0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYWdlIHRhYmxlLg0KPiA+ICsgKiBAZW50cnk6IFRhcmdldCByYXcgbGV2ZWwgMiBwYWdlIHRh
YmxlIGVudHJ5Lg0KPiA+ICsgKiBAY2hpbGRfdGFibGVfZG1hX2FkZHI6IERNQSBhZGRyZXNzIG9m
IHRoZSBsZXZlbCAxIHBhZ2UgdGFibGUgdG8gYmUNCj4gPiArICogICAgICAgICAgICAgICAgICAg
ICAgICBhc3NvY2lhdGVkIHdpdGggQGVudHJ5Lg0KPiA+ICsgKg0KPiA+ICsgKiBXaGVuIGNhbGxp
bmcgdGhpcyBmdW5jdGlvbiwgQGNoaWxkX3RhYmxlX2RtYV9hZGRyIG11c3QgYmUgYSB2YWxpZCBE
TUENCj4gPiArICogYWRkcmVzcyBhbmQgYSBtdWx0aXBsZSBvZiAlUk9HVUVfTU1VQ1RSTF9QQ19E
QVRBX1BEX0JBU0VfQUxJR05TSVpFLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIHZvaWQNCj4gPiAr
cHZyX3BhZ2VfdGFibGVfbDJfZW50cnlfcmF3X3NldChzdHJ1Y3QgcHZyX3BhZ2VfdGFibGVfbDJf
ZW50cnlfcmF3ICplbnRyeSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRt
YV9hZGRyX3QgY2hpbGRfdGFibGVfZG1hX2FkZHIpDQo+ID4gK3sNCj4gPiArICAgICAgIGNoaWxk
X3RhYmxlX2RtYV9hZGRyID4+PSBST0dVRV9NTVVDVFJMX1BDX0RBVEFfUERfQkFTRV9BTElHTlNI
SUZUOw0KPiA+ICsNCj4gPiArICAgICAgIGVudHJ5LT52YWwgPQ0KPiA+ICsgICAgICAgICAgICAg
ICBQVlJfUEFHRV9UQUJMRV9GSUVMRF9QUkVQKDIsIFBDLCBWQUxJRCwgdHJ1ZSkgfA0KPiA+ICsg
ICAgICAgICAgICAgICBQVlJfUEFHRV9UQUJMRV9GSUVMRF9QUkVQKDIsIFBDLCBFTlRSWV9QRU5E
SU5HLCBmYWxzZSkgfA0KPiA+ICsgICAgICAgICAgICAgICBQVlJfUEFHRV9UQUJMRV9GSUVMRF9Q
UkVQKDIsIFBDLCBQRF9CQVNFLCBjaGlsZF90YWJsZV9kbWFfYWRkcik7DQo+ID4gK30NCj4gDQo+
IEZvciB0aGlzIGZ1bmN0aW9uIGFuZCBvdGhlcnMgdGhhdCBtYW5pcHVsYXRlIHBhZ2UgdGFibGUg
ZW50cmllcywNCj4gcGxlYXNlIHVzZSBzb21lIGtlcm5lbCBoZWxwZXIgdGhhdCBlbnN1cmVzIHRo
YXQgdGhlIHN0b3JlIGNhbid0IHRlYXINCj4gKGF0IGxlYXN0IFdSSVRFX09OQ0UoKSAtIHRoYXQg
Y2FuIHN0aWxsIHRlYXIgb24gMzItYml0LCBidXQgSSBzZWUgdGhlDQo+IGRyaXZlciBkZXBlbmRz
IG9uIEFSTTY0LCBzbyB0aGF0J3Mgbm90IGEgcHJvYmxlbSkuDQoNCldpbGwgZG8uDQoNCj4gPiAr
LyoqDQo+ID4gKyAqIHB2cl9wYWdlX3RhYmxlX2wyX2luc2VydCgpIC0gSW5zZXJ0IGFuIGVudHJ5
IHJlZmVycmluZyB0byBhIGxldmVsIDEgcGFnZQ0KPiA+ICsgKiB0YWJsZSBpbnRvIGEgbGV2ZWwg
MiBwYWdlIHRhYmxlLg0KPiA+ICsgKiBAb3BfY3R4OiBUYXJnZXQgTU1VIG9wIGNvbnRleHQgcG9p
bnRpbmcgYXQgdGhlIGVudHJ5IHRvIGluc2VydCB0aGUgTDEgcGFnZQ0KPiA+ICsgKiB0YWJsZSBp
bnRvLg0KPiA+ICsgKiBAY2hpbGRfdGFibGU6IFRhcmdldCBsZXZlbCAxIHBhZ2UgdGFibGUgdG8g
YmUgcmVmZXJlbmNlZCBieSB0aGUgbmV3IGVudHJ5Lg0KPiA+ICsgKg0KPiA+ICsgKiBJdCBpcyB0
aGUgY2FsbGVyJ3MgcmVzcG9uc2liaWxpdHkgdG8gZW5zdXJlIEBvcF9jdHguY3Vycl9wYWdlIHBv
aW50cyB0byBhDQo+ID4gKyAqIHZhbGlkIEwyIGVudHJ5Lg0KPiA+ICsgKi8NCj4gPiArc3RhdGlj
IHZvaWQNCj4gPiArcHZyX3BhZ2VfdGFibGVfbDJfaW5zZXJ0KHN0cnVjdCBwdnJfbW11X29wX2Nv
bnRleHQgKm9wX2N0eCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHB2cl9w
YWdlX3RhYmxlX2wxICpjaGlsZF90YWJsZSkNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IHB2
cl9wYWdlX3RhYmxlX2wyICpsMl90YWJsZSA9DQo+ID4gKyAgICAgICAgICAgICAgICZvcF9jdHgt
Pm1tdV9jdHgtPnBhZ2VfdGFibGVfbDI7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcHZyX3BhZ2VfdGFi
bGVfbDJfZW50cnlfcmF3ICplbnRyeV9yYXcgPQ0KPiA+ICsgICAgICAgICAgICAgICBwdnJfcGFn
ZV90YWJsZV9sMl9nZXRfZW50cnlfcmF3KGwyX3RhYmxlLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wX2N0eC0+Y3Vycl9wYWdlLmwyX2lkeCk7
DQo+ID4gKw0KPiA+ICsgICAgICAgcHZyX3BhZ2VfdGFibGVfbDJfZW50cnlfcmF3X3NldChlbnRy
eV9yYXcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoaWxk
X3RhYmxlLT5iYWNraW5nX3BhZ2UuZG1hX2FkZHIpOw0KPiANCj4gQ2FuIHlvdSBtYXliZSBhZGQg
Y29tbWVudHMgaW4gZnVuY3Rpb25zIHRoYXQgc2V0IHBhZ2UgdGFibGUgZW50cmllcyB0bw0KPiBk
b2N1bWVudCB3aG8gaXMgcmVzcG9uc2libGUgZm9yIHVzaW5nIGEgbWVtb3J5IGJhcnJpZXIgKGxp
a2Ugd21iKCkpIHRvDQo+IGVuc3VyZSB0aGF0IHRoZSBjcmVhdGlvbiBvZiBhIHBhZ2UgdGFibGUg
ZW50cnkgaXMgb3JkZXJlZCBhZnRlciB0aGUNCj4gdGhpbmcgaXQgcG9pbnRzIHRvIGlzIGZ1bGx5
IGluaXRpYWxpemVkLCBzbyB0aGF0IHRoZSBHUFUgY2FuJ3QgZW5kIHVwDQo+IGNvbmN1cnJlbnRs
eSB3YWxraW5nIGludG8gYSBwYWdlIHRhYmxlIGFuZCBvYnNlcnZlIGl0cyBvbGQgY29udGVudHMN
Cj4gZnJvbSBiZWZvcmUgaXQgd2FzIHplcm8taW5pdGlhbGl6ZWQ/DQoNCldpbGwgZG8uDQoNCj4g
PiArc3RhdGljIGludA0KPiA+ICtwdnJfcGFnZV90YWJsZV9sMV9nZXRfb3JfaW5zZXJ0KHN0cnVj
dCBwdnJfbW11X29wX2NvbnRleHQgKm9wX2N0eCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgc2hvdWxkX2luc2VydCkNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0
IHB2cl9wYWdlX3RhYmxlX2wyICpsMl90YWJsZSA9DQo+ID4gKyAgICAgICAgICAgICAgICZvcF9j
dHgtPm1tdV9jdHgtPnBhZ2VfdGFibGVfbDI7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcHZyX3BhZ2Vf
dGFibGVfbDEgKnRhYmxlOw0KPiA+ICsgICAgICAgaW50IGVycjsNCj4gPiArDQo+ID4gKyAgICAg
ICBpZiAocHZyX3BhZ2VfdGFibGVfbDJfZW50cnlfaXNfdmFsaWQobDJfdGFibGUsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3BfY3R4LT5jdXJyX3Bh
Z2UubDJfaWR4KSkgew0KPiA+ICsgICAgICAgICAgICAgICBvcF9jdHgtPmN1cnJfcGFnZS5sMV90
YWJsZSA9DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbDJfdGFibGUtPmVudHJpZXNbb3Bf
Y3R4LT5jdXJyX3BhZ2UubDJfaWR4XTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+
ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKCFzaG91bGRfaW5zZXJ0KQ0KPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOw0KPiA+ICsNCj4gPiArICAgICAgIC8qIFRh
a2UgYSBwcmVhbGxvY2VkIHRhYmxlLiAqLw0KPiA+ICsgICAgICAgdGFibGUgPSBvcF9jdHgtPmwx
X2ZyZWVfdGFibGVzOw0KPiA+ICsgICAgICAgaWYgKCF0YWJsZSkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgICAgZXJyID0gcHZyX3BhZ2VfdGFi
bGVfbDFfaW5pdCh0YWJsZSwgb3BfY3R4LT5tbXVfY3R4LT5wdnJfZGV2KTsNCj4gDQo+IEkgdGhp
bmsgd2hlbiB3ZSBoYXZlIGEgcHJlYWxsb2NhdGVkIHRhYmxlIGhlcmUsIGl0IHdhcyBhbGxvY2F0
ZWQgaW4NCj4gcHZyX3BhZ2VfdGFibGVfbDFfYWxsb2MoKSwgd2hpY2ggYWxyZWFkeSBjYWxsZWQN
Cj4gcHZyX3BhZ2VfdGFibGVfbDFfaW5pdCgpPyBTbyBpdCBsb29rcyB0byBtZSBsaWtlIHRoaXMg
c2Vjb25kDQo+IHB2cl9wYWdlX3RhYmxlX2wxX2luaXQoKSBjYWxsIHdpbGwgYWxsb2NhdGUgYW5v
dGhlciBwYWdlIGFuZCBsZWFrIHRoZQ0KPiBvbGQgYWxsb2NhdGlvbi4NCg0KWWVzLCB0aGlzIGlz
IGFsc28gYSBidWcuIFdpbGwgYWRkcmVzcy4NCg0KPiArLyoqDQo+ID4gKyAqIHB2cl9tbXVfb3Bf
Y29udGV4dF9jcmVhdGUoKSAtIENyZWF0ZSBhbiBNTVUgb3AgY29udGV4dC4NCj4gPiArICogQGN0
eDogTU1VIGNvbnRleHQgYXNzb2NpYXRlZCB3aXRoIG93bmluZyBWTSBjb250ZXh0Lg0KPiA+ICsg
KiBAc2d0OiBTY2F0dGVyIGdhdGhlciB0YWJsZSBjb250YWluaW5nIHBhZ2VzIHBpbm5lZCBmb3Ig
dXNlIGJ5IHRoaXMgY29udGV4dC4NCj4gPiArICogQHNndF9vZmZzZXQ6IFN0YXJ0IG9mZnNldCBv
ZiB0aGUgcmVxdWVzdGVkIGRldmljZS12aXJ0dWFsIG1lbW9yeSBtYXBwaW5nLg0KPiA+ICsgKiBA
c2l6ZTogU2l6ZSBpbiBieXRlcyBvZiB0aGUgcmVxdWVzdGVkIGRldmljZS12aXJ0dWFsIG1lbW9y
eSBtYXBwaW5nLiBGb3IgYW4NCj4gPiArICogdW5tYXBwaW5nLCB0aGlzIHNob3VsZCBiZSB6ZXJv
IHNvIHRoYXQgbm8gcGFnZSB0YWJsZXMgYXJlIGFsbG9jYXRlZC4NCj4gPiArICoNCj4gPiArICog
UmV0dXJuczoNCj4gPiArICogICogTmV3bHkgY3JlYXRlZCBNTVUgb3AgY29udGV4dCBvYmplY3Qg
b24gc3VjY2Vzcywgb3INCj4gPiArICogICogLSVFTk9NRU0gaWYgbm8gbWVtb3J5IGlzIGF2YWls
YWJsZSwNCj4gPiArICogICogQW55IGVycm9yIGNvZGUgcmV0dXJuZWQgYnkgcHZyX3BhZ2VfdGFi
bGVfbDJfaW5pdCgpLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHB2cl9tbXVfb3BfY29udGV4dCAq
DQo+ID4gK3B2cl9tbXVfb3BfY29udGV4dF9jcmVhdGUoc3RydWN0IHB2cl9tbXVfY29udGV4dCAq
Y3R4LCBzdHJ1Y3Qgc2dfdGFibGUgKnNndCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
IHU2NCBzZ3Rfb2Zmc2V0LCB1NjQgc2l6ZSkNCj4gPiArew0KPiA+ICsgICAgICAgaW50IGVycjsN
Cj4gPiArDQo+ID4gKyAgICAgICBzdHJ1Y3QgcHZyX21tdV9vcF9jb250ZXh0ICpvcF9jdHggPQ0K
PiA+ICsgICAgICAgICAgICAgICBremFsbG9jKHNpemVvZigqb3BfY3R4KSwgR0ZQX0tFUk5FTCk7
DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKCFvcF9jdHgpDQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ICsNCj4gPiArICAgICAgIG9wX2N0eC0+bW11X2N0
eCA9IGN0eDsNCj4gPiArICAgICAgIG9wX2N0eC0+bWFwLnNndCA9IHNndDsNCj4gPiArICAgICAg
IG9wX2N0eC0+bWFwLnNndF9vZmZzZXQgPSBzZ3Rfb2Zmc2V0Ow0KPiA+ICsgICAgICAgb3BfY3R4
LT5zeW5jX2xldmVsX3JlcXVpcmVkID0gUFZSX01NVV9TWU5DX0xFVkVMX05PTkU7DQo+ID4gKw0K
PiA+ICsgICAgICAgaWYgKHNpemUpIHsNCj4gPiArICAgICAgICAgICAgICAgY29uc3QgdTMyIGwx
X3N0YXJ0X2lkeCA9IHB2cl9wYWdlX3RhYmxlX2wyX2lkeChzZ3Rfb2Zmc2V0KTsNCj4gPiArICAg
ICAgICAgICAgICAgY29uc3QgdTMyIGwxX2VuZF9pZHggPSBwdnJfcGFnZV90YWJsZV9sMl9pZHgo
c2d0X29mZnNldCArIHNpemUpOw0KPiA+ICsgICAgICAgICAgICAgICBjb25zdCB1MzIgbDFfY291
bnQgPSBsMV9lbmRfaWR4IC0gbDFfc3RhcnRfaWR4ICsgMTsNCj4gPiArICAgICAgICAgICAgICAg
Y29uc3QgdTMyIGwwX3N0YXJ0X2lkeCA9IHB2cl9wYWdlX3RhYmxlX2wxX2lkeChzZ3Rfb2Zmc2V0
KTsNCj4gPiArICAgICAgICAgICAgICAgY29uc3QgdTMyIGwwX2VuZF9pZHggPSBwdnJfcGFnZV90
YWJsZV9sMV9pZHgoc2d0X29mZnNldCArIHNpemUpOw0KPiA+ICsgICAgICAgICAgICAgICBjb25z
dCB1MzIgbDBfY291bnQgPSBsMF9lbmRfaWR4IC0gbDBfc3RhcnRfaWR4ICsgMTsNCj4gDQo+IFNo
b3VsZG4ndCB0aGUgcGFnZSB0YWJsZSBpbmRpY2VzIGJlIGNhbGN1bGF0ZWQgZnJvbSB0aGUgZGV2
aWNlX2FkZHINCj4gKHdoaWNoIGlzIG5vdCBjdXJyZW50bHkgcGFzc2VkIGluIGJ5IHB2cl92bV9t
YXAoKSk/IEFzIGZhciBhcyBJIGNhbg0KPiB0ZWxsLCBzZ3Rfb2Zmc2V0IGRvZXNuJ3QgaGF2ZSBh
bnl0aGluZyB0byBkbyB3aXRoIHRoZSBkZXZpY2UgYWRkcmVzcw0KPiBhdCB3aGljaCB0aGlzIG1h
cHBpbmcgd2lsbCBiZSBpbnNlcnRlZCBpbiB0aGUgcGFnZSB0YWJsZXM/DQoNClRoaXMgY29kZSBp
cyBjb3JyZWN0LCBidXQgYmFkbHkgZG9jdW1lbnRlZDsgdGhpcyBmdW5jdGlvbiBvbmx5IGNhcmVz
IGFib3V0IHRoZQ0KbnVtYmVyIG9mIGwwL2wxIHBhZ2VzIHJlcXVpcmVkLCBub3QgdGhlIGFkZHJl
c3MuIFdpbGwgaW1wcm92ZSBpdCB0byBtYWtlIGxlc3MNCmNvbmZ1c2luZy4NCg0KVGhhbmtzLA0K
U2FyYWgNCg==
