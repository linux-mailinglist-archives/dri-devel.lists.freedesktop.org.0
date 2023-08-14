Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E415B77B335
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 10:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28710E152;
	Mon, 14 Aug 2023 08:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B2110E152;
 Mon, 14 Aug 2023 08:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLZ2rHgMjy+LSECOIlus6uZayMuJt46UHa1Rg13aDMyqeLp8kNF7KNT7vA/zOFqQ//CiTWOtggODdFfrim8iv1jzrfdX9HK3rL9S0/gQrGvnLxbKCWBq7gf8pf/RM26O2RIBfthTp3pSQnKji+WLdt37+9MoCYzJwrstAESzLjD2U4eKTKvU2JDVEiHU91juj/UjSMvI6zSRz3r6CXYCNVoyN+zB4UPYDU4LGKTf6J9hWBznEJFyIZeflv2N2bJL7dCHNEBCQ3SvxXOzVnVdkuB0/ncKV2SSxoIjaE7r8BmJEzXGfaTbuaI+Y1iDoDhRiNccVez7NSrBOSa52NE5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rN0noe+P7/3W+W3xZfZkL2UMSbGxiV29zTdRNTTnYI=;
 b=ifgOcDer2ws2QT7HM8VM5GzuujbRyaXQo2oFzvULSWbAWI2ZkOJIsMl9kcXA9YMLjHbNIM0ysIvnnkJnxvFpmif9V3NRBP+6rDT5LSHmSX4gS3/dCm1BjdUwLnjRu9RbJu3f9R6N//lT3jegVHQFK/hTMWqFSJFXSSSfK2DoGwotdMyzJ62bBXtrbQb9Q1bmzvGa+NJyH3MkuE2B6phzs94hxwkNx8tlmvnZCeYxmPUY+Oo+X/OAhsyJBUnhmr+O8KPAbFZYbo2yuI0i3dJIMpDB3QA17EVL74CPpgMj5a8XPga6qcxGMSiYAIpzQ5zAVWnDfz+tT1ixtK7A1HdC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rN0noe+P7/3W+W3xZfZkL2UMSbGxiV29zTdRNTTnYI=;
 b=eTKIw8tJ5El9inxBlgkRIHxGlAWvTFbm8InGVOdB7IYhATJ49sMLt/I8rtYpwuig17PMptC6OlvZhS9lxoXOQ2n1NXps2v7pWJfkuHVhOT9AttKyck6W8tlUnPsVF0NXk5cLa3JpD3mPbw/gxYQs4SHTI8wbveTwiXfTtj9Df98=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 08:03:02 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:03:02 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Randy Dunlap <rdunlap@infradead.org>, "rafael@kernel.org"
 <rafael@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "jim.cromie@gmail.com"
 <jim.cromie@gmail.com>, "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "trix@redhat.com"
 <trix@redhat.com>, "jsg@jsg.id.au" <jsg@jsg.id.au>, "arnd@arndb.de"
 <arnd@arndb.de>, "andrew@lunn.ch" <andrew@lunn.ch>
