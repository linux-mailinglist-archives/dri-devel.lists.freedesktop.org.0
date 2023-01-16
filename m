Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7BB66D193
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8E110E4F4;
	Mon, 16 Jan 2023 22:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43AD10E4F4;
 Mon, 16 Jan 2023 22:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j53qxIH/F3rLZdT+QHH8O+sOYwhaWdPQEA8HzEDwbZgyf3I8lljwn/hgaldU70KyNlSSXfQfk4OzGOM/rzv5PkkzBh4Wky1R6tpoQRgykf6+emnL7+cdZCyfpJXCWR0unczlHOfKgTp6CvPL2dln2rrRWwBP34evusbmLTsl3O8B8y4xsAwA+xvFpmiKKCrmriueqbiADr5hp/p9niNEwNfZTflHXH2sV7rBCXxtl5+8pInq66AWPV5ONQr0H0Q+hrgZLPflijrmD8beKoJkF7x3+cgYWOqyE8Uy7GUjdnPWUejmeZ+goFiblLAKCvg1MO9uYTXKnamAVxifFnXWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlCNIw4Rd0idxh/K6hAW8/MTerp1Tq+ugjb+bM2H9lw=;
 b=Tlv/RS/DWGzHbfqHY+p13R9szccKTpKkL1tCX/6hzuFBGMNZLvxiaMU94DmnEqnUSYxUOBxxZ0yvbBepipARnJA7obyq5m4QQ9sqc31MQ6mIHdzoBpB+YEdDFsoJ+YS5hsgdF48s6TgSE6XVOGi7OQ2n61pO3UWaqyKGlzkpN2nLSNboPJL5teQl/L2HLW63JSVo8jT8aHOmxiQ8ZzFf1zJIZKzSVYN9w8djdVml1oeXPNxaIVbe67QVfRob29r834gpu8GLgUVJDZzB6oVFshdhkC07f6PEG+YPBiDEhhUQ8np66vaio60wq6Ql6dm1L7BcGTzYgCoFXvbnimE/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlCNIw4Rd0idxh/K6hAW8/MTerp1Tq+ugjb+bM2H9lw=;
 b=hyK7cJgKBIALHSCVEmTS98Y930mvFf+b9XmjYgOVhE9CK2fP2az9vFsl8EbdniypwHCrj27Q2uEkILLU0qV5wBW5eMWgmhbXKy06l7YNXFytBMC6kRf3/Wckmq9IFXa1OSCAC4IBYA9pkHHQ96nWA3uCDKNycHDNWLm2Xu6DWkw=
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 22:12:41 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54%7]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:12:41 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Thread-Topic: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Thread-Index: AQHZJiXX/6A2d055l06vuoeKrTCFp66c+LMAgASqCPA=
Date: Mon, 16 Jan 2023 22:12:41 +0000
Message-ID: <SN1PR12MB2575D97162C4BF95DF76CB46E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-7-Felix.Kuehling@amd.com>
 <513453ef-4632-9990-e5a6-bb97fffc4c11@amd.com>
