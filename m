Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90947ED8F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328FB10E427;
	Fri, 24 Dec 2021 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48410E425;
 Fri, 24 Dec 2021 08:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV0NkBTgQv+rbiwujRJxbR2xmR52D4qtGiF7fDa17f++p5nV65yAJRlc2D7vGQIc6HUZ/o0ySyukOdpN+qyZSmGF11FfijiNoCoIVSKCoivdG/1XVm/S4Y0EJEk5MreIbeRUdbdAL6rratCNIOYGoH+U5NMx5lCcYfusngG6Up25KDQuqfp8HpLyEYyQwP4uUG15kzGlHS0uocRNJY92EZluZaAp9xNtqRaMiXXyEIRvHzcJV/Wdm3gJAnbENA8sy98tLHIBTyQ/sHp5ogDhy2jxg/xTIdCm56jrECLML1srOIDYP6xDqBJIl4nSmXKPaPJg/3QSHoZYwOplvwrHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP51YEMG2v+Bi+Ijr6T4/LwuL9TiguVksYrvWQxDB28=;
 b=dz5HsFCd40hVl5ubbEumqjPSe0z1vVtCva4saamAAePD7utETURol8Gvi6fEWxl34Fs8Wj2gfhzxUm06cDdl/t7EGYWoJ7CKoTe9jXWktrPvbMBwfWTTt8OtdiymVaFm5a94dJEOanqjfmnA5F/41W1W/+Yl/FrccOjf+mn5B0QDvUbdB1akkiU2QywwNBq3zcE/51+6DVdrJrmnmf2nz1SDLPEE/pTIYu2RwmhjbLWtsgyREvtCI+Pi/82HmP0LCBPyJFctpxOf6cxi7CLHfIZweY1y42A7+6Vyx7Qk8s8dhDWwDRHkGG43Zcyu8XNhj4F3mmVxdU0lGVz5TcQa4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP51YEMG2v+Bi+Ijr6T4/LwuL9TiguVksYrvWQxDB28=;
 b=X9fx3NfD9ZuRDKbqElLkapxaXGA+2TKor1q4y/+yuYMxaeca8Sng/r8/LWgvcW7fJ2LtyiSYPR/pLX/NQa0DgYPOgyqv8oUSOtskTtNzUOzoeU/fkTubTzLaLyJoJ9PbS7ZUEBZlAfSPKdstuxrTGW3IvKYpr/B4vqyH8a4moBI=