Subject: RE: [PATCH V8 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V8 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZy13P45gUlRqMfUa1FWDr4AZM/6/jq2yAgAXH9UA=
Date: Mon, 14 Aug 2023 08:03:02 +0000
Message-ID: <DM6PR12MB2619B174ABD45D6C3D261B9CE417A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-2-evan.quan@amd.com>
 <efb2d30c-3945-a63d-9a3f-7cf39124f76a@infradead.org>
In-Reply-To: <efb2d30c-3945-a63d-9a3f-7cf39124f76a@infradead.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-14T08:02:58Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a34a2889-3e5e-487a-984e-b7520cf3077b;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DS0PR12MB6416:EE_
x-ms-office365-filtering-correlation-id: 55324542-6cd0-40a2-5744-08db9c9ce1e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Or+7pImhVNZrqFXcRI0FC1pnvWPDIayOb/pTgmnyWtrIvL6rEyAfpJOxDrt4NLT5zS31Lub0eRfeNWJmISt08HW/na2XjhKjDOVouowkpEYg/a9PNDBOA+aRndFHIkqb+cuJYv1SHtzNxRLfiRmci0MzJ8eEkmLjTYECNPbI+DREvzKXu/CoH+0uEgGbH7ClkmnU/WkkcFGDN2Q/D5nRZx4NnJ/d6FbRhXeL/K68hIteLTBrmPUW5KB1Y3Sb/nOASuAyodxkF5uRCGFf331Ee+Zv+ygyeQbf8O1XsQ+hVYjppEF5BYFHW67O+qHNllXSndzRiP8NUXBKuGNrW741cp7oFFiqCoKhZ34fcm3zHr8oVVdSAV82eHZDsJ/WgKy7G8FuEP8m8PsaJ7dMZc8UZO8mudiasG1hLP6ApJLDPAWJ5vV/jYBgMgJP8ipebD7ZOq9C0WYduBJ8Ug0cg7UEbArOwL83zapm64b0848OXNzV/QsKFFwXCpFEFp/hYD1CxBzpSiuVb8pSJM4pgAhz5ziCxIJIvehMFjLoJhi6LM4DKjO56VpaxmHx+Lua4xakvlENm1GfHnhfmy4WqOAhlJ/njSxSMvFyzyJz6WaIIN2MxKX6v3wEodkSCtsiigDM/34jyxwpG9OkMn1P4BSITA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(186006)(1800799006)(33656002)(52536014)(5660300002)(7416002)(2906002)(86362001)(55016003)(83380400001)(66476007)(54906003)(66556008)(64756008)(66446008)(4326008)(38070700005)(76116006)(38100700002)(66946007)(316002)(110136005)(41300700001)(26005)(9686003)(53546011)(6506007)(7696005)(71200400001)(8936002)(8676002)(478600001)(921005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkRrSW1EZllwWWszck1Qcko1S2tFenFGMHZBSVZDSTQzUFRDTEhEVU5kOXg0?=
 =?utf-8?B?cXZ2M3RCc2FEZ2d4UEMxajJBeXYxb0kxYkU3OEVzRGhaRVZ2aUxHV29HZEUx?=
 =?utf-8?B?RFlxTDAyd3ZONnFtS2R0bzlLOHNhRCthZmg0aXM2ZUloK2l6R1hKWnJINHI2?=
 =?utf-8?B?emxpNGRnU1gyNjdFRUtXZGgxdkZ1bmZZRGVqYlRQMDN1cTFpSml1WkVkRDYz?=
 =?utf-8?B?eDB2N2thTGhhY29kaFRkUy9vUG1XQmlkbTg5bndYSlM0WkdudDJ5QThpVkdh?=
 =?utf-8?B?aTc5eW16bEpCWEFjMnBKalBTcjBPdUhBZVBZcDVXcDdBcjIxYjFFMk4zNXVD?=
 =?utf-8?B?VzdGd213N0NJNHQ1ZVdhK1hVNGRKRUFCSi9EQmQ5dW81Y2lGNUUyTkRtQmo4?=
 =?utf-8?B?ZFI3QlE2T29STmM0eWZDdDFobDE0ZGJ6eXVFc1NNcDZDTE96SFBlcjk0Q2t2?=
 =?utf-8?B?Y1VGNlJla2UxTkRub29uSmJ4dlhYVTBRcDRmTEJ2R1MwbWV2YzFHZHRTaWZ1?=
 =?utf-8?B?eUMvb1llb2c0Smh6ZVRocnBsN2FzQkRoa0tFU2VsWW9qMlE3Z3gvMDB4QytY?=
 =?utf-8?B?aHdWL1VhZG9UNGVHOGdSenZlUkU3T01JVVcyVVhSLy90WWExbG5jL2R6YktU?=
 =?utf-8?B?NUY0QlZpVEh6RGt4RjlzT0VaMnBUNXF6OGhvcXVwallCdGd4Wm5Idk93TmZL?=
 =?utf-8?B?Q1c1SFdwcTJyRDdPM2JTTU5MQ0NaZWxub0tzZmNGem9JSXdBOVdPNERnNnMy?=
 =?utf-8?B?OUoxb2hWWTJ2MVBhNDZha0lyemhLb0ZBWGFGTlk1WXE5N09BcEd2SlBLbnJy?=
 =?utf-8?B?d1NZMUhuR00zQ1ZNZlBYdTNLUTRMVUFBMFNOampKYjhIOVcrZFEyWnpYdW9Y?=
 =?utf-8?B?OCs3Vzl1RGdJY0dOR3lkSmFhcXNIZ0VzekI2alBuS2R3SmtHTzBUd0UybkhK?=
 =?utf-8?B?NlZoYXJURU9KM0F2bmcyZW1wR0FIVjRkdkNBNGdEMGFQQzFiMTVyajdDU2Fh?=
 =?utf-8?B?eW1oZFBNZ2ZLU2VyclhYMU1USFd0SHJsUVo5amErVzB3VnRKNytNOUkxcnVD?=
 =?utf-8?B?NzNDSy9Lc2p1QmpubU03MnNCNkJEaFNNTzRkUi9BdWNhZ3VOZWxzZzNXeHl1?=
 =?utf-8?B?djlNM1o0ZTl5RU96bGllNUZEZTQxQ3htbGM2QjM5aURzR2FNUmdHVjJ3RDE1?=
 =?utf-8?B?YzMwR1lDU1BBSHBRVmFaSExmOGpvRWYvUkk4MnNWM1o4VXhuUEdBa2puRm1h?=
 =?utf-8?B?Z25scVl6VE9CZnlFSDRzc1dNdkpDM2h1NkdJUit3R003VlhIQURlVFUzbDN0?=
 =?utf-8?B?VHU5ZUtHQUloSnB1ZHhja3ppUC9Ub2RLMEhqNEZSVVF0UEh3dHlJbXliUkFt?=
 =?utf-8?B?L1E4NG1JeG9EazRTVE0raFFOZVU5ZVVCUVQwdHczSEw2N0RYSXFvc2QvYnVv?=
 =?utf-8?B?dmdCQzBFb0RSamZ5OENwakI3eHNIRW9WOHRyU3BsZ0NvL1Y3bXA3c3JOVHhS?=
 =?utf-8?B?NWFHTFh1ZWlQdXVJN25XbXlNRjJHbnRYS1R6dVJxbXNVeUQxaWp0eklDVU5m?=
 =?utf-8?B?N0lkMVRBWTZKREl1NllrMnZ2bm92VytCOTdkK3RQVDcwS0RsR1RRd0RIREY1?=
 =?utf-8?B?N21WdGlhbFV1WXZRZFhwNVBZQjJRUnRIWmJaT0ovcjZZZFdQNmZHLzJ2QWMz?=
 =?utf-8?B?aHA0VHhTbXEvMGFGamNFRXVwM3dDMGV0cDBERVNSTWZPOFpwQTd1ako0RmdW?=
 =?utf-8?B?TE9kQmpSdFFOV1piSFFVK09sVzBjeFZEaThETjE0TnY1SGZEb2RHa2plV1k0?=
 =?utf-8?B?VnlNdVFiZ2ZvTTN0aEZkdVlvRWtHVlNXVWxJVThnTU4yZmpRckUySjVuOVh4?=
 =?utf-8?B?dkg5R0xPSnp1VThTNzkzd3haUWlUZHFsbVB1OW9pU2VZdjM4a0o5OW5yQWRG?=
 =?utf-8?B?OGR0UnRYbFMrQ28rb25PV1cwbk10cEF6WDdMbFFrUitPaE1pVXk2QUtnRXBG?=
 =?utf-8?B?cFVIeVhLbThUSDM4MHFKSlpTcklQS0JEbDJGUjRhQlovc3JnQWFxUDFxWlNK?=
 =?utf-8?B?K2lQWTBUUEN2RFdaNEdqaGh2Ump5YUROVC9ybHl1MUVCYnViaG1OUXpZMlIv?=
 =?utf-8?Q?PEi4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55324542-6cd0-40a2-5744-08db9c9ce1e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 08:03:02.1416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vl+5LiTUi7Qzkfhv1YTL72O9v/AgzqQotTP79JnHnpjLYYESymkv7MayAJAOynJU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pg0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDEwLCAyMDIzIDExOjQxIFBNDQo+IFRvOiBRdWFu
LCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IHJhZmFlbEBrZXJuZWwub3JnOyBsZW5iQGtlcm5l
bC5vcmc7DQo+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4sIFhp
bmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsNCj4gYWlybGllZEBnbWFpbC5jb207IGRhbmllbEBm
ZndsbC5jaDsgam9oYW5uZXNAc2lwc29sdXRpb25zLm5ldDsNCj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5l
dDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJuZWwub3JnOw0KPiBwYWJlbmlAcmVkaGF0
LmNvbTsgTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0BhbWQuY29tPjsNCj4g
bWRhZW56ZXJAcmVkaGF0LmNvbTsgbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOw0K
PiB0emltbWVybWFubkBzdXNlLmRlOyBoZGVnb2VkZUByZWRoYXQuY29tOyBqaW5neXV3YW5nX3Zp
cEAxNjMuY29tOw0KPiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPjsgamltLmNyb21p
ZUBnbWFpbC5jb207DQo+IGJlbGxvc2lsaWNpb0BnbWFpbC5jb207IGFuZHJlYWxtZWlkQGlnYWxp
YS5jb207IHRyaXhAcmVkaGF0LmNvbTsNCj4ganNnQGpzZy5pZC5hdTsgYXJuZEBhcm5kYi5kZTsg
YW5kcmV3QGx1bm4uY2gNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWFjcGlAdmdlci5rZXJuZWwub3JnOyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiB3aXJlbGVzc0B2Z2Vy
Lmtlcm5lbC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBWOCAxLzldIGRyaXZlcnMgY29yZTogQWRkIHN1cHBvcnQgZm9yIFdpZmkgYmFuZCBSRg0KPiBt
aXRpZ2F0aW9ucw0KPiANCj4gDQo+IA0KPiBPbiA4LzEwLzIzIDAwOjM3LCBFdmFuIFF1YW4gd3Jv
dGU6DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dA0KPiA+IGluZGV4IGExNDU3OTk1ZmQ0MS4uMjFmNzNhMGJiZDBiIDEwMDY0NA0K
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQNCj4gPiBAQCAtNzE1MiwzICs3MTUyLDEyIEBADQo+ID4gIAkJCQl4bW9uIGNvbW1hbmRzLg0K
PiA+ICAJCQlvZmYJeG1vbiBpcyBkaXNhYmxlZC4NCj4gPg0KPiA+ICsJd2JyZj0JCVtLTkxdDQo+
ID4gKwkJCUZvcm1hdDogeyBvbiB8IGF1dG8gfCBvZmYgfQ0KPiA+ICsJCQlDb250cm9scyBpZiBX
QlJGIGZlYXR1cmVzIHNob3VsZCBiZSBlbmFibGVkIG9yDQo+IGRpc2FibGVkDQo+ID4gKwkJCWZv
cmNlbHkuIERlZmF1bHQgaXMgYXV0by4NCj4gDQo+ICJmb3JjZWx5IiBpcyBub3QgYSB3b3JkLiAi
Zm9yY2VkbHkiIGlzIGEgd29yZCwgYnV0IGl0J3Mgbm90IHVzZWQgdmVyeSBtdWNoIEFGQUlLLg0K
PiBJIHdvdWxkIHByb2JhYmx5IHdyaXRlICJDb250cm9scyBpZiBXQlJGIGZlYXR1cmVzIHNob3Vs
ZCBiZSBmb3JjZWQgb24gb3Igb2ZmLiINClllYWgsIHRoYXQgc291bmRzIGJldHRlci4gV2lsbCB1
cGRhdGUgdGhpcyBhcyBzdWdnZXN0ZWQuDQoNCkV2YW4NCj4gDQo+ID4gKwkJCW9uCUZvcmNlIGVu
YWJsZSB0aGUgV0JSRiBmZWF0dXJlcy4NCj4gPiArCQkJYXV0bwlVcCB0byB0aGUgc3lzdGVtIHRv
IGRvIHByb3BlciBjaGVja3MgdG8NCj4gPiArCQkJCWRldGVybWluZSB0aGUgV0JSRiBmZWF0dXJl
cyBzaG91bGQgYmUNCj4gZW5hYmxlZA0KPiA+ICsJCQkJb3Igbm90Lg0KPiA+ICsJCQlvZmYJRm9y
Y2UgZGlzYWJsZSB0aGUgV0JSRiBmZWF0dXJlcy4NCj4gDQo+IC0tDQo+IH5SYW5keQ0K