In-Reply-To: <513453ef-4632-9990-e5a6-bb97fffc4c11@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-16T22:11:43Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=b99f4f83-d4ee-45b7-9424-9d38e400c9ae;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-01-16T22:12:38Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: b411a202-b91e-4c09-9b40-1dd4976ff8c0
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2575:EE_|SA1PR12MB6970:EE_
x-ms-office365-filtering-correlation-id: b94c5218-7442-42ef-27cc-08daf80ec948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpsLlsNK9Hc0MiL+7t+OQhL5DdB/xeVilxLMw4CC48wb/0/gGGPxJCItrSwDemalv3MGO0NJqgpO+qlEYdl6U2+pVGRwHcHYATWuk2VxxecKirOpaptRumR273t74mm+PvNqSO2qGEd3hXc5IW6rZZFqmCc2HHCIuEZjIruXGEWme5GMUjMIPN9Tiy/IHm035xwAoGmIHbMMRNhctn57b7mkMUTmtTCRmrwL1SZz8/gHn0qJalmEiMIuRTy11CqRUO30CZCMDftsgVQorXpuKkT4QLpghCscuq1kVd53XwizpdrBhxWkQLSLu2yzfLeZyC/XRm4/ZOBnUeCrD8gcGsLV+g6wBHQO8xewxIpJIi6sfPTVko+tM/E3kcmHrmQuD2/8IzJKxxh1Q/MyPIPmlWHSemjGQw7iWP0WLHayYO6VL1gREEdhAJnIKYuRmDp3vnfBJEPR8m8XEQfikkrUEB5txYzuS/GRFvg0jxBbfd7ZhZiO0aQX7i5a1GUEfpO3xdELek0649ds3UdbhD40YjidBbGJ2Ruo5MDVFmJWBZUnMj093kvjGXlNBFnim9NwDwbaMLlTXy63NPB9pXWIPgIjF2qURtT8w4bKwg9oryDxmFnQPzCofAsjs+SVYDdacs7y7IXYm9lSDn26k1qoczXy6mUPQW5Q6IqnY+nwIC2TLj+IWPdtT5u9fRBiE/X+0eNWMTxGunUylq6wF26iFw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199015)(38100700002)(83380400001)(122000001)(33656002)(86362001)(38070700005)(64756008)(8676002)(5660300002)(55016003)(2906002)(66446008)(4326008)(66556008)(66946007)(8936002)(52536014)(66476007)(76116006)(41300700001)(9686003)(450100002)(6506007)(186003)(26005)(53546011)(316002)(110136005)(478600001)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVVKWEd6VzZYdkhwSVRmcmc3QjJKVWZTTHAvVjVXVFVoam4zMjEyL3V4UWpw?=
 =?utf-8?B?bVBEQzhrYmlRY2NwNDlQN0tNczVKNVRsZFJ5MGdLeGpsbDJJZ3YxcHVDZ2FR?=
 =?utf-8?B?czl5WnR1UG9xRldueDNWTmh4YUxNLzVNM05UbXVFMlpOWGxrb00va3R2dFQz?=
 =?utf-8?B?UW9RSHUrN1dncGdORWxYRUdDUW9DdEhLVnFDWHB0NjYrV3hGbGtLYld1cUMv?=
 =?utf-8?B?NmVFNGx4VlZ4eTFuZElJMEt4Wm5ZWFhTejliaTVVRG42ZWZlTUhFY2tidEpk?=
 =?utf-8?B?VGI5WG55dHRSaFpXekwxU2U4SVJTdFJKZGtkY0JRWDd0MGJLczJtZzZoNXFk?=
 =?utf-8?B?bzZxWjJvckVEWjdNWXFjUURTeWxselcvcXR2TDNIV3cxQzNxNEZ0MlA0NnVz?=
 =?utf-8?B?NENyM29RR2JOWFA1b08yclRNNmUyY09CaFJZWkF5MkUxVkYwRlhBVk1BZ2hX?=
 =?utf-8?B?TE5VRkc5OXlJWWU4RFlPWUlxS1lkWUFha3FyV1JMTjhrUThFejRLSGJuSnpt?=
 =?utf-8?B?TC9jazlJbnA1cDEwRzdNVG9zNEpoOUpaaVFCcEg4TXB2cWxIQzNaMitJWkJs?=
 =?utf-8?B?OWZ4alJ0R1BtUVVHVjdtcWZRZ3NCeDNOYk1TNW9ONytKeFRqUmRXWDhyVGIv?=
 =?utf-8?B?SnhBOUdaVmdiZ09oengzSExjdnZnMWkvVUNqMG1vUHpMU0s5ZDVuZkNsMFlI?=
 =?utf-8?B?aFpmb0xVcjdBcEI5REFkRE5CWEYvT2dpUVNEaDZ2MjFhb0FWSnFGWXc3RUZ5?=
 =?utf-8?B?Y01vNkQzbzNtZEQ0ck96bUFKcWtlOHh5Q0tFK1c0Q3pCZWVpUm5pOTVERS9p?=
 =?utf-8?B?SHJTV2RxOVA4V2szRVZDQmdrNU5ENFdhTDh6UzdkdnlJS2VrU1NoakkyZVE2?=
 =?utf-8?B?U0NuanZ1Nnk0K2dVa0gzck0vTnFvK2FYNVZ1c3BGcnpCWUMxMWNWTXIvbEc1?=
 =?utf-8?B?REtxSTlJcnRNa3d4Qk1VM202VktjODdIQnlLeDBOdVh6aWVxeFVPR2MyWXRu?=
 =?utf-8?B?cHU2TnVpQXdpQVhGMnQwVHdaTG5qVXBjNFk1L3YwcFRFS2VNYmNoQ1lEYXFT?=
 =?utf-8?B?Z3RRR3NlYm5KSUMzT3kxbE5NV1ZtWXRaY1FFWTR6VWxWcnVRM1VTdVNUVzlH?=
 =?utf-8?B?UEZQTkZLUVJDbE1uRjRLdVA0Ry8vNUpmcmZpNFhadGZ3Y09NY1RBQmRQRWFa?=
 =?utf-8?B?Y0hRWE9hUjZocGpweFUxR0dDTEJxdmk0dkZvbCtYVVJQOGdwOVpzMEh4SWRh?=
 =?utf-8?B?SEtoYm5xZUZpVndqWmVKMWlEUXZPVys0MlFnK3hnT1BrT201d0hKNmVTQTFy?=
 =?utf-8?B?YlliZHQ1ZXMwSTlWaUFseDh5Ymt5MXdCU2hNcG9ZeWZMaGpadXNXUGpUYmw2?=
 =?utf-8?B?SVUvVkx2Q2RmU1NKUnpUdU1BQVhPNFdRVnJ1S0oyamllN1BYeWV5cjFVRzFr?=
 =?utf-8?B?UDZYdDQyNVprbm83WjFJbkt0ajNlRnlkRDZUNEk4UE1nWnRKR0JRbTJ1WVBY?=
 =?utf-8?B?aEs0ZkpkVG85ZjZIalU5QUZUeHVkQkdJdU8vYWs3MnhuY3dSazBSSlIzb3Mv?=
 =?utf-8?B?NDBzd2pONHVTeEo2Q3JNaEJ5ckgyVXVhK2JzMVBIRVBJQnp3TkZTY3Jua1BK?=
 =?utf-8?B?SU81TTd4RWdxL2doNHlLakRkWWh0V1FKU3pvOWJPUHFPMXhUMTEzMXNSRXRs?=
 =?utf-8?B?NGY1eng2OUtOUzcvU0lhSkJablJiQjU0bWhXK1ltOTZEOHc3eTFrOXVFL1By?=
 =?utf-8?B?U0kxNU8zVkJlandYc3B6c3NaRHgyV29Qb1lsSnZZaHlFbXp0bWtmOVhwK2dk?=
 =?utf-8?B?cmRBOFdVTDlhdmhNSTBEbHVXSDUxOE41MEtQUHRqQlVoTlJHOGhNTzRWT1lV?=
 =?utf-8?B?YkJmOWhiRk9jbVdOeDBaRXo5UE9TTk5lckFlMDhDd2xkY3ZGYTRPMTEweU14?=
 =?utf-8?B?dFpaNGNXaSsvdzFhczNmK094bWh4Zm4yUlZMNlRJZXkrOVZ1dm5zOXpkejdK?=
 =?utf-8?B?d3ZRZ2FrZDB0bHcyK2FYMWpvTk1nQUU3MzRPeHB0Q0NLNkJpV2RQTzBJSGNJ?=
 =?utf-8?B?bEl2UEE0d1o1cFBUbDh4aTNDTzhtZTZRZXcwMnFndUR4NzRTbThaakRIMGFy?=
 =?utf-8?Q?29xQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94c5218-7442-42ef-27cc-08daf80ec948
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 22:12:41.6370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qG8PLmLgVa5molAlujHTrB58dq3eX5mMLIVdJbp9Jyfvc9qmKcbluMcaDoWA4JegA0kQ4obFww6NDgOYlViW5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkNvbW1lbnQgaW5saW5lLg0KDQpS
ZWdhcmRzLA0KUmFtZXNoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
Q2hlbiwgWGlhb2dhbmcNClNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDE0LCAyMDIzIDQ6MjggQU0N
ClRvOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTdWJqZWN0OiBS
ZTogW1BBVENIIDYvNl0gZHJtL2FtZGdwdTogRG8gYm9fdmEgcmVmIGNvdW50aW5nIGZvciBLRkQg
Qk9zDQoNCkNhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwg
U291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlj
a2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCg0KDQpSZXZpZXdlZC1ieTogWGlhb2dhbmcgQ2hl
biA8WGlhb2dhbm5nLkNoZW5AYW1kLmNvbT4NCg0KUmVnYXJkcw0KDQpYaWFvZ2FuZw0KDQpPbiAx
LzExLzIwMjMgNzozMSBQTSwgRmVsaXggS3VlaGxpbmcgd3JvdGU6DQo+IFRoaXMgaXMgbmVlZGVk
IHRvIGNvcnJlY3RseSBoYW5kbGUgQk9zIGltcG9ydGVkIGludG8gdGhlIEdFTSBBUEksIA0KPiB3
aGljaCB3b3VsZCBvdGhlcndpc2UgZ2V0IGFkZGVkIHR3aWNlIHRvIHRoZSBzYW1lIFZNLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMg
IHwgMjggKysrKysrKysrKysrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCBkZjA4ZTg0ZjAxZDcuLjhi
NWJhMmUwNGE3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBAQCAtMzcwLDkgKzM3MCwxNyBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9hbWRrZmRfYm9fdmFsaWRhdGVfYW5kX2ZlbmNlKHN0cnVjdCBhbWRncHVfYm8gKmJvLA0K
PiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+DQo+ICAgICAgIHJldCA9IGFtZGdwdV9hbWRr
ZmRfYm9fdmFsaWRhdGUoYm8sIGRvbWFpbiwgdHJ1ZSk7DQo+IC0gICAgIGlmICghcmV0KQ0KPiAt
ICAgICAgICAgICAgIGRtYV9yZXN2X2FkZF9mZW5jZShiby0+dGJvLmJhc2UucmVzdiwgZmVuY2Us
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9SRVNWX1VTQUdFX0JPT0tL
RUVQKTsNCj4gKyAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICBnb3RvIHVucmVzZXJ2ZV9v
dXQ7DQo+ICsNCj4gKyAgICAgcmV0ID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMoYm8tPnRiby5i
YXNlLnJlc3YsIDEpOw0KUmFtZXNoOiBDb3VsZCB0aGlzIHN0bXQgdG8gcmVzZXJ2ZSBzcGFjZSBm
b3IgZmVuY2UgYmUgYXBwbGllZCBpbiBwYXRjaCA0Lg0KDQo+ICsgICAgIGlmIChyZXQpDQo+ICsg
ICAgICAgICAgICAgZ290byB1bnJlc2VydmVfb3V0Ow0KPiArDQo+ICsgICAgIGRtYV9yZXN2X2Fk
ZF9mZW5jZShiby0+dGJvLmJhc2UucmVzdiwgZmVuY2UsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBETUFfUkVTVl9VU0FHRV9CT09LS0VFUCk7DQo+ICsNCj4gK3VucmVzZXJ2ZV9vdXQ6DQo+
ICAgICAgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPg0KPiAgICAgICByZXR1cm4gcmV0Ow0K
PiBAQCAtNzg1LDYgKzc5Myw3IEBAIHN0YXRpYyBpbnQga2ZkX21lbV9hdHRhY2goc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICAgICAgIHVpbnQ2NF90
IHZhID0gbWVtLT52YTsNCj4gICAgICAgc3RydWN0IGtmZF9tZW1fYXR0YWNobWVudCAqYXR0YWNo
bWVudFsyXSA9IHtOVUxMLCBOVUxMfTsNCj4gICAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm9bMl0g
PSB7TlVMTCwgTlVMTH07DQo+ICsgICAgIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhOw0KPiAg
ICAgICBib29sIHNhbWVfaGl2ZSA9IGZhbHNlOw0KPiAgICAgICBpbnQgaSwgcmV0Ow0KPg0KPiBA
QCAtODcxLDcgKzg4MCwxMiBAQCBzdGF0aWMgaW50IGtmZF9tZW1fYXR0YWNoKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgcHJfZGVidWcoIlVuYWJsZSB0byByZXNlcnZlIEJPIGR1cmluZyBtZW1vcnkgYXR0YWNo
Iik7DQo+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHVud2luZDsNCj4gICAgICAgICAgICAg
ICB9DQo+IC0gICAgICAgICAgICAgYXR0YWNobWVudFtpXS0+Ym9fdmEgPSBhbWRncHVfdm1fYm9f
YWRkKGFkZXYsIHZtLCBib1tpXSk7DQo+ICsgICAgICAgICAgICAgYm9fdmEgPSBhbWRncHVfdm1f
Ym9fZmluZCh2bSwgYm9baV0pOw0KPiArICAgICAgICAgICAgIGlmICghYm9fdmEpDQo+ICsgICAg
ICAgICAgICAgICAgICAgICBib192YSA9IGFtZGdwdV92bV9ib19hZGQoYWRldiwgdm0sIGJvW2ld
KTsNCj4gKyAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICArK2JvX3Zh
LT5yZWZfY291bnQ7DQo+ICsgICAgICAgICAgICAgYXR0YWNobWVudFtpXS0+Ym9fdmEgPSBib192
YTsNCj4gICAgICAgICAgICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGJvW2ldKTsNCj4gICAgICAg
ICAgICAgICBpZiAodW5saWtlbHkoIWF0dGFjaG1lbnRbaV0tPmJvX3ZhKSkgew0KPiAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsNCj4gQEAgLTg5NSw3ICs5MDksOCBAQCBzdGF0
aWMgaW50IGtmZF9tZW1fYXR0YWNoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
a2dkX21lbSAqbWVtLA0KPiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ICAgICAg
ICAgICAgICAgaWYgKGF0dGFjaG1lbnRbaV0tPmJvX3ZhKSB7DQo+ICAgICAgICAgICAgICAgICAg
ICAgICBhbWRncHVfYm9fcmVzZXJ2ZShib1tpXSwgdHJ1ZSk7DQo+IC0gICAgICAgICAgICAgICAg
ICAgICBhbWRncHVfdm1fYm9fZGVsKGFkZXYsIGF0dGFjaG1lbnRbaV0tPmJvX3ZhKTsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgIGlmICgtLWF0dGFjaG1lbnRbaV0tPmJvX3ZhLT5yZWZfY291bnQg
PT0gMCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3ZtX2JvX2RlbChh
ZGV2LCANCj4gKyBhdHRhY2htZW50W2ldLT5ib192YSk7DQo+ICAgICAgICAgICAgICAgICAgICAg
ICBhbWRncHVfYm9fdW5yZXNlcnZlKGJvW2ldKTsNCj4gICAgICAgICAgICAgICAgICAgICAgIGxp
c3RfZGVsKCZhdHRhY2htZW50W2ldLT5saXN0KTsNCj4gICAgICAgICAgICAgICB9DQo+IEBAIC05
MTIsNyArOTI3LDggQEAgc3RhdGljIHZvaWQga2ZkX21lbV9kZXRhY2goc3RydWN0IA0KPiBrZmRf
bWVtX2F0dGFjaG1lbnQgKmF0dGFjaG1lbnQpDQo+DQo+ICAgICAgIHByX2RlYnVnKCJcdCByZW1v
dmUgVkEgMHglbGx4IGluIGVudHJ5ICVwXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICAgYXR0
YWNobWVudC0+dmEsIGF0dGFjaG1lbnQpOw0KPiAtICAgICBhbWRncHVfdm1fYm9fZGVsKGF0dGFj
aG1lbnQtPmFkZXYsIGF0dGFjaG1lbnQtPmJvX3ZhKTsNCj4gKyAgICAgaWYgKC0tYXR0YWNobWVu
dC0+Ym9fdmEtPnJlZl9jb3VudCA9PSAwKQ0KPiArICAgICAgICAgICAgIGFtZGdwdV92bV9ib19k
ZWwoYXR0YWNobWVudC0+YWRldiwgYXR0YWNobWVudC0+Ym9fdmEpOw0KPiAgICAgICBkcm1fZ2Vt
X29iamVjdF9wdXQoJmJvLT50Ym8uYmFzZSk7DQo+ICAgICAgIGxpc3RfZGVsKCZhdHRhY2htZW50
LT5saXN0KTsNCj4gICAgICAga2ZyZWUoYXR0YWNobWVudCk7DQo=
