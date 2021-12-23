Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8BF47E12B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 11:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1291010E2DA;
	Thu, 23 Dec 2021 10:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8010E1AB;
 Thu, 23 Dec 2021 10:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=earLdTLTdo6Sd5IrYpD0XJZd6QCuaKiiyTQVsNynyp22SNmP1xJfQntCkEn1ZEpw0KSxIMwHaNJa+Evm0RLt3VzVMOYssZZLKm7fUZl8lODBcV1XbzBYzV7lAIai7t3PvD4KqFCLh9BteFcXN4tyJRA9leF0FkjSqWBO9Zb43SCN4iDaVLsx5sglcwtXQ36h70+WAMtxZXxg5WpXR0SwlRGEB5uvzsmyB2VUCsrRK/K7ZO/60pR7vY9qud7MdArr8BCmsZf4zyjPzTKrHuqOIz1q1GrZpm5nAe4bmCD8e7bmZUoEHfSm5x5RNHe/oygxx2tinuIZb6vGqtSoz9upuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQn5kj2qnRnJ6w+QtYe5NboWq0CJPzynykVjOpMNYz0=;
 b=lJ/sh4HSFC1EZvSICZOheaDN4WFwrsJqxZSpQ230SdaDZdyC/KKWbl23wtlcFu5Kha4aqssqzbss4aEuC4gsXpntTL0O5NwC+5EVKoXe6xNTLwAkTz/GCLBpKcHxu+L9eCnusI5rodoL+WTlppq6EZUIqgDkMo+LKOctk5pxlZl/J+bjbmXJDvWF8TwFY2MQ8wDPN4pn6Za1Vl767p1igCLxtxvI3cdscBp9yt6j6DzmPdPCmP7Fau8RFI//tZ4N9L+xmjF9TSJzogdAgrsS+6LfSElyZqdmkM2KWdFwjIIAZL99Rfh4GGxmoc/0FBsE1F4LRDhle9Z8dtVbL+AeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQn5kj2qnRnJ6w+QtYe5NboWq0CJPzynykVjOpMNYz0=;
 b=kniS0pwLfVgvmVenwamLeWBjSsY+YDS3Dg0GQrLdn8O6AuU01bCucaDltDboJdtYs5bfug1vs2vTpQjqtcZI2b2E07BlZQbNzTh1b9eSFrKgqSNOPD1K1RmHQqUfJGDJRbeggTpE9FdWK8l+Av8L7VBkW8HlhpMteQkOAUkZJfA=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL0PR12MB5538.namprd12.prod.outlook.com (2603:10b6:208:1c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 10:14:23 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::a8bc:68c:4884:a295]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::a8bc:68c:4884:a295%8]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 10:14:23 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>, "Chen, 
 JingWen" <JingWen.Chen2@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>
Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Topic: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Index: AQHX94FGE4c1XsbZP0iJRWnNhmV4jaw/wv+AgAAZmFA=
Date: Thu, 23 Dec 2021 10:14:23 +0000
Message-ID: <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
In-Reply-To: <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Horace.Chen@amd.com,JingWen.Chen2@amd.com,Emily.Deng@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-23T10:13:59Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=f7dafa8d-8379-49fe-a66f-b373c63741f5;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-23T10:14:21Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: ff1da25a-0e40-460f-862e-565669284c31
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 461d9d3e-e5c4-4b5e-fb6f-08d9c5fcfe16
x-ms-traffictypediagnostic: BL0PR12MB5538:EE_
x-microsoft-antispam-prvs: <BL0PR12MB553888E805E70705F88D272C847E9@BL0PR12MB5538.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VP4ncKjKSvd5vZgjrCO3dl4Gx80LHofAiNaQU72Q64Ts5cY8plTzQUmxZx/BC4cjYdyT7P8vU7Q6K0D0WD7Or/QvuXpW6oA9vNOtFOP1lBPdedLXWKpzpNLkLRBUfNzURI/6WZ5xOXPMpClUFw2JKGWZDq5jPbPfiJqLMMCkSyLSdEsUZU/qdXg84z1acHGfyx6KIJxGzjGMbQD33ROG4X6hxxykUhfI2kWT6n3ZXR0EMyEICA/znPyjt0pQPiI4DVmnxyWdlOJsqF2QJ4/0G/1ZYM2Vof95+5ExpPqDocmtKc6lv2mYfIiYaLbASkYMyRyPJDgRGk6qfvdzXqvUEEzINyoloW0OQ6Du+6FlsK6T1aNeGDd/U0KZU97bhN0i+wM1+GNg34IzwvNCiMWe7+eDWfBWG20Bk7FDZHP1vvn3xGgsoa+t138Qzv1mjWXldxNtBJ3L2AVnbZFaUmFOyQ2abXVKGC+JzW9YB3W2bZZgM8cQCnhEA1kjy1UQXIBKFrhwAS089V5omu+zIstqIxessoB5U+4cYSPhu7TBjeeam1qS3HgMjQpNuIUT3YmsGoBHqNDZoj1ghx3i5cmk7KH0/jU70GUiJNXJp/C96d4cdq0itR4AFyrcdPWSaZRMLuxGsPY0xG0uQGh4wrn2IfaPnkuuzXZqHFe30ek+EKdiFGzt/yATC4mxCyGclxPg3BdQY5C5eHkS+HG/8OwOUtxMiWIjJtrXfA/Q1ei+V7k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(186003)(6506007)(64756008)(2906002)(26005)(38070700005)(66946007)(9686003)(921005)(76116006)(5660300002)(508600001)(66574015)(66446008)(66476007)(83380400001)(66556008)(38100700002)(122000001)(33656002)(55016003)(316002)(7696005)(4326008)(71200400001)(8676002)(110136005)(6636002)(8936002)(52536014)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUV1ZkZldVBJT0tiTmI4SExSanFTdk0rTWxOWVNxWEpJQWxDSkdSbkJZMG9Z?=
 =?utf-8?B?YUxxdmdaT1lSWGxwU01DSk9TUzA1b2o0YjJWUTMyTWhVTFd2cW96SzdLUVhI?=
 =?utf-8?B?aCtOTXFxTVhndmJDd0pXV3ZvZXVZaU91b2R5NVd6aHRKaXc5NzBZeU15OGp1?=
 =?utf-8?B?TzZLOVg5K2JkalRpUmNRUUdBQXV6eENyejBER2NaWktuUjhpZ2xrL0xEc2lC?=
 =?utf-8?B?akptb1NMUWxkU2NuczJxOTZ5cjRsUnB4VGUxeGhrRUIyanVMZFFid21Od0ZR?=
 =?utf-8?B?eXJ0cnY0d2htWUhaZDVUYXJ4eFEvK0J1MGNiazVyNjVrU2RURHpCSXVESWx2?=
 =?utf-8?B?Q04rUnFQamFCc2xzSkpkbVBTNDlZV3hmTGxYRHJVTkxlK2h3U2VKVDJWR1pj?=
 =?utf-8?B?MWxrYlNqRGF5Q3cvRUl4SVBHRCtVaE5LRVF1N0VaelhNVWtvVGpNWVMwNGRF?=
 =?utf-8?B?eDl4S3BwZTEvU3pTRzJicDFtQk5ONjAraEQxUVBjS2d1MmxLTEUzQ29SOFY0?=
 =?utf-8?B?eWlPblM4RStzV0NDZnk2RExHT0xDUE8xa1ZQZXJGTWhMWHdSK3RvQk0zcTRJ?=
 =?utf-8?B?MVFtd0RIVHRCUTRMdEdWSlhaVzNzL0VOTkJLNUwrWFlURVZROVRyaGhHbTNZ?=
 =?utf-8?B?c1ZqM2t1WXBlaEE4anhUK2NTYkpVcExpaWc3OUp4aWxHZ09KS3RIWHYzbkZJ?=
 =?utf-8?B?T1h6d05BOUczZXZPWVJoTy8xS3FKbTltNEduOXRid2VxOWVCRWEwWE5GK3NG?=
 =?utf-8?B?RW5NaDZZRHpmMTA5Y2xrSlJGY2tsbjRFWTlHcmRLS1QvK3dnbjB2YkR1aEpR?=
 =?utf-8?B?cGI5eE1xQWY0ek9vVlZIMnU2RVFoL1AxdUlwaUtkcnREM0tPNE5zemptb2w3?=
 =?utf-8?B?WXVoS3dXeW5Vb2FEVTloekFlbjU5ZFdXQkFlZkNWRENaVDRuYSs1ZmJQR1RI?=
 =?utf-8?B?dXdhSFhiSnFYNHBTWTZlbkVidjJuaHZMTnBmc1V2aXF0VU5NNGRyczJoMEZL?=
 =?utf-8?B?SXk0TG8zZ1FIekhld0VyQ1p6eFNjUEdxRkJkVmMzcXh3Q1QvUGdtMjdKWGVV?=
 =?utf-8?B?TEIyMXdBUFJ2NHdrSi9wc2F4Yk1mRTlnWGtHNndpTFdtOGxMbTkxZjFOa2lx?=
 =?utf-8?B?RmlrRlZ2Z3JhbnoyWU1RTVZ5S2ZKMnFDTkN4TDdFVlFlZDVINFJ6WFp5SjZm?=
 =?utf-8?B?MmN4UUVQVk9zL2xJOEIzUDU4WmdCbGxBUk5TMU94dEkvb3RwakhLWmg0ZHE3?=
 =?utf-8?B?UjNYU3NINjdVdklpeEVDOXVQYUZZUjVKbStscWZkdnZYaDhlOUNzZUx4Rm04?=
 =?utf-8?B?Vld6RHIxNHQ5Y2hzVVhpcGFLMDBOd0M1VE84NUtKNEVFWll0dVZCOEVpNmRH?=
 =?utf-8?B?ZGJjWUoxTDkzR2VVOXkwVlFCRWcvM0RmQ0FPV3RPZWtDd1cwL2RPOUNHWWZu?=
 =?utf-8?B?NGJySW00cm1RMnJnOHh0SXJtc3NweGNFSEVuaTdWK0d3aTVFTE50QTV1RG5u?=
 =?utf-8?B?N2xpV2dEc1VCd2RwVEs2TzEzRHNxQTdCUWNpUVNKQUF3SGxndzVGZ21vT05M?=
 =?utf-8?B?UitBVjRtdFN2aDNyUWRjcjlncEwybVJ4bkZIUXVHTFlSNnhzM1lCVERHUXdl?=
 =?utf-8?B?K21wQnZlVXA0cVBwN3VIZThneXUxQ0Ywbk9ITURpbUlsOUtuMG5jNUhMckI2?=
 =?utf-8?B?R2p0NmNJb0hqUUt1WnR3OVM4R0xyRGc1eU5ZM0pUTGM2azY2Y0RmaUowK3Ry?=
 =?utf-8?B?VzFsU0ZTZC9xYkFMaWg0Z0ZwRlEvdVFKVEtjbzZWUGlmMk1vYmFCUFhIQTdP?=
 =?utf-8?B?N1FQRUxtL3NnNXhjMi9MOWxoa1VVVncySjBTejdtT3Z0dFNmbjVDcS83YStY?=
 =?utf-8?B?OUlZdDZEeXhyWmEraHNEcTh2bjk0T2NvSFFVbTFoRVlBKzZjaDZQK1R4SUU1?=
 =?utf-8?B?enRoVERYQUdrckhEaHU0TlFLUW85UnNlS1owZGxiNXlVQkFEeERua25ValZX?=
 =?utf-8?B?RUJ0OWkzVlRXOWhFSk5IWWpTaTJEbkxsK2tMQ0FXZmFTM09ISjg4OXBhSDM5?=
 =?utf-8?B?dFJMNkpiZGxqSEExVWNSQzhIZGpmelNnRDRBQkxVVkczU2wvYVRDdmUyMlc1?=
 =?utf-8?Q?a/tk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461d9d3e-e5c4-4b5e-fb6f-08d9c5fcfe16
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 10:14:23.4048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2oJ+tKsqg5xl9ks/TnFPHctGbRPeCJHeULlD5avow0hXwIrDj3Kxn9MUKB38sfH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5538
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KQENoZW4sIEhvcmFjZSBAQ2hlbiwgSmluZ1dlbiBA
RGVuZywgRW1pbHkNCg0KUGxlYXNlIHRha2UgYSByZXZpZXcgb24gQW5kcmV5J3MgcGF0Y2ggDQoN
ClRoYW5rcyANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCk1vbmsgTGl1IHwgQ2xvdWQgR1BVICYgVmlydHVhbGl6YXRp
b24gU29sdXRpb24gfCBBTUQNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCndlIGFyZSBoaXJpbmcgc29mdHdhcmUgbWFu
YWdlciBmb3IgQ1ZTIGNvcmUgdGVhbQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4gDQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMjMsIDIwMjEgNDo0MiBQTQ0KVG86IEdyb2R6
b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogZGFu
aWVsQGZmd2xsLmNoOyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBDaGVuLCBIb3JhY2Ug
PEhvcmFjZS5DaGVuQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1JGQyB2MiA4LzhdIGRybS9hbWQv
dmlydDogRHJvcCBjb25jdXJyZW50IEdQVSByZXNldCBwcm90ZWN0aW9uIGZvciBTUklPVg0KDQpB
bSAyMi4xMi4yMSB1bSAyMzoxNCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPiBTaW5jZSBu
b3cgZmxyIHdvcmsgaXMgc2VyaWFsaXplZCBhZ2FpbnN0ICBHUFUgcmVzZXRzIHRoZXJlIGlzIG5v
IG5lZWQgDQo+IGZvciB0aGlzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCg0KQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9teGdwdV9haS5jIHwgMTEgLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9teGdwdV9udi5jIHwgMTEgLS0tLS0tLS0tLS0NCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9teGdwdV9haS5jDQo+IGluZGV4IDQ4N2NkNjU0YjY5ZS4uN2Q1OWE2NmUzOTg4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCj4gQEAgLTI0OCwxNSArMjQ4LDcg
QEAgc3RhdGljIHZvaWQgeGdwdV9haV9tYWlsYm94X2Zscl93b3JrKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykNCj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjb250YWluZXJfb2Yo
dmlydCwgc3RydWN0IGFtZGdwdV9kZXZpY2UsIHZpcnQpOw0KPiAgIAlpbnQgdGltZW91dCA9IEFJ
X01BSUxCT1hfUE9MTF9GTFJfVElNRURPVVQ7DQo+ICAgDQo+IC0JLyogYmxvY2sgYW1kZ3B1X2dw
dV9yZWNvdmVyIHRpbGwgbXNnIEZMUiBDT01QTEVURSByZWNlaXZlZCwNCj4gLQkgKiBvdGhlcndp
c2UgdGhlIG1haWxib3ggbXNnIHdpbGwgYmUgcnVpbmVkL3Jlc2V0ZWQgYnkNCj4gLQkgKiB0aGUg
VkYgRkxSLg0KPiAtCSAqLw0KPiAtCWlmICghZG93bl93cml0ZV90cnlsb2NrKCZhZGV2LT5yZXNl
dF9zZW0pKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gICAJYW1kZ3B1X3ZpcnRfZmluaV9kYXRhX2V4
Y2hhbmdlKGFkZXYpOw0KPiAtCWF0b21pY19zZXQoJmFkZXYtPmluX2dwdV9yZXNldCwgMSk7DQo+
ICAgDQo+ICAgCXhncHVfYWlfbWFpbGJveF90cmFuc19tc2coYWRldiwgSURIX1JFQURZX1RPX1JF
U0VULCAwLCAwLCAwKTsNCj4gICANCj4gQEAgLTI2OSw5ICsyNjEsNiBAQCBzdGF0aWMgdm9pZCB4
Z3B1X2FpX21haWxib3hfZmxyX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIAl9
IHdoaWxlICh0aW1lb3V0ID4gMSk7DQo+ICAgDQo+ICAgZmxyX2RvbmU6DQo+IC0JYXRvbWljX3Nl
dCgmYWRldi0+aW5fZ3B1X3Jlc2V0LCAwKTsNCj4gLQl1cF93cml0ZSgmYWRldi0+cmVzZXRfc2Vt
KTsNCj4gLQ0KPiAgIAkvKiBUcmlnZ2VyIHJlY292ZXJ5IGZvciB3b3JsZCBzd2l0Y2ggZmFpbHVy
ZSBpZiBubyBURFIgKi8NCj4gICAJaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1
KGFkZXYpDQo+ICAgCQkmJiAoIWFtZGdwdV9kZXZpY2VfaGFzX2pvYl9ydW5uaW5nKGFkZXYpIHx8
IGRpZmYgLS1naXQgDQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfbnYuYyAN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9udi5jDQo+IGluZGV4IGUzODY5
MDY3YTMxZC4uZjgyYzA2NmM4ZThkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9teGdwdV9udi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214
Z3B1X252LmMNCj4gQEAgLTI3NywxNSArMjc3LDcgQEAgc3RhdGljIHZvaWQgeGdwdV9udl9tYWls
Ym94X2Zscl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gICAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSBjb250YWluZXJfb2YodmlydCwgc3RydWN0IGFtZGdwdV9kZXZpY2Us
IHZpcnQpOw0KPiAgIAlpbnQgdGltZW91dCA9IE5WX01BSUxCT1hfUE9MTF9GTFJfVElNRURPVVQ7
DQo+ICAgDQo+IC0JLyogYmxvY2sgYW1kZ3B1X2dwdV9yZWNvdmVyIHRpbGwgbXNnIEZMUiBDT01Q
TEVURSByZWNlaXZlZCwNCj4gLQkgKiBvdGhlcndpc2UgdGhlIG1haWxib3ggbXNnIHdpbGwgYmUg
cnVpbmVkL3Jlc2V0ZWQgYnkNCj4gLQkgKiB0aGUgVkYgRkxSLg0KPiAtCSAqLw0KPiAtCWlmICgh
ZG93bl93cml0ZV90cnlsb2NrKCZhZGV2LT5yZXNldF9zZW0pKQ0KPiAtCQlyZXR1cm47DQo+IC0N
Cj4gICAJYW1kZ3B1X3ZpcnRfZmluaV9kYXRhX2V4Y2hhbmdlKGFkZXYpOw0KPiAtCWF0b21pY19z
ZXQoJmFkZXYtPmluX2dwdV9yZXNldCwgMSk7DQo+ICAgDQo+ICAgCXhncHVfbnZfbWFpbGJveF90
cmFuc19tc2coYWRldiwgSURIX1JFQURZX1RPX1JFU0VULCAwLCAwLCAwKTsNCj4gICANCj4gQEAg
LTI5OCw5ICsyOTAsNiBAQCBzdGF0aWMgdm9pZCB4Z3B1X252X21haWxib3hfZmxyX3dvcmsoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIAl9IHdoaWxlICh0aW1lb3V0ID4gMSk7DQo+ICAg
DQo+ICAgZmxyX2RvbmU6DQo+IC0JYXRvbWljX3NldCgmYWRldi0+aW5fZ3B1X3Jlc2V0LCAwKTsN
Cj4gLQl1cF93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsNCj4gLQ0KPiAgIAkvKiBUcmlnZ2VyIHJl
Y292ZXJ5IGZvciB3b3JsZCBzd2l0Y2ggZmFpbHVyZSBpZiBubyBURFIgKi8NCj4gICAJaWYgKGFt
ZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KGFkZXYpDQo+ICAgCQkmJiAoIWFtZGdwdV9k
ZXZpY2VfaGFzX2pvYl9ydW5uaW5nKGFkZXYpIHx8DQo=