Received: from PH0PR12MB5417.namprd12.prod.outlook.com (2603:10b6:510:e1::10)
 by PH0PR12MB5420.namprd12.prod.outlook.com (2603:10b6:510:e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Fri, 24 Dec
 2021 08:58:23 +0000
Received: from PH0PR12MB5417.namprd12.prod.outlook.com
 ([fe80::b85e:962f:c2ae:b58a]) by PH0PR12MB5417.namprd12.prod.outlook.com
 ([fe80::b85e:962f:c2ae:b58a%5]) with mapi id 15.20.4801.015; Fri, 24 Dec 2021
 08:58:23 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Horace" <Horace.Chen@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>
Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Topic: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Index: AQHX94FNq7VwowHrs0Wa9wb5fy4BR6w/wv+AgAAZtYCAAXyzEA==
Date: Fri, 24 Dec 2021 08:58:23 +0000
Message-ID: <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
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
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d776887-061e-4dd7-34a9-08d9c6bb8a8b
x-ms-traffictypediagnostic: PH0PR12MB5420:EE_
x-microsoft-antispam-prvs: <PH0PR12MB54202E52E991B90DD8DD46B68F7F9@PH0PR12MB5420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k257iNS6YG9DApKU7ZbhWflh+VX3hK8jZ1HcF5fOsy7TdIpLTPBPuobDOlNNJVVwiGel93QJdah92YzgahGjYQ3iBK/U/Nn7Vtt3QExQ5ySPBC+vvJHLSlQYa8El2Qvf779eLd/GI/kDjVDpyHYEY6UQ3wO+Ws36YcnjnTJ+Sb/z1UOOBYsz0E4K7R6NQHWcpRIuxrL/svJGRKBTSvuLWdRcjMqtStfl0P7m2l4siYsrodVzZL11w9wPBA9mweYcblS42pi86HKy2RPOpvGchnDGI1r3cB9Pd6YnnZQitdsAs+gUonb8YP8lyZCnC2ooYvndl0WW7LXg2DLseWYU7NY3TefkUYgeQ/9RAnHDlB8oWwkQiwWFWQIk0qDbTugYV0b7ZiqhVyOBiTRqKZw092E7m/X993hjU5sW0zZrhYStMepF5Jc3C2s4EuwqgBe4aXIe4Hj+BAzPpoXXLJdCPIO2hFUIwSdjf0BkOxTazRD2xstQkbBqYOOGgPXA7mY0EMY9DLRcb0/9rv91UmaLrwOMQWylU5WUWqW3yhQXqGQMq4FFk7EPBnve6EgYaPJv2LzA3ksdIOtjsHnx3qZDm7UogXL4lQ00Z87+YPBb7G6gRIMUw8eJ7uosdpsktO8U0RMVxjyQRRM97tCoAkQgngznZPyfSx1thy1JOAF1PRdvSaMuxVKPvbPyHnlY3LsmbFsKKDwON4+NSbot8w/ueGyBgUHcQ7pH4hvMJfA0cZI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5417.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(76116006)(8936002)(66574015)(508600001)(38100700002)(122000001)(66476007)(66446008)(71200400001)(66556008)(64756008)(66946007)(52536014)(316002)(4326008)(7696005)(110136005)(186003)(83380400001)(6636002)(38070700005)(2906002)(9686003)(55016003)(26005)(5660300002)(921005)(86362001)(33656002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TklJdXlUUHFxSStsMjBvMWd3alFScVR2YzJNNTZ3azNUMk0rT05OZGV6ZWhx?=
 =?utf-8?B?NC9tV2E0Q2ZUSXJqZWtzZVJVcnZEdlpKVXJjeXVDZ3p2dDRIL2pVQ3lIaURx?=
 =?utf-8?B?bjhLT2lhUVhlNXY0cTUvSVJKVVVqc1F0Njhmc1hoSHlwNFJYSk1HN2FrR29n?=
 =?utf-8?B?M0FTUlp4RG9uaDZDb0FVWmw5b01RNm1reEVnZ1ZVRjg0Mm9XSGd5cXA1RURs?=
 =?utf-8?B?OG44M0w3VFpVVFpiKzY3TXJxMWxQQ0dBR2xJeHUxZGFCOUxaOHNKMG5YWWMv?=
 =?utf-8?B?bEt2NjQ2OERrRlZ2YmtvMUF2ZlpUbVp0K01lc2xHVTRQSEVhdE1BUVVHVzk0?=
 =?utf-8?B?bnRuZU16RnM2QnRrdzRjMFUxbm4vaVdtTjJhS2szTm5OY25OUkZVSmo1MU1p?=
 =?utf-8?B?ZWg4VlptZ0NrOHFNdm1LVEQ2N0gxWmJIVWplYStwT2hPQ1k5enlUSkIyd3hn?=
 =?utf-8?B?djNzZmNLTnhLcHVaMkxJQ3NTa2ovc0lVblZXd2Vrc2xmd0FXUkRNRlluaVlT?=
 =?utf-8?B?a1BsY2gvaEtneXdBMDM4MVJmSjNKTUdFLytLWGpvVXpOVVYvbnlPNnl1Q3NZ?=
 =?utf-8?B?S3RBa0x3am5oeWJsbk1iblFPeHdUREVqWS9XRElVMmRsRGRtVEtRSElpUC9s?=
 =?utf-8?B?ZlcxbG9MMjJEcWR5ZW9KS1VKeGJzZUJkYnBJTjFMcWZXdEJIeHNFNUVWbENF?=
 =?utf-8?B?NmlrNDdVMW53RitNeFM1VzFmTERSNHRUYk5vWVN1b3ZSQXBBRjRFay82b2V1?=
 =?utf-8?B?TmZ5dFlOK1hPdEhMMEZJRW1FQ200bGQxUVBRMFg1YWZ5WkhyL0hoc3BQNHZv?=
 =?utf-8?B?bU9GMkZ0YnQ5YVZkTTJGYWFXTlYvSno4RnJjRjl4ejhSdUpNaTZSbDRQS0Va?=
 =?utf-8?B?MUVuZFUwOWtrSStXNGRBSVFFQ3ROM3RLTC8rNTBUblJCWU0yQUtPekdtczFV?=
 =?utf-8?B?YkhHY0wwMWRBK0FXZEZVR1U2ZTJjTVBML1F0NnBOdXhmSnYvNC9sTm5TMklY?=
 =?utf-8?B?VE1UMStKMGc4MWZZTWpSNFdKMXdtejRkL0hhdkF0ZklXNHZFZlZXMFJwWFVa?=
 =?utf-8?B?YXE4SFNxa2poM3NSSHNpNmY1L25WU2F1cWZjME1wNFlxUHp0K2JxWExvNGg0?=
 =?utf-8?B?RCsveFpFUlhzV0pQSUs3QXZHVjNVTFZtRW1adndWZlpsNTVrSFRucGNsai9j?=
 =?utf-8?B?ajRFZms1YU9FVDNCQnNoSll0a3dSRGxaSWlBK0d4c0huWllTbUVoanZ3SlBS?=
 =?utf-8?B?T2Ivcm5WanE1SWJTazlzamRIR2NOaXk4UWUwSTN3SFJ0UkdpQlBBbXU4blVm?=
 =?utf-8?B?RGdYVnU3aG8zZ29FZm1FdFdmN1pUclhMYldlakxDNzRpUkRkbmVLZHlGaUV1?=
 =?utf-8?B?dUYxZDRKaWZ4M3ZUS3BuRmgvYzQ1ZHRRMGRvUVcrQWd0RkQwMzFST1AvYzVT?=
 =?utf-8?B?Wm04R1J5YzQ0MEU3a25IcCtsWi9JWGZpOHFGQUc3SzRCTEJCSUVLMll5dGM0?=
 =?utf-8?B?dHd5dFNRc01FckpFMTdzcjdSU1U0S2JERCtGbDhyN1ZxZ0NDcTZDZzcrajJv?=
 =?utf-8?B?RXRubkZqcjFnT21lM1R1cXlTemxtSk9Yc1ZzcjdUS29qYjd6ZEppMHFldWhE?=
 =?utf-8?B?K3RDODk1cjNnQ25zNUdtSDdGWHZIL0ZNVkRFYW1EVld1RXlTOTNpYnpsUnhk?=
 =?utf-8?B?UHNra3RVY05HMng3UHZSZERaVVlqaGZuMGt0cXJIM3R4L3YwdjdPQlhOSXpt?=
 =?utf-8?B?eDgyM1ZHT2xZQk0zangvSHZHM3NJNzN2bE5TUmVMVHpTOVFpTkNKTi9ia2ts?=
 =?utf-8?B?V2hDUHova3YwNVRBSnZsT2FJS3JsU2VLMGU4WldVckF3L0s2YVk2UTJSQ3Iz?=
 =?utf-8?B?alRlbjQwc3BVVzJWYnV2RHFQK24xcTUvZlhzMTFTQzltRmt5UGxWTEZZM1BF?=
 =?utf-8?B?MXBoSWQyOU5kQmVOTEo2YzMrZzBmKzl3S1JIdVQ0akNMY1o4c0lvZ1VRbmhk?=
 =?utf-8?B?Tm50MVIySlY3YXUvdFhEZEoxUFp2aXMvNE5JditaKzdkdHJmcDU4d09xcUg1?=
 =?utf-8?B?VnJDQUdHT1VTZmVyQkdYYWVnY2ZWZDJ1ait1TVBRTDZHSEZGenh2TzhRN3dR?=
 =?utf-8?Q?Gves=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5417.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d776887-061e-4dd7-34a9-08d9c6bb8a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 08:58:23.2789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ao2/oZelwwioBZsJ51nh8unhh/8S44JRDFTPmUwdhPjzl/5CL2SToN9Ii+gEdZ5N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5420
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

VGhlc2UgcGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUuIEppbmdXZW4gd2lsbCBwdWxsIHRoZXNlIHBh
dGNoZXMgYW5kIGRvIHNvbWUgYmFzaWMgVERSIHRlc3Qgb24gc3Jpb3YgZW52aXJvbm1lbnQsIGFu
ZCBnaXZlIGZlZWRiYWNrLg0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVuZw0KDQoNCg0KPi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29t
Pg0KPlNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAyMywgMjAyMSA2OjE0IFBNDQo+VG86IEtvZW5p
ZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBHcm9kem92c2t5LCBBbmRy
ZXkNCj48QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGFtZC0NCj5nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBIb3JhY2Ug
PEhvcmFjZS5DaGVuQGFtZC5jb20+OyBDaGVuLA0KPkppbmdXZW4gPEppbmdXZW4uQ2hlbjJAYW1k
LmNvbT47IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Q2M6IGRhbmllbEBmZnds
bC5jaA0KPlN1YmplY3Q6IFJFOiBbUkZDIHYyIDgvOF0gZHJtL2FtZC92aXJ0OiBEcm9wIGNvbmN1
cnJlbnQgR1BVIHJlc2V0IHByb3RlY3Rpb24NCj5mb3IgU1JJT1YNCj4NCj5bQU1EIE9mZmljaWFs
IFVzZSBPbmx5XQ0KPg0KPkBDaGVuLCBIb3JhY2UgQENoZW4sIEppbmdXZW4gQERlbmcsIEVtaWx5
DQo+DQo+UGxlYXNlIHRha2UgYSByZXZpZXcgb24gQW5kcmV5J3MgcGF0Y2gNCj4NCj5UaGFua3MN
Cj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+TW9uayBMaXUgfCBDbG91ZCBHUFUgJiBWaXJ0dWFsaXphdGlvbiBTb2x1
dGlvbiB8IEFNRA0KPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj53ZSBhcmUgaGlyaW5nIHNvZnR3YXJlIG1hbmFnZXIg
Zm9yIENWUyBjb3JlIHRlYW0NCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj5Gcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
Pg0KPlNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAyMywgMjAyMSA0OjQyIFBNDQo+VG86IEdyb2R6
b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IGRyaS0NCj5kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6
IGRhbmllbEBmZndsbC5jaDsgTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgQ2hlbiwgSG9y
YWNlDQo+PEhvcmFjZS5DaGVuQGFtZC5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgdjIgOC84XSBk
cm0vYW1kL3ZpcnQ6IERyb3AgY29uY3VycmVudCBHUFUgcmVzZXQgcHJvdGVjdGlvbg0KPmZvciBT
UklPVg0KPg0KPkFtIDIyLjEyLjIxIHVtIDIzOjE0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6
DQo+PiBTaW5jZSBub3cgZmxyIHdvcmsgaXMgc2VyaWFsaXplZCBhZ2FpbnN0ICBHUFUgcmVzZXRz
IHRoZXJlIGlzIG5vIG5lZWQNCj4+IGZvciB0aGlzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPg0KPkFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+DQo+PiAtLS0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYyB8IDExIC0tLS0tLS0t
LS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X252LmMgfCAxMSAtLS0t
LS0tLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCj4+IGluZGV4IDQ4N2NkNjU0YjY5
ZS4uN2Q1OWE2NmUzOTg4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbXhncHVfYWkuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVf
YWkuYw0KPj4gQEAgLTI0OCwxNSArMjQ4LDcgQEAgc3RhdGljIHZvaWQgeGdwdV9haV9tYWlsYm94
X2Zscl93b3JrKHN0cnVjdA0KPndvcmtfc3RydWN0ICp3b3JrKQ0KPj4gICAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSBjb250YWluZXJfb2YodmlydCwgc3RydWN0DQo+YW1kZ3B1X2Rldmlj
ZSwgdmlydCk7DQo+PiAgIAlpbnQgdGltZW91dCA9IEFJX01BSUxCT1hfUE9MTF9GTFJfVElNRURP
VVQ7DQo+Pg0KPj4gLQkvKiBibG9jayBhbWRncHVfZ3B1X3JlY292ZXIgdGlsbCBtc2cgRkxSIENP
TVBMRVRFIHJlY2VpdmVkLA0KPj4gLQkgKiBvdGhlcndpc2UgdGhlIG1haWxib3ggbXNnIHdpbGwg
YmUgcnVpbmVkL3Jlc2V0ZWQgYnkNCj4+IC0JICogdGhlIFZGIEZMUi4NCj4+IC0JICovDQo+PiAt
CWlmICghZG93bl93cml0ZV90cnlsb2NrKCZhZGV2LT5yZXNldF9zZW0pKQ0KPj4gLQkJcmV0dXJu
Ow0KPj4gLQ0KPj4gICAJYW1kZ3B1X3ZpcnRfZmluaV9kYXRhX2V4Y2hhbmdlKGFkZXYpOw0KPj4g
LQlhdG9taWNfc2V0KCZhZGV2LT5pbl9ncHVfcmVzZXQsIDEpOw0KPj4NCj4+ICAgCXhncHVfYWlf
bWFpbGJveF90cmFuc19tc2coYWRldiwgSURIX1JFQURZX1RPX1JFU0VULCAwLCAwLCAwKTsNCj4+
DQo+PiBAQCAtMjY5LDkgKzI2MSw2IEBAIHN0YXRpYyB2b2lkIHhncHVfYWlfbWFpbGJveF9mbHJf
d29yayhzdHJ1Y3QNCj53b3JrX3N0cnVjdCAqd29yaykNCj4+ICAgCX0gd2hpbGUgKHRpbWVvdXQg
PiAxKTsNCj4+DQo+PiAgIGZscl9kb25lOg0KPj4gLQlhdG9taWNfc2V0KCZhZGV2LT5pbl9ncHVf
cmVzZXQsIDApOw0KPj4gLQl1cF93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsNCj4+IC0NCj4+ICAg
CS8qIFRyaWdnZXIgcmVjb3ZlcnkgZm9yIHdvcmxkIHN3aXRjaCBmYWlsdXJlIGlmIG5vIFREUiAq
Lw0KPj4gICAJaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KGFkZXYpDQo+PiAg
IAkJJiYgKCFhbWRncHVfZGV2aWNlX2hhc19qb2JfcnVubmluZyhhZGV2KSB8fCBkaWZmIC0tZ2l0
DQo+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X252LmMNCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfbnYuYw0KPj4gaW5kZXggZTM4NjkwNjdhMzFkLi5m
ODJjMDY2YzhlOGQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
eGdwdV9udi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9udi5j
DQo+PiBAQCAtMjc3LDE1ICsyNzcsNyBAQCBzdGF0aWMgdm9pZCB4Z3B1X252X21haWxib3hfZmxy
X3dvcmsoc3RydWN0DQo+d29ya19zdHJ1Y3QgKndvcmspDQo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGNvbnRhaW5lcl9vZih2aXJ0LCBzdHJ1Y3QNCj5hbWRncHVfZGV2aWNlLCB2
aXJ0KTsNCj4+ICAgCWludCB0aW1lb3V0ID0gTlZfTUFJTEJPWF9QT0xMX0ZMUl9USU1FRE9VVDsN
Cj4+DQo+PiAtCS8qIGJsb2NrIGFtZGdwdV9ncHVfcmVjb3ZlciB0aWxsIG1zZyBGTFIgQ09NUExF
VEUgcmVjZWl2ZWQsDQo+PiAtCSAqIG90aGVyd2lzZSB0aGUgbWFpbGJveCBtc2cgd2lsbCBiZSBy
dWluZWQvcmVzZXRlZCBieQ0KPj4gLQkgKiB0aGUgVkYgRkxSLg0KPj4gLQkgKi8NCj4+IC0JaWYg
KCFkb3duX3dyaXRlX3RyeWxvY2soJmFkZXYtPnJlc2V0X3NlbSkpDQo+PiAtCQlyZXR1cm47DQo+
PiAtDQo+PiAgIAlhbWRncHVfdmlydF9maW5pX2RhdGFfZXhjaGFuZ2UoYWRldik7DQo+PiAtCWF0
b21pY19zZXQoJmFkZXYtPmluX2dwdV9yZXNldCwgMSk7DQo+Pg0KPj4gICAJeGdwdV9udl9tYWls
Ym94X3RyYW5zX21zZyhhZGV2LCBJREhfUkVBRFlfVE9fUkVTRVQsIDAsIDAsIDApOw0KPj4NCj4+
IEBAIC0yOTgsOSArMjkwLDYgQEAgc3RhdGljIHZvaWQgeGdwdV9udl9tYWlsYm94X2Zscl93b3Jr
KHN0cnVjdA0KPndvcmtfc3RydWN0ICp3b3JrKQ0KPj4gICAJfSB3aGlsZSAodGltZW91dCA+IDEp
Ow0KPj4NCj4+ICAgZmxyX2RvbmU6DQo+PiAtCWF0b21pY19zZXQoJmFkZXYtPmluX2dwdV9yZXNl
dCwgMCk7DQo+PiAtCXVwX3dyaXRlKCZhZGV2LT5yZXNldF9zZW0pOw0KPj4gLQ0KPj4gICAJLyog
VHJpZ2dlciByZWNvdmVyeSBmb3Igd29ybGQgc3dpdGNoIGZhaWx1cmUgaWYgbm8gVERSICovDQo+
PiAgIAlpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUoYWRldikNCj4+ICAgCQkm
JiAoIWFtZGdwdV9kZXZpY2VfaGFzX2pvYl9ydW5uaW5nKGFkZXYpIHx8DQo=
