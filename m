Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749C737886
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 03:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83610E399;
	Wed, 21 Jun 2023 01:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FF610E398;
 Wed, 21 Jun 2023 01:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+nIDeNym0k6AkVF31t59UKsWg71zp2lZRWX1QnB/yQDj7GO8huvk/ENN5vJOc/ox1W9J3PSx2QnjaQ/PUDGRrcCM1ORsF8ou2x8Hd/tuQZch1qeBEiT5ceWzZJ24T5YMzJSrpVGW0yRz9qvHXu1cJtsMGmxmHGcRYL7YDDr8aoG/jh1jY/Ffkf4A/Gyy5GrlluiFrKsXgO4VrRC8b4/0JVTUJY6rxVLTh7wtqh+RclH0GIBfQFBh7TywiU31nclwLZJhpLl9J1NQXtpSx49xCYtPCAIsktDqs3mYyFXih9CDO/IgU7dBEwwYb1p9/M0DZpNAcKznJpk2PZ8dYS5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pMpodvcbmOnXbcOXWVMvIIMeyE5p0ZbX3Vo/ZvLM8E=;
 b=Wx4Dexikiw4401VwUaCudmTbZ7+PFrc2fSZf8Wlr59sZiD+b0UF8fl1d51lZpTv2ICburoq9PrdtTRvBeN+lUa+BQ4PZwuwdDqhveOXDfX7sSgB452DjeHRKWBhT+E1QfzEOmxnJNqq3F7jVaXyg4++FqmurCJmygXR8r5QcZ6yYkuxFjeahX+fpfkRod9qFmMo06D7ADSMZa/zxmEGmPAU27fCSN8Kk7F78IruXlltSQnwXfvvp1UZTBn2UMGLuhDZ9K+PqmOvA7aUSAT4oULi9LIKsuNf3CaQJKZ3PA6hXP7xb9yswUriMgySQqUk2D6Fidpt7X0gZxuI688iPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pMpodvcbmOnXbcOXWVMvIIMeyE5p0ZbX3Vo/ZvLM8E=;
 b=pyXWaCGtvZI+qoKZqHGuPogSLUA8UGLUQ5EJrmfJQ1x9gGfxND8JmttTmMQKBamRoRiW/U8S5GWizXOGkJoEjGNpYM1mLMqgRaAAeJOyoqI2QdUQqTYI7N/p2ZG242RcjzJLhTF684Xwg+dqqiwLMsoTsrixo4AcuT5trOkq4W8=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CY5PR12MB6082.namprd12.prod.outlook.com (2603:10b6:930:2a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Wed, 21 Jun 2023 01:04:52 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 01:04:52 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>
Subject: RE: [PATCH V3 2/7] wifi: mac80211: Add support for ACPI WBRF
Thread-Topic: [PATCH V3 2/7] wifi: mac80211: Add support for ACPI WBRF
Thread-Index: AQHZoCAHrsUNPO82fkWJeyWc+queN6+RaCSAgABmhYCAAqgl8A==
Date: Wed, 21 Jun 2023 01:04:52 +0000
Message-ID: <DM6PR12MB2619A57C7517C625729CCA5BE45DA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-3-evan.quan@amd.com>
 <3c3dccd6-6772-d62f-f183-bd84e109a366@amd.com>
 <5a19bd3074d2763b02a722f31713bbf3bae97e8f.camel@sipsolutions.net>
In-Reply-To: <5a19bd3074d2763b02a722f31713bbf3bae97e8f.camel@sipsolutions.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=321d7700-ed24-42c0-9ec0-f4787c4608c4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-21T00:58:44Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CY5PR12MB6082:EE_
x-ms-office365-filtering-correlation-id: f4a6260e-ac68-4b99-fdf6-08db71f384fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k0aA3De2NgSJCMURFe+7hQ5VI8lzoIYfKOMItLH99pC6ny9zrDMLhU8nxE5oiDhGH/4L/lNLTR4tlG9XoTMRsnfbRpX8gDfa9yNF0R1weFB5q5UgXLfO2tGwD9zClrF9UV6dxnstZH/FBWI6t8pBbaB+Pyr+o2Z3nH1ihAiAP081X7LELmTGqzm9eIOodJtwkQaWRbcj03+ulZ5TdbIFkYJJsZq4Egk6ZMhiuBZd2MCsOiGdXYXIMsIn5+BRcQCrlhJPTiQ4uBwXUqikAjmFTWAlXLhunT8bxSmHPF1/GtKWEXKXQuNZ9j41UM8vAN9ysvrcPpxcUbG0hpFTXPL6iftRJeNq5m7kHyZIpUkzKsbEXMzkZPnaNowFpJdyyo6vzxr4E7zn9xbq2X8z8aDMA1cy6yBqUTWn2hidebpTdjM1+OVfu0mPgmc8pscvyncJ6EBV63/lCHuk2YKisvSq3+tPiudv28/HTOJAR0IyEYwT7dBL2U+24FcB0riB11ETdIVnOimKeDXY5iBHB0cFfMZmji/uZ/HLAP67QvDCRK3z3iKacpnqzVXBcpzkuVTodrwNfcxuWZ71sNfjOI+RYzQnvOdMJ1pvERUBhwnnbN9KmDi9WIup4hOCsqBN/f4x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(52536014)(86362001)(33656002)(122000001)(38100700002)(83380400001)(8936002)(38070700005)(41300700001)(8676002)(5660300002)(66446008)(316002)(64756008)(66476007)(66556008)(66946007)(7416002)(6506007)(53546011)(9686003)(26005)(55016003)(186003)(6636002)(478600001)(54906003)(7696005)(110136005)(4326008)(71200400001)(76116006)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3BmSWFySUg3aFdVUkRuL3NZc1YyWWxJaGdDamxTQ3Zla2p1dFZVWmhQS2ZN?=
 =?utf-8?B?UDhaRnhQVU55QjFNRnBVZzJDbDRtSWozOWNvQkxLN3kxaXJUY3F6Q0FMSis5?=
 =?utf-8?B?MkJvd2dDdUQrY1hScWxFWTh5SXN2Vy91L3EvTjhYNXc3VitXS1A4TkFNUkh6?=
 =?utf-8?B?YmJobk5iTUR1OHNtY1B3WGN5dGtWL3NSV2FsUE9kcVpNdnVrRVlTZ3drVXZF?=
 =?utf-8?B?V2U4aDhCY3ZUcmZxWVdHZ2tjOGt0YktNWjhlVEs1YkVMc0VGNVRBSzBLbXZT?=
 =?utf-8?B?Sm9Kc3pLSVplRThGUzRJVUhEcmI3aTJxTG5BNE5vSFRPYmoxUDRqemlRYnFR?=
 =?utf-8?B?OXYzM2FTYTBxYlF5Zk1GT0hVblA2Wi8xUTU3ZDVhM2JnaUFyakpJWVhMVEdt?=
 =?utf-8?B?RDlJd2pLWk1xNExEL09SUDBkMHZJUXhvcFFwWDcxWHdYTWVhWFE5Z1ZRS1BM?=
 =?utf-8?B?T0N1OW45Nk0yU1VjczNMSWZUem9VMFkzdWxxTFVsYlA5aFpzd1NtS0xVK21J?=
 =?utf-8?B?MEo5N1FPNWczaDREc3JuT0NCY1lXbVJZYnBLQktJdkVmWTN2U05vVTNlc2Rz?=
 =?utf-8?B?V0tDc2F5QlRXRjJDdjNyeGhQMVJjOWNtZVNOY2M5bXZWSGdLazY0R2s4ZXpM?=
 =?utf-8?B?bXh0dVBaeksva1l0S2xpeTlZWEIrNHJFOHd1TEl0UDVqaGsvbUl2UlQvYmVp?=
 =?utf-8?B?Ujd2WXRPaWNFMktTRkJuS0FFb29MakFiZThIMzltYXkzSlg1YUExQnJSSEF2?=
 =?utf-8?B?UWxkdmFkL2xOV01nekhVeXZPODNSOWNXcTh6L0VzVXkraXFneS9Rb29GSXNn?=
 =?utf-8?B?d3pyc09BMkkraGxEY0pMZVVETVZFQU5GZ1ZwS2hJWjc5M29RYmxSWE1INEN2?=
 =?utf-8?B?RFl5RTFGUjJmYUYrWS9DVzhCYUpOZzR2Y0NUMkNQbSs0dzdTTlNHTUJQSjZz?=
 =?utf-8?B?S0JJZWZxc1lLalQrODdqd2l2ZXMxb0JjSENWVkFCNDFkVUxhNGNsVWczaEFF?=
 =?utf-8?B?bSswOXA2SldSbStjeUR4emFCNFppa2haNDVlY0RZYnBsZzhDMWVkZzdBVUh4?=
 =?utf-8?B?cmMyREM4anRIUVhaU1BpVXBOZHBIRzI2dW8wMUFGVjFSUG5EVCtJM3kvWW1w?=
 =?utf-8?B?MWpyeXh0aHkrQkE2M3BweWZ2ZVhRUEVsOVZUMnpHbGJiQ0JPc3BFdkV3Vk9s?=
 =?utf-8?B?UTk5SldpUXVWenFCTmxveUVGWVR3eFYvajgrR2FUS1BUWGt2TTBsYUhjNFZv?=
 =?utf-8?B?UzVWTVRZZ1M3VkZPSGM5U3FYaE9sVEJHT2lNSU52TVJnUUpXV0Y4NGV6N0V5?=
 =?utf-8?B?b0VuSXBlNmpTd1RDeHlhZDI3MGZMamplVkJCb0xWVDlLLzRHS0FtWWZiRDI1?=
 =?utf-8?B?YzJFNXNuRnlwcWVteFRjbThQakFvdWlMZGxrdHp0Rm4wTTBpWlB0aGNNRlMv?=
 =?utf-8?B?MnBJVSszditSQmRrTVo1SitjWW4yMVlSYytCMExxNXVlSHNSOW9pWmJZQWJ6?=
 =?utf-8?B?b1I5RTM0QVVSc2hSYnRteG5VOHlRazMrczd5K0luVWFFdjFWeG95WTVaS3Np?=
 =?utf-8?B?ZFBMMzQvM3lqSGwvcUtNbERMbGtXUjNpU3JzUW03VGVSTFpQeWNMUlJyNUV2?=
 =?utf-8?B?WUUyT1RpTjVzTGRKcnhKNk82a0pIZ1ErUjM3YVNYZ2xPd2QvR2xabUg4b2J4?=
 =?utf-8?B?a0ZBcHE0bzRyaitqNGlYcVlBRGY4L01xMHJPb0hUUkV6bnhycFcvYmZTeGd5?=
 =?utf-8?B?S0pXQk9sbFlXK1lBRlpLZkNNSDVQZkJveHdWaVlTMUE5RDhSVXNsTGZKcHhW?=
 =?utf-8?B?ZXZ5bUZqZWRWZVNqdWRJdUIwNzlQdmcxakpyd3VkUW5RMzJsc2lKYThDQ3VI?=
 =?utf-8?B?WkVuQXBWQmx5a1pQNGZXaEhrSEtBVUZ3Lzg3MUFoOVZSbm9HZlM2UHJ4VGJm?=
 =?utf-8?B?Y05qeDQ5QVJPdWpuSDJYU0ErNm9ZMnNzOWVOVWE0Q0cyMm9sSXVwdzdYVlcv?=
 =?utf-8?B?ZkFDU1dxQU9CbEYwZWk3MVZWM3JtTmtPVjc3M2hRdkRzWXo3ZkpxUks2MnV3?=
 =?utf-8?B?T3k4Qmh2a0wrY0JyTUtLdmxtTWwvRHhVSWs5UjRndWlxSWFTcjd4WXp2b3Ex?=
 =?utf-8?Q?iWcQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a6260e-ac68-4b99-fdf6-08db71f384fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 01:04:52.5202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDVn93OxxdxbDI4uJ+FqkslFzOuYQaCXu6gaeRhYZZb8xVRnVt6nY//aVgIK3pzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6082
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
Cc: "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "nbd@nbd.name" <nbd@nbd.name>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "lenb@kernel.org" <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5l
dD4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDE5LCAyMDIzIDQ6MjQgUE0NCj4gVG86IExpbW9uY2ll
bGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT47IFF1YW4sIEV2YW4NCj4gPEV2
YW4uUXVhbkBhbWQuY29tPg0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtDQo+IHdpcmVsZXNzQHZn
ZXIua2VybmVsLm9yZzsgcmFmYWVsQGtlcm5lbC5vcmc7IGxlbmJAa2VybmVsLm9yZzsgRGV1Y2hl
ciwNCj4gQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJp
c3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWku
UGFuQGFtZC5jb20+Ow0KPiBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoOyBrdmFs
b0BrZXJuZWwub3JnOyBuYmRAbmJkLm5hbWU7DQo+IGxvcmVuem9Aa2VybmVsLm9yZzsgcnlkZXIu
bGVlQG1lZGlhdGVrLmNvbTsgc2hheW5lLmNoZW5AbWVkaWF0ZWsuY29tOw0KPiBzZWFuLndhbmdA
bWVkaWF0ZWsuY29tOyBtYXR0aGlhcy5iZ2dAZ21haWwuY29tOw0KPiBhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb207IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFtZC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMi83XSB3aWZpOiBtYWM4MDIxMTogQWRkIHN1cHBv
cnQgZm9yIEFDUEkgV0JSRg0KPg0KPiBPbiBTdW4sIDIwMjMtMDYtMTggYXQgMjE6MTcgLTA1MDAs
IE1hcmlvIExpbW9uY2llbGxvIHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0gYS9pbmNsdWRlL25ldC9j
Zmc4MDIxMS5oDQo+ID4gPiArKysgYi9pbmNsdWRlL25ldC9jZmc4MDIxMS5oDQo+ID4gPiBAQCAt
OTIwLDYgKzkyMCwxNCBAQCBjb25zdCBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgKg0KPiA+ID4g
ICBjZmc4MDIxMV9jaGFuZGVmX2NvbXBhdGlibGUoY29uc3Qgc3RydWN0IGNmZzgwMjExX2NoYW5f
ZGVmDQo+ICpjaGFuZGVmMSwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBjZmc4MDIxMV9jaGFuX2RlZiAqY2hhbmRlZjIpOw0KPiA+ID4NCj4gPiA+ICsv
KioNCj4gPiA+ICsgKiBubDgwMjExX2NoYW5fd2lkdGhfdG9fbWh6IC0gZ2V0IHRoZSBjaGFubmVs
IHdpZHRoIGluIE1oeg0KPiA+ID4gKyAqIEBjaGFuX3dpZHRoOiB0aGUgY2hhbm5lbCB3aWR0aCBm
cm9tICZlbnVtIG5sODAyMTFfY2hhbl93aWR0aA0KPiA+ID4gKyAqIFJldHVybjogY2hhbm5lbCB3
aWR0aCBpbiBNaHogaWYgdGhlIGNoYW5fd2lkdGggZnJvbSAmZW51bQ0KPiA+ID4gK25sODAyMTFf
Y2hhbl93aWR0aA0KPiA+ID4gKyAqIGlzIHZhbGlkLiAtMSBvdGhlcndpc2UuDQo+ID4gPiArICov
DQo+ID4gPiAraW50IG5sODAyMTFfY2hhbl93aWR0aF90b19taHooZW51bSBubDgwMjExX2NoYW5f
d2lkdGgNCj4gY2hhbl93aWR0aCk7DQo+ID4gPiArDQo+ID4NCj4gPiBJdCdzIHVwIHRvIG1hYzgw
MjExIG1haW50YWluZXJzLCBidXQgSSB3b3VsZCB0aGluayB0aGF0IHRoZSBjaGFuZ2VzIHRvDQo+
ID4gY2hhbmdlIG5sODAyMTFfY2hhbl93aWR0aF90b19taHogZnJvbSBzdGF0aWMgdG8gZXhwb3J0
ZWQgc2hvdWxkIGJlDQo+ID4gc2VwYXJhdGUgZnJvbSB0aGUgcGF0Y2ggdG8gaW50cm9kdWNlZCBX
QlJGIHN1cHBvcnQgaW4gdGhlIHNlcmllcy4NCj4NCj4gWWVhaCwgdGhhdCdkIGJlIG5pY2UgOikN
Ck9LLCBJIHdpbGwgbW92ZSB0aGF0IGludG8gYSBuZXcgcGF0Y2guDQo+DQo+DQo+ID4gPiArI2Rl
ZmluZSBLSFpfVE9fSFooZnJlcSkgICAgICAgICAgKChmcmVxKSAqIDEwMDBVTEwpDQo+DQo+IFRv
Z2V0aGVyIHdpdGggTUhaX1RPX0tIWigpIGZvciBleGFtcGxlIDopDQpTdXJlLg0KDQpFdmFuDQo+
DQo+IGpvaGFubmVzDQo=
