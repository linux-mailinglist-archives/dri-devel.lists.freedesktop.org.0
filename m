Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BD72CA6D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277B10E2AA;
	Mon, 12 Jun 2023 15:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AF510E2A5;
 Mon, 12 Jun 2023 15:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ2U0X0pPudFCG3+lldPwYXwtSE2Z3WjRX9A1cdIr9TUD+RoJkBNbzu0Gl0FdWcP1DEm+9ggcBJraeMdijD7KSiEp4feO56I/c+YPjbJGJtoV1iVOqDJHUVXi+4TMUXaXUHevzEoj+0E1QvKdQ+xra+ivrKGRog37YB+NRmWbiF6LpUlNUax+Kq/ToDay5rZAqW4ieiB0UFL2jSoED8iQF9r8ED+lD5hUXc5rnxkf0R0FF//Iyf73BRzifCfPepK+GFsl8CJAKLjlsVn4n5dEIvbnxpZHyMtEAERHij+0ACy1LUFVOq3WdYZ0sKNQrMNlzzotHECQnqqEsF3R/XfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54wD0YXK97dBDiZn0sdQKII5ZGiuDFXC2/5XcU+XjsQ=;
 b=k9/60x1prpwFjPrQ/tqMz1R8mtb7XgzUM4ZTj0iKRiz0FRPYTClbbQYWdl+2jqJBuVWP0Grw53LviiZm0Byx0bXyAtGUbDJ6ub6vURRVFT9V78Jy9aOjLa1EJRFEFQVfrQhOCktHh0wDXAWXHlDZ7yYZxBXIIZML0UoA1uxizvD3Y8JT0ZbZufOnCQ6m2dtCj5M0b9gYsqoD0Z5uWzpdbY2OERCsGDveNwF7TEEeFJWFfUlpu7B+XDHbqnirXoqZhgdg3h/YFRpSsY/9oLlxU/4Pkd49sAIvVkJ3CEezeDghWjShcX1WXNFm9ECPLbASo0TCKB83kkw/7+mxGoimlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54wD0YXK97dBDiZn0sdQKII5ZGiuDFXC2/5XcU+XjsQ=;
 b=3DxENOqofNb3Z2j1rxOyZqY+AmnVyeNEv9X33sWJ6YZjrnfnnqpCyacFJYuhtO8e+eXTTpWXjflPC21pPJoOe+GDMIBypcKezEZ/051aJ5532webMAdCi5bcDYT2ujZTkB1PbVukXTRRthvreWwrRlRKn08L6QOV3c2PqAJeVRg=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 15:39:39 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::100e:1d82:bd2a:e05e]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::100e:1d82:bd2a:e05e%3]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 15:39:39 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Lu Hongfei
 <luhongfei@vivo.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] gpu: drm/amd: Remove the redundant null pointer check
 in list_for_each_entry() loops
Thread-Topic: [PATCH v2] gpu: drm/amd: Remove the redundant null pointer check
 in list_for_each_entry() loops
Thread-Index: AQHZnS6t80HF/78KFUOFdo6ZbEBwXK+HSdUAgAADdPA=
Date: Mon, 12 Jun 2023 15:39:38 +0000
Message-ID: <CY8PR12MB743557DB910470B5433B320D8554A@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20230612115848.8739-1-luhongfei@vivo.com>
 <19a8be24-0b5c-4232-d3ba-dc7f269bafd3@amd.com>
