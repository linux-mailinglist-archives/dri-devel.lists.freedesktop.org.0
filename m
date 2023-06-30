Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6547439B1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4182F10E3E7;
	Fri, 30 Jun 2023 10:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5710E3E7;
 Fri, 30 Jun 2023 10:37:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqYNkoi4osYxolQIlo1qI1lo/t4sXUoqsatrBuy6YJCklE8cuQ35luMmnqTa9Kw/imK2SBDcGmMbapt7L9u+L7XJZYnSYghwobzqBkZunu/CWXdfKtl1LiCSag8kbwUSFRUqyyFFacZAfq43qE8A9E1P7D37uAYC7ukxBoCB/dTWzg9XIoTGgNmi/mwoBbNVEfWGn/wQzK1kCUar8OYagZTaYZQ5fAp2cDqQjZrHXGMXusmRUf+AKjyy7UYDYHDRbj16NQM+MLQJWPehMKegGJkxLtg8UtnTrRBFoxsy3gpXpY2MhuUmYcw4OJ7bdrwbp902cNnpeCeqq4YOmR2GIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj6rqzIhz/51HBoERp6I81a47vHM1IZ0OmK7e4ZADDU=;
 b=Co0R0YNBZQs9MJIYYXs/O8/2vS0LXxJ8b3M6RSNm1B0A5791Nbc0y13KaxzX8SQHsk6MUhYwjY+YWVfY/Wqidk1rgPVm4+KyZQNVgyDPSk9SaMxrzDcaF7KNYhWgFP9xO7m4JLQuFLhNbPeJf33MjK24A90qPMjGy06KOmwfsPftuJyJ5qmGsjPZdkPJn4OAU2V3Rtfv3WDvXrTJpT+JFLKJJp1kA67vhDd4BS0YFIAfJcjrlJwwzPSOlL+uSvf2uGNBcJ1oNSlHEgKXpPHY0hSLxk5kQo0R4GJ3IsLujSI3QhsFu9wC98NY18kOg1Njh7G8j2pkl86ZqVGhDh1UxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj6rqzIhz/51HBoERp6I81a47vHM1IZ0OmK7e4ZADDU=;
 b=CSgKO19/7eWfbN3ARdJ3Y87Q5TwlddKO9BDE40g4tN+16BsyClur9l45YzUl4PVznrrsSklWvNZ690r/t21fAkygPJlTM4+ttz/E6ZcBmqzDmN+xzoEgkIR09B2nJl+N22ID88GVZcIDZpxk5CpBYA1L0XPe8pwOw3ixDyDdoYw=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BL1PR12MB5271.namprd12.prod.outlook.com (2603:10b6:208:315::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Fri, 30 Jun 2023 10:37:20 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 10:37:20 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>
Subject: RE: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZpAPjWdLlvdpGAkOB7tNPmCRgza+YfMGAgAASFACAAAh+gIAABbiAgAAHrICACpA64A==
Date: Fri, 30 Jun 2023 10:37:20 +0000
Message-ID: <DM6PR12MB2619446782F82D9990773F6CE42AA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
 <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
 <CAJZ5v0gnTt0pV4nF+jcYCyZuZXDNuRn3mS0bDoAv-ZDpetyxVg@mail.gmail.com>
 <5d6f6a89-1c7f-3763-8616-b80fdc301603@amd.com>
 <CAJZ5v0iwPqD5PhQ8OcXO_xncFwH824h=U7W50pyPMBqtPSpP=g@mail.gmail.com>
In-Reply-To: <CAJZ5v0iwPqD5PhQ8OcXO_xncFwH824h=U7W50pyPMBqtPSpP=g@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c79f7615-d89f-430a-a1ba-54a07e51f052;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-30T10:34:45Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|BL1PR12MB5271:EE_
x-ms-office365-filtering-correlation-id: 0bf9daac-21bb-4d09-343c-08db7955fb7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxOiEfQR6OnHLheJmRqypBqcOFbP7pdjcbozungCC8C5W8E2s+dTtX9WApKn07cOQf46KHvAwds5whhzCpCZ2n561yB4/8i+imu8LQedNiPcpZysfOV1E0KhBBC52qUzxGQH9FmNqA4dssHuxAY5L1MiMz8sQAOs4WwlFVxGuQCk1b7JR/jOKJeIjNQtz79FiL50Sd+ynHYg8C2lFsVocEpfdjbG3ouJdQjohQAU6eqsfgvl+PI0zUhhfLYFpP6ThphJ2VRdJydATmKkKfQruno28zjGh3BG+kY0iv0fnUV3cxceWeFwFrcLMF/kKHE3RUdQJINfn3wZEVdMtAhTt3zazWTdDY6G4msr7DkpymX+9TaDPmzXaooojTUZNLPzTEqBc98VW5ekZL4B9NhFaJBLWuKReWlOhwnsCAaS3ZAEpprsZo+QQ3YQmqpDtOCZrvvcW/cIGNH9k9KLGAVAaqGIbqTk9Ryx0X4PNI88XTT+Nxhgv3NzcpmsWtCv1LcQL1sJvo163g7Mb5vJRXVKY5sNMqmgB580mtxV89tbBZgh+4qdDh+VaotdfCflKTeZODgN1r73ajG/jX0baKhCimNc1GqAVdw1jmTo4qg6ZU0M4d0LLGCichDbKPadRvzz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52536014)(86362001)(54906003)(71200400001)(8936002)(8676002)(5660300002)(110136005)(7416002)(26005)(9686003)(6506007)(53546011)(33656002)(7696005)(478600001)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(41300700001)(76116006)(316002)(186003)(38070700005)(2906002)(83380400001)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlJWMnlPdEd6ZkVZTmE1M2FSMDdxK0QybmFqVUdQN1ZmNzZSL1dUS1ROcUp6?=
 =?utf-8?B?cjBRRkpJSkFpUkg0WDdOc1FGMkpqYU5OTUNpenNsMzhMOUpBRDd1TG1lVEp0?=
 =?utf-8?B?U09CY05oVW9DN0hNU1g1YnI3NzgvMGdkNDQ3UEpxemZtdzNzcElTSDUvZmxB?=
 =?utf-8?B?dXpId29xdFlMVGlWVVhZTE9IekxXT2xvemlKWEExMit3dlBwU1N1MTZ2U2RX?=
 =?utf-8?B?aGpjd1dmQjNUMVEzTkhHY0tCa2pTWS9qRXJwTnQzMEd0V2N0d1I2bHNZSlFL?=
 =?utf-8?B?QTQ4anFoQ1dYTGsvQTFsT01XMndaNGVBTVR1V1U3dTNCZFg5UzNTT1dTWFJF?=
 =?utf-8?B?K2o1NS9ITk4zOFFYSVZsWWtPZ3gxdlFDWHpPYWEwZ1g4elJSY0lOVDBFLzdW?=
 =?utf-8?B?WHlWb3R2Tk4vUWZsb2VuWG4rS0xyWXRWaTNodVUraythbnovK0liM00zcGFM?=
 =?utf-8?B?SlR4RFo1OGZ5clNmR1ZxbUF1Q0NRSTlKcC8wcG5vMDIyRG80MGhQclk2MEUr?=
 =?utf-8?B?RkVTTUlwUFBZaFNHbGR3RG80TFhDSGh4bGx1SGpQaXRRV2o0Sjlwa29meUJs?=
 =?utf-8?B?Sm9kcTYwcThCVmVXWHpBeTdXb3FiVnl5MjJkMTZwRHhML1ZlZ1dLK0owcHo4?=
 =?utf-8?B?OUpVTHNFRWRTVVhRcHhlK3llQ3RhRm5hWFc3NXZFZ3hxaTZBZWFGKzJObmxm?=
 =?utf-8?B?SWZZQkYrQjZOdGNaY1hzMlBwUDQwWnBuN1NUSHF6UzlLMHZhUUpoZDRObk5I?=
 =?utf-8?B?MzBYVlloNjlBbVNyTXBEQWk5Y0YvbEx3NjZmdWlRM2RraGpOYnlDbG1ONS92?=
 =?utf-8?B?d2VRR1VPV1lOdWk4TWdKQ281Rkg3cGlleEN2ODNHUitPaTR4b011TU9zSGhL?=
 =?utf-8?B?elZHVHlhdFNsNmN3TndBR0gxdjhoeWJLMld2NStsNG1CNEtpUjdOb2NNL3dL?=
 =?utf-8?B?SUE3bWk2WkdVODJrZnBST0ZsZC83WHY4eGRzNkJGVExlb2hIYWNNVjRERndj?=
 =?utf-8?B?QUQ1cFdEZ2NmQjdKVkFkREFMdnpsZ0VoL1V1a1J4QjVEWnNsbm43alEzMkhM?=
 =?utf-8?B?T2lZMUl0bDU0K3JKVXJuWHlFMjM5bm9TYnNnTlE3QnE2NEZlalh4SVYveDVX?=
 =?utf-8?B?MEZpcjU2NTNMeW54UXY1U0Rna0tTUHkwNGVoT0ZkQysvTHJuczRWZkZaN3p3?=
 =?utf-8?B?ZDJmeHNUNW9aTlJrZE92Rm56SisxWHQzMHltVDJtYzhPYXBHKzUySE81d0ti?=
 =?utf-8?B?dFAxZ0ViMHIzQXc2YXlRMEFxRFRBT1BHbnRHQU5QNDFWZVE1dFkxTkNTaTgw?=
 =?utf-8?B?N1RHVHRQM1EzT1RVQXpRSDFlVmhidEdURHVTOThkV1VRL3ZQc1YwbXRhc0dk?=
 =?utf-8?B?UVJJUUxaQnVRRE1wcTlKdkp4OTN1OWxjZEwrckI5ZGprMy9RSmhYdUVGOXVX?=
 =?utf-8?B?cWlrVXdtSGsxNitDUlRUWE5KTTVQczUrR0VOWmhYZG00UEhTelBpUUpadC9E?=
 =?utf-8?B?TW4rTzM0TmN0Qkc1WW9ETHBUN3FDTXFPKzlWUmdUMW91bjB2UThjS1BoOVFh?=
 =?utf-8?B?NUh1OEgwZmNtUE9TVU1iWWVnOHZDS3p0ZTRRaUQ1SjhFZlRRNW5hT3lhaWhJ?=
 =?utf-8?B?Z1QxamtUMDJ6VGJ0R2JrYnY3SllJbHFUWUZyUldqS1hOOWdVNk9rUmhLSkRn?=
 =?utf-8?B?NzFVM05mQW93b24wYkR4aUZIT3N4RFZ0Z2hkdHhhR3pjNklsYjVwWS9rejd2?=
 =?utf-8?B?Zi83eW9xelV3czJZREhSYjdyYWJ6VW1UNjJnTzVFd1IxVE1UenhNN2lFQlZu?=
 =?utf-8?B?Q005dUtVQkR0QnJOMFdIdlVxYkRyYWVHWWxMS0xKdThOeHFScnJzMEdCOHg3?=
 =?utf-8?B?bFY0WTdEOFpDZzZGbytJUmg1cmZtSmhWdmxDbFFwWThlSklXRFRoQmY1cTRD?=
 =?utf-8?B?SmJyOGhxU3RjcWJQRGFFSmFkeU5qZlQyQ0dlOVhhd3ZaOHBrZlp5TXRwWHNB?=
 =?utf-8?B?S1FyUkFXWm53a1VtTm5WejhQd1F1Z1g4SkErbjBHMTh0a2hFYlNSVmtTakkr?=
 =?utf-8?B?VUhvS24xYlJONFR0OFhSUEdjcWV1KzAyYitXczZQcHNvV3cwUGZCSlRNUzBt?=
 =?utf-8?Q?DNZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf9daac-21bb-4d09-343c-08db7955fb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 10:37:20.1434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBWsunaUZcB+Ep2QpG/FJXJGLz90+S6YFBLSJ42HmGaT4ORSxNrWxD8Z76VwXED1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5271
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "trix@redhat.com" <trix@redhat.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIFJhZmFlbCAmIEFuZHJldywN
Cg0KSSBqdXN0IHBvc3RlZCBhIG5ldyBWNSBzZXJpZXMgYmFzZWQgb24gdGhlIGRpc2N1c3Npb25z
IGhlcmUgYW5kIG9mZmxpbmUgZGlzY3Vzc2lvbnMgd2l0aCBNYXJpby4NClBsZWFzZSBzaGFyZSB5
b3VyIGNvbW1lbnRzL2luc2lnaHRzIHRoZXJlLg0KDQpUaGFua3MsDQpFdmFuDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2Vy
bmVsLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjQsIDIwMjMgMToxNiBBTQ0KPiBUbzog
TGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0BhbWQuY29tPg0KPiBDYzogUmFm
YWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPjsgUXVhbiwgRXZhbg0KPiA8RXZhbi5R
dWFuQGFtZC5jb20+OyBsZW5iQGtlcm5lbC5vcmc7IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsNCj4gYWly
bGllZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaDsgam9oYW5uZXNAc2lwc29sdXRpb25zLm5l
dDsNCj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJu
ZWwub3JnOw0KPiBwYWJlbmlAcmVkaGF0LmNvbTsgbWRhZW56ZXJAcmVkaGF0LmNvbTsNCj4gbWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOyB0emltbWVybWFubkBzdXNlLmRlOw0KPiBo
ZGVnb2VkZUByZWRoYXQuY29tOyBqaW5neXV3YW5nX3ZpcEAxNjMuY29tOyBMYXphciwgTGlqbw0K
PiA8TGlqby5MYXphckBhbWQuY29tPjsgamltLmNyb21pZUBnbWFpbC5jb207IGJlbGxvc2lsaWNp
b0BnbWFpbC5jb207DQo+IGFuZHJlYWxtZWlkQGlnYWxpYS5jb207IHRyaXhAcmVkaGF0LmNvbTsg
anNnQGpzZy5pZC5hdTsgYXJuZEBhcm5kYi5kZTsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtDQo+IHdp
cmVsZXNzQHZnZXIua2VybmVsLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIFY0IDEvOF0gZHJpdmVycy9hY3BpOiBBZGQgc3VwcG9ydCBmb3IgV2lmaSBi
YW5kIFJGDQo+IG1pdGlnYXRpb25zDQo+DQo+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDY6NDji
gK9QTSBMaW1vbmNpZWxsbywgTWFyaW8NCj4gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+IHdy
b3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA2LzIzLzIwMjMgMTE6MjggQU0sIFJhZmFlbCBKLiBXeXNv
Y2tpIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNTo1N+KAr1BNIExpbW9u
Y2llbGxvLCBNYXJpbw0KPiA+ID4gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+IHdyb3RlOg0K
PiA+ID4+DQo+ID4gPj4gT24gNi8yMy8yMDIzIDk6NTIgQU0sIFJhZmFlbCBKLiBXeXNvY2tpIHdy
b3RlOg0KPiA+ID4+PiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCA3OjQ34oCvQU0gRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4gPj4+PiBGcm9tOiBNYXJpbyBMaW1v
bmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBE
dWUgdG8gZWxlY3RyaWNhbCBhbmQgbWVjaGFuaWNhbCBjb25zdHJhaW50cyBpbiBjZXJ0YWluIHBs
YXRmb3JtDQo+ID4gPj4+PiBkZXNpZ25zIHRoZXJlIG1heSBiZSBsaWtlbHkgaW50ZXJmZXJlbmNl
IG9mIHJlbGF0aXZlbHkNCj4gPiA+Pj4+IGhpZ2gtcG93ZXJlZCBoYXJtb25pY3Mgb2YgdGhlIChH
LSlERFIgbWVtb3J5IGNsb2NrcyB3aXRoIGxvY2FsDQo+ID4gPj4+PiByYWRpbyBtb2R1bGUgZnJl
cXVlbmN5IGJhbmRzIHVzZWQgYnkgV2lmaSA2LzZlLzcuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gVG8g
bWl0aWdhdGUgdGhpcywgQU1EIGhhcyBpbnRyb2R1Y2VkIGFuIEFDUEkgYmFzZWQgbWVjaGFuaXNt
IHRoYXQNCj4gPiA+Pj4+IGRldmljZXMgY2FuIHVzZSB0byBub3RpZnkgYWN0aXZlIHVzZSBvZiBw
YXJ0aWN1bGFyIGZyZXF1ZW5jaWVzIHNvDQo+ID4gPj4+PiB0aGF0IGRldmljZXMgY2FuIG1ha2Ug
cmVsYXRpdmUgaW50ZXJuYWwgYWRqdXN0bWVudHMgYXMgbmVjZXNzYXJ5DQo+ID4gPj4+PiB0byBh
dm9pZCB0aGlzIHJlc29uYW5jZS4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBJbiBvcmRlciBmb3IgYSBk
ZXZpY2UgdG8gc3VwcG9ydCB0aGlzLCB0aGUgZXhwZWN0ZWQgZmxvdyBmb3INCj4gPiA+Pj4+IGRl
dmljZSBkcml2ZXIgb3Igc3Vic3lzdGVtczoNCj4gPiA+Pj4+DQo+ID4gPj4+PiBEcml2ZXJzL3N1
YnN5c3RlbXMgY29udHJpYnV0aW5nIGZyZXF1ZW5jaWVzOg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IDEp
IER1cmluZyBwcm9iZSwgY2hlY2sgYHdicmZfc3VwcG9ydGVkX3Byb2R1Y2VyYCB0byBzZWUgaWYg
V0JSRg0KPiA+ID4+Pj4gc3VwcG9ydGVkDQo+ID4gPj4+IFRoZSBwcmVmaXggc2hvdWxkIGJlIGFj
cGlfd2JyZl8gb3IgYWNwaV9hbWRfd2JyZl8gZXZlbiwgc28gaXQgaXMNCj4gPiA+Pj4gY2xlYXIg
dGhhdCB0aGlzIHVzZXMgQUNQSSBhbmQgaXMgQU1ELXNwZWNpZmljLg0KPiA+ID4+IEkgZ3Vlc3Mg
aWYgd2UgZW5kIHVwIHdpdGggYW4gaW50ZXJtZWRpYXJ5IGxpYnJhcnkgYXBwcm9hY2gNCj4gPiA+
PiB3YnJmX3N1cHBvcnRlZF9wcm9kdWNlciBtYWtlcyBzZW5zZSBhbmQgdGhhdCBjb3VsZCBjYWxs
IGFjcGlfd2JyZl8qLg0KPiA+ID4+DQo+ID4gPj4gQnV0IHdpdGggbm8gaW50ZXJtZWRpYXRlIGxp
YnJhcnkgeW91ciBzdWdnZXN0aW9uIG1ha2VzIHNlbnNlLg0KPiA+ID4+DQo+ID4gPj4gSSB3b3Vs
ZCBwcmVmZXIgbm90IHRvIG1ha2UgaXQgYWNwaV9hbWQgYXMgdGhlcmUgaXMgbm8gcmVhc29uIHRo
YXQNCj4gPiA+PiB0aGlzIGV4YWN0IHNhbWUgcHJvYmxlbSBjb3VsZG4ndCBoYXBwZW4gb24gYW4g
V2lmaSA2ZSArIEludGVsIFNPQyArDQo+ID4gPj4gQU1EIGRHUFUgZGVzaWduIHRvbyBhbmQgT0VN
cyBjb3VsZCB1c2UgdGhlIHNhbWUgbWl0aWdhdGlvbg0KPiA+ID4+IG1lY2hhbmlzbSBhcyBXaWZp
NmUgKyBBTUQgU09DICsgQU1EIGRHUFUgdG9vLg0KPiA+ID4gVGhlIG1pdGlnYXRpb24gbWVjaGFu
aXNtIG1pZ2h0IGJlIHRoZSBzYW1lLCBidXQgdGhlIEFNTCBpbnRlcmZhY2UNCj4gPiA+IHZlcnkg
d2VsbCBtYXkgYmUgZGlmZmVyZW50Lg0KPiA+DQo+ID4NCj4gPiBSaWdodC4gIEkgc3VwcG9zZSBy
aWdodCBub3cgd2Ugc2hvdWxkIGtlZXAgaXQgcHJlZml4ZWQgYXMgImFtZCIsIGFuZA0KPiA+IGlm
IGl0IGxhdGVyIGlzIHByb21vdGVkIGFzIGEgc3RhbmRhcmQgaXQgY2FuIGJlIHJlbmFtZWQuDQo+
ID4NCj4gPg0KPiA+ID4NCj4gPiA+IE15IHBvaW50IGlzIHRoYXQgdGhpcyBwYXJ0aWN1bGFyIGlu
dGVyZmFjZSBpcyBBTUQtc3BlY2lmaWMgQVRNIGFuZA0KPiA+ID4gSSdtIG5vdCBhd2FyZSBvZiBh
bnkgcGxhbnMgdG8gbWFrZSBpdCAic3RhbmRhcmQiIGluIHNvbWUgd2F5Lg0KPiA+DQo+ID4NCj4g
PiBZZWFoOyB0aGlzIGltcGxlbWVudGF0aW9uIGlzIGN1cnJlbnRseSBBTUQgc3BlY2lmaWMgQU1M
LCBidXQgSSBleHBlY3QNCj4gPiB0aGUgZXhhY3Qgc2FtZSBBTUwgd291bGQgYmUgZGVsaXZlcmVk
IHRvIE9FTXMgdXNpbmcgdGhlIGRHUFVzLg0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBBbHNvIGlm
IHRoZSBnaXZlbiBpbnRlcmZhY2UgaXMgc3BlY2lmaWVkIHNvbWV3aGVyZSwgaXQgd291bGQgYmUg
Z29vZA0KPiA+ID4gdG8gaGF2ZSBhIHBvaW50ZXIgdG8gdGhhdCBwbGFjZS4NCj4gPg0KPiA+DQo+
ID4gSXQncyBhIGNvZGUgZmlyc3QgaW1wbGVtZW50YXRpb24uICBJJ20gZGlzY3Vzc2luZyB3aXRo
IHRoZSBvd25lcnMgd2hlbg0KPiA+IHRoZXkgd2lsbCByZWxlYXNlIGl0Lg0KPiA+DQo+ID4NCj4g
PiA+DQo+ID4gPj4+IFdoZXRoZXIgb3Igbm90IHRoZXJlIG5lZWRzIHRvIGJlIGFuIGludGVybWVk
aWF0ZSBsaWJyYXJ5IHdyYXBwZWQNCj4gPiA+Pj4gYXJvdW5kIHRoaXMgaXMgYSBkaWZmZXJlbnQg
bWF0dGVyLg0KPiA+ID4gSU1PIGluZGl2aWR1YWwgZHJpdmVycyBzaG91bGQgbm90IGJlIGV4cGVj
dGVkIHRvIHVzZSB0aGlzIGludGVyZmFjZQ0KPiA+ID4gZGlyZWN0bHksIGFzIHRoYXQgd291bGQg
YWRkIHRvIGJvaWxlcnBsYXRlIGNvZGUgYW5kIG92ZXJhbGwgYmxvYXQuDQo+ID4NCj4gPiBUaGUg
dGhpbmcgaXMgdGhlIEFDUEkgbWV0aG9kIGlzIG5vdCBhIHBsYXRmb3JtIG1ldGhvZC4gIEl0J3Mg
YQ0KPiA+IGZ1bmN0aW9uIG9mIHRoZSBkZXZpY2UgKF9EU00pLg0KPg0KPiBfRFNNIGlzIGFuIGlu
dGVyZmFjZSB0byB0aGUgcGxhdGZvcm0gbGlrZSBhbnkgb3RoZXIgQU1MLCBzbyBJJ20gbm90IHJl
YWxseSBzdXJlDQo+IHdoYXQgeW91IG1lYW4uDQo+DQo+ID4gVGhlIHJlYXNvbiBmb3IgaGF2aW5n
IGFjcGlfd2JyZi5jIGluIHRoZSBmaXJzdCBwbGFjZSBpcyB0byBhdm9pZCB0aGUNCj4gPiBib2ls
ZXJwbGF0ZSBvZiB0aGUgX0RTTSBpbXBsZW1lbnRhdGlvbiBhY3Jvc3MgbXVsdGlwbGUgZHJpdmVy
cy4NCj4NCj4gQWJzb2x1dGVseSwgZHJpdmVycyBzaG91bGQgbm90IGJlIGJvdGhlcmVkIHdpdGgg
aGF2aW5nIHRvIHVzZSBfRFNNIGluIGFueQ0KPiBjYXNlLiAgSG93ZXZlciwgdGhleSBtYXkgbm90
IGV2ZW4gcmVhbGl6ZSB0aGF0IHRoZXkgYXJlIHJ1bm5pbmcgb24gYSBzeXN0ZW0NCj4gdXNpbmcg
QUNQSSBhbmQgSSdtIG5vdCBzdXJlIGlmIHRoZXkgcmVhbGx5IHNob3VsZCBjYXJlLg0KPg0KPiA+
ID4NCj4gPiA+IEFsc28gd2hvZXZlciB1c2VzIGl0LCB3b3VsZCBmaXJzdCBuZWVkIHRvIGNoZWNr
IGlmIHRoZSBkZXZpY2UgaW4NCj4gPiA+IHF1ZXN0aW9uIGhhcyBhbiBBQ1BJIGNvbXBhbmlvbi4N
Cj4gPg0KPiA+DQo+ID4gV2hpY2ggY29tZXMgYmFjayB0byBBbmRyZXcncyBwb2ludC4NCj4gPiBF
aXRoZXIgd2U6DQo+ID4NCj4gPiBIYXZlIGEgZ2VuZXJpYyB3YnJmXyBoZWxwZXIgdGhhdCB0YWtl
cyBzdHJ1Y3QgKmRldmljZSBhbmQgaW50ZXJuYWxseQ0KPiA+IGNoZWNrcyBpZiB0aGVyZSBpcyBh
biBBQ1BJIGNvbXBhbmlvbiBhbmQgc3VwcG9ydC4NCj4gPg0KPiA+IG9yDQo+ID4NCj4gPiBEbyB0
aGUgY2hlY2sgZm9yIHN1cHBvcnQgaW4gbWFjODAyMTEgKyBhcHBsaWNhYmxlIGRyaXZlcnMgYW5k
IG9ubHkNCj4gPiBjYWxsIHRoZSBBTUQgV0JSRiBBQ1BJIG1ldGhvZCBpbiB0aG9zZSBkcml2ZXJz
IGluIHRob3NlIGNhc2VzLg0KPg0KPiBFaXRoZXIgb2YgdGhlIGFib3ZlIGhhcyBwcm9ibGVtcyBJ
TU8uDQo+DQo+IFRoZSBwcm9ibGVtIHdpdGggdGhlIHdicmZfIGhlbHBlciBhcHByb2FjaCBpcyB0
aGF0IGl0IGFkZHMNCj4gKHBvdGVudGlhbGx5KSBzZXZlcmFsIHBpZWNlcyBvZiBpbnRlcmFjdGlv
biB3aXRoIHRoZSBwbGF0Zm9ybSwgcG90ZW50aWFsbHkgZm9yDQo+IGV2ZXJ5IGRyaXZlciwgaW4g
cGxhY2VzIHdoZXJlIGRyaXZlcnMgZG9uJ3QgZG8gc3VjaCB0aGluZ3MgYXMgYSBydWxlLg0KPg0K
PiBUaGUgcHJvYmxlbSB3aXRoIHRoZSBvdGhlciBhcHByb2FjaCBpcyB0aGF0IHRoZSBkcml2ZXJz
IGluIHF1ZXN0aW9uIG5vdyBuZWVkDQo+IHRvIGJlIGF3YXJlIG9mIEFDUEkgaW4gZ2VuZXJhbCBh
bmQgdGhlIEFNRCBXQlJGIGludGVyZmFjZSBpbiBwYXJ0aWN1bGFyIGFuZCBpZg0KPiBvdGhlciBz
aW1pbGFyIGludGVyZmFjZXMgYXJlIGFkZGVkIGJ5IG90aGVyIHZlbmRvcnMsIHRoZXkgd2lsbCBo
YXZlIHRvIGxlYXJuDQo+IGFib3V0IHRob3NlIGFzIHdlbGwuDQo+DQo+IEkgdGhpbmsgdGhhdCB3
ZSBuZWVkIHRvIHN0YXJ0IG92ZXIgd2l0aCBhIGdlbmVyYWwgcHJvYmxlbSBzdGF0ZW1lbnQgdGhh
dCBpbg0KPiBzb21lIGNhc2VzIHRoZSBwbGF0Zm9ybSBuZWVkcyB0byBiZSBjb25zdWx0ZWQgcmVn
YXJkaW5nIHJhZGlvIGZyZXF1ZW5jaWVzDQo+IHRoYXQgZHJpdmVycyB3b3VsZCBsaWtlIHRvIHVz
ZSwgYmVjYXVzZSBpdCBtYXkgbmVlZCB0byBhZGp1c3Qgb3Igc2ltcGx5IHNheQ0KPiB3aGljaCBy
YW5nZXMgYXJlICJub2lzeSIgKG9yIGV2ZW4gY29tcGxldGVseSB1bnVzYWJsZSBmb3IgdGhhdCBt
YXR0ZXIpLiAgVGhhdA0KPiBzaG91bGQgYWxsb3cgdXMgdG8gZmlndXJlIG91dCBob3cgdGhlIGlu
dGVyZmFjZSBzaG91bGQgbG9vayBsaWtlIGZyb20gdGhlIGRyaXZlcg0KPiBzaWRlIGFuZCBpdCBz
aG91bGQgYmUgcG9zc2libGUgdG8gaG9vayB1cCB0aGUgZXhpc3RpbmcgcGxhdGZvcm0gaW50ZXJm
YWNlIHRvDQo+IHRoYXQuDQo=