In-Reply-To: <19a8be24-0b5c-4232-d3ba-dc7f269bafd3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1611ccea-be21-4318-85c2-388ecd06d0b4;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-12T15:39:27Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: 3b283d7a-2b03-48e5-861d-08db6b5b3b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ssMO7hWxF1kDQLMEgTxkLZnEUTa+FD+GpKSIpUPjxmjbfbRdvKwJe1qKo9XuFGODt2r4uQiEi8iBAG7Qk6H7DarmfsA4hOyVUw5yxWSMfy4XVYS5sXM0RJ4XAwBl8r8BoAZuOfyqpETHG/cvU/S8iwvgMQSeJ02CkExeZ1sq/CMnnuSCxNEF5rpg+iFEcyCn+2LS+8HOoLkHopF2XnAfcnvbtMD8216F7Mp+rPpOjDI16ylR1vVmbEZLht0jBt6epR6ldHqWMUO0xcRkHrCOWQEdg5Dh74gzq48I+fm1rI3O9jid3Zf2XxOrHehFGCiDWCuHGTGWtn5obvlfPir9yG/EJjfMOsjcAvBo5WpMgnMAsCMGU9BKbsp1mAQSV7/CzZqgNGuJIlS1MedIYSPCIAZDCbF6pdaxYcIPVBdXFrChzW7Z5mZh8uNCHqAA3B+u0YhFG23PnRR51UMMycnAVqmxNEPnITfuEppsj6Qux++8UQIeomCF2OhSizUJ8vvS6lubqoQqc0N6+0qdDcwgiYxb4spgk3D+fCmt1nZryxWFI72ZY2D7aPKrl9U8ONDG3XmLM7WPFLdX76jHchSknZhhtZGqt8D2O4T7raBc5R54puinacTvmSbsPLf6Hm4YdloNLepQWa/hbTxn5SoBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66446008)(66946007)(71200400001)(64756008)(316002)(76116006)(4326008)(110136005)(478600001)(33656002)(86362001)(38070700005)(9686003)(6506007)(53546011)(186003)(83380400001)(41300700001)(5660300002)(8676002)(2906002)(52536014)(8936002)(7696005)(55016003)(921005)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZRYmYwSzRETlZLbTIzMDJMaGZtQWNLWHF3QWxsYTFnVC8xdjY1Z0FhUm1L?=
 =?utf-8?B?eGh2QUk5ZnQvaVZ5aDVyK3pPS0ttbWV5S2xGdDJ5UTl4QlFsUXZ3T01lZUdq?=
 =?utf-8?B?aWJyUWp0MkN4TXViZjE3d1pURmhqeWIxckl2SkRleVJMQjdWMmFIa3dqaTVL?=
 =?utf-8?B?alpkTXIzYmdvbzZQTlFSSzZaeGVTWWpKcXhzUWpJU2RiMDFQN290cXlZREF4?=
 =?utf-8?B?bkZvV2NTckRhbC9oVjdLNldkY2JRYi9oY2p4WVNTa1gyU3ppa3I5dmpvRUEy?=
 =?utf-8?B?TTY0eXY3M3p0TTdIOGlUdzgzMTA2bi8zVkRpaGxseFczTmFBamtIRFNTSXVN?=
 =?utf-8?B?bStTK0s3c21KRmNRVHVuU2RkSVcwZ0ZiSlE0aE5Kd2tsQXRublArajIzUUt0?=
 =?utf-8?B?NlptUy9nV0NyM1RicDZsS1BVZGFuVlE5c01GTXQ5d2RibTM4anpoUjkzdThu?=
 =?utf-8?B?WjF6VUkxZEI4TTdEUzdYTTE5TlhxZHNlWnNWU09PdVNCNm10ekdHb1lWWjlo?=
 =?utf-8?B?ZExQdjM3NHdtcEx2UDJTSFNQTS9JdFFGNkpTSzJ6RlJJQlFSZkpMMU1HK0o3?=
 =?utf-8?B?SDJHOUV2SkZOZHcvWmdocGt5czRPM2wrODJIK2ZzWFY1WVB3SWF2VG5takEx?=
 =?utf-8?B?aGZuVHRnVGQ3a0dzTERFU1FMWEF3YmdKT3JGYzM1QXB4cE5oTEVjOVVzSSsw?=
 =?utf-8?B?VThmcVlxeXlWMEJyU3FSV1JGSWsvRjYxUElPSGwxdUJ4QVNmdzlSc3pNUnFN?=
 =?utf-8?B?UUhnd2tpVFBRZFhvSTdMMW5wRmI0WGNOVW1YUG5nQzhQa09wZkl1YkRGa0hP?=
 =?utf-8?B?UnpZUTBFcTFSK2FUazRrVitCWWU4NDNyaUQzMm5PNUgzc0ZhS3VBS1ZFRkF5?=
 =?utf-8?B?RjNaeDk5VVFlelUxRUMvTElXaFJROG0rZ2FCeHpxR2Q3VkFTeXEzTjlHWm5L?=
 =?utf-8?B?RmZ6UFRNQ3VTdUZmdnZzSHpBa2xwTWdKK05BZi9XMVc0TW1aK01hWHMwKzly?=
 =?utf-8?B?eVY5N1MyQjF4bE5aL3kzdnhSazNZd1VscmhqSmpaVDdOU252SG5CNy9aQ2VD?=
 =?utf-8?B?aG1PTkV2VDhIcVZXZ05OVHp2Z0Q1UHVjbklHbjdIemVqc0pxendNMkpnNnU1?=
 =?utf-8?B?UlZRKzhsY3RQMW9ZeklETTRqalZIUGs4a3hGZ3dqTi9DQy91YnN4cXFLaWgr?=
 =?utf-8?B?QWZ1MWxwcGRuUUFFMGEwOVRSNjBqQlZteE5BaDlIU1Q4dlFLbzJFb3Z0TkxM?=
 =?utf-8?B?Sjg3N09oT3h5cVh4SnNYZjRCV2Nnb04rU3dYb3h3Z2lpcTM0Yll4bjZRNjF1?=
 =?utf-8?B?bE1QWHF6YmJna2RRYUJyajQydStlemw3SzRHNzJsT29XWWhlWlBlMVRrN0Fh?=
 =?utf-8?B?TEZwOUt5cUlobGo4ckNpMDhEUjBVQitCWlg4bUpuSm1HSnVyQlFVT3hxWTRN?=
 =?utf-8?B?alVtTG1lSjcrNU8wamEyQ1YyVmlSTDV5M291ZkxveGJqcStBSDZsK0ZqNzdJ?=
 =?utf-8?B?VzdTelFDN1Evejd0R3FpdTZxWVRCWU5ZWmdYSXpDcEx1Q1VsUThFTld5QVZH?=
 =?utf-8?B?UnQwaW5sc09oM0RleEwrZzFWSjRJWWVuTm4xQURGVGpUMTBvVTg5YitGRGlj?=
 =?utf-8?B?YnpCQXlYUUxpWUs3Z1dkNGJSb09TOGJ6YXhiQUhOU0RwUzFYR1kyN1I0WTRl?=
 =?utf-8?B?ODVCTDl1b2crTlhGVVlGWlE0c3ZKc04rS2Q1ZVp6SU1nTzhPa1RzcStRQnM2?=
 =?utf-8?B?STBuQXRKUWw4RVg5TEF2WFI3TDU4eG1zdmx5OHgwbGsydlFNb2dJZmZJSFAw?=
 =?utf-8?B?N0luQ3JMbEk3dUljRisvNndXRzBEQkp3NzhUNFNVdXR4SFBJa3Zha05aUjJy?=
 =?utf-8?B?REcvaWhFK2RNVFA0dlEwNlpNUkpheUMyRm95ZFNjeG5uUVU5T1lreE1jek5T?=
 =?utf-8?B?V2ZGUnczcHB0MTRzOFYyNm90cXpubTVBUXhFQjB3cHhFdXNuQ2RkekpleVkx?=
 =?utf-8?B?SkFrc01WMHFHNVJ1SzR2K01VaEgvbmw3ZDRmbm9GRSs0alFHYXpSSHYvb0w0?=
 =?utf-8?B?NHFKM0tPM3R5Y1doSExKQnIrcFNhbU9PTmdqWnJzTjA2RFdYeVhuVlYxWDAy?=
 =?utf-8?B?ZXpOVlR1VmxJMDhSL2RFMkZKR3FENUtGM1JUaktpVllVU1lYS1hPeHFQRkVo?=
 =?utf-8?Q?pPdnuC9RpElaVn4jqhC49w4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b283d7a-2b03-48e5-861d-08db6b5b3b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 15:39:38.9187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECFoXiIpNPKLZgSVOHosyU7mdalwULuahqPojuDHkJxItJSxsieNLlhoKd7tpv/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
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
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLdWVobGlu
ZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAx
MiwgMjAyMyAxMToyNSBBTQ0KPiBUbzogTHUgSG9uZ2ZlaSA8bHVob25nZmVpQHZpdm8uY29tPjsg
RGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmln
LCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxY
aW5odWkuUGFuQGFtZC5jb20+OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsg
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgb3BlbiBsaXN0OkFNRA0KPiBLRkQgPGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgb3BlbiBsaXN0OkRSTSBEUklWRVJTIDxkcmkt
DQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IG9wZW4gbGlzdCA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz47IEtpbSwNCj4gSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29t
Pg0KPiBDYzogb3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2Ml0gZ3B1OiBkcm0vYW1kOiBSZW1vdmUgdGhlIHJlZHVuZGFudCBudWxsIHBvaW50ZXINCj4g
Y2hlY2sgaW4gbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGxvb3BzDQo+DQo+IFsrSm9uXQ0KPg0KPiBB
bSAyMDIzLTA2LTEyIHVtIDA3OjU4IHNjaHJpZWIgTHUgSG9uZ2ZlaToNCj4gPiBwcW4gYm91bmQg
aW4gbGlzdF9mb3JfZWFjaF9lbnRyeSBsb29wIHdpbGwgbm90IGJlIG51bGwsIHNvIHRoZXJlIGlz
DQo+ID4gbm8gbmVlZCB0byBjaGVjayB3aGV0aGVyIHBxbiBpcyBOVUxMIG9yIG5vdC4NCj4gPiBU
aHVzIHJlbW92ZSBhIHJlZHVuZGFudCBudWxsIHBvaW50ZXIgY2hlY2suDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMdSBIb25nZmVpIDxsdWhvbmdmZWlAdml2by5jb20+DQo+ID4gLS0tDQo+ID4g
VGhlIGZpbGVuYW1lIG9mIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHdhczoNCj4gPiAwMDAxLWdwdS1k
cm0tYW1kLUZpeC10aGUtYnVnLWluLWxpc3RfZm9yX2VhY2hfZW50cnktbG9vcHMucGF0Y2gNCj4g
Pg0KPiA+IFRoZSBtb2RpZmljYXRpb25zIG1hZGUgY29tcGFyZWQgdG8gdGhlIHByZXZpb3VzIHZl
cnNpb24gYXJlIGFzIGZvbGxvd3M6DQo+ID4gMS4gTW9kaWZpZWQgdGhlIHBhdGNoIHRpdGxlDQo+
ID4gMi4gIlRodXMgcmVtb3ZlIGEgcmVkdW5kYW50IG51bGwgcG9pbnRlciBjaGVjay4iIGlzIHVz
ZWQgaW5zdGVhZCBvZg0KPiA+ICAgICAiV2UgY291bGQgcmVtb3ZlIHRoaXMgY2hlY2suIg0KPiA+
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWcuYyB8IDMgLS0tDQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWcuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZWJ1Zy5jDQo+ID4gaW5kZXggY2QzNGU3YWFlYWQ0Li4xMGQw
Y2VmODQ0ZjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RlYnVnLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWcu
Yw0KPiA+IEBAIC0xMDk3LDkgKzEwOTcsNiBAQCB2b2lkDQo+IGtmZF9kYmdfc2V0X2VuYWJsZWRf
ZGVidWdfZXhjZXB0aW9uX21hc2soc3RydWN0IGtmZF9wcm9jZXNzICp0YXJnZXQsDQo+ID4NCj4g
PiAgICAgcHFtID0gJnRhcmdldC0+cHFtOw0KPiA+ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBx
biwgJnBxbS0+cXVldWVzLCBwcm9jZXNzX3F1ZXVlX2xpc3QpIHsNCj4gPiAtICAgICAgICAgICBp
ZiAoIXBxbikNCj4NCj4gUmlnaHQsIHRoaXMgY2hlY2sgZG9lc24ndCBtYWtlIGEgbG90IG9mIHNl
bnNlLiBKb24sIHdhcyB0aGlzIG1lYW50IHRvDQo+IGNoZWNrIHBxbi0+cT8NCg0KWWVzIHRoYXQn
cyBhIGJ1Zy4gIEl0IHNob3VsZCBiZSBhIG51bGwgY2hlY2sgb24gdGhlIHF1ZXVlIGl0c2VsZi4N
CkknbGwgc2VuZCBvdXQgdGhlIGZpeCBzaG9ydGx5Lg0KDQpUaGFua3MsDQoNCkpvbg0KDQo+DQo+
IFJlZ2FyZHMsDQo+ICAgIEZlbGl4DQo+DQo+DQo+ID4gLSAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsNCj4gPiAtDQo+ID4gICAgICAgICAgICAgZm91bmRfbWFzayB8PSBwcW4tPnEtPnByb3Bl
cnRpZXMuZXhjZXB0aW9uX3N0YXR1czsNCj4gPiAgICAgfQ0KPiA+DQo=
