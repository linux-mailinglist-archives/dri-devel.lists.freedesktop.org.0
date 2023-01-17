Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB766E380
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8809C10E585;
	Tue, 17 Jan 2023 16:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4F10E1AC;
 Tue, 17 Jan 2023 16:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sglvz2G/7N3QbI0DBW5lYv57+rxN3R0dOJU1RAApRZyJ+f8aC8QTGWJ0Jy3ONbQoHsTPbaGfQC6Qx/9IvjB79oNz4jzGKg9vdfAiNpvhapzHK2ZHjNt3Zha5WmZJiLOdKjOAtxfGkKA3RbA2zgKL3VkZ3ZgRUkq85rKc2vt2sJsSs0xL9k9qvAL/ROwkGc3x1Jytuj6xez3UT7W+3gnkMlI4YdZShC0O6mPuVBTw717KZRz2k/J+EwwNCjiOj3Ss6Th5axz7UJkVx89beYa1d/mZEhFw9t/I4zjsvUBHrcC6ganAoQrP+AvfzyQO2JmUXnNlwc5lr+9qsNqzyi3ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy7img0w7T8F4gfFW20jMPvhIVsUC6SQmRIC80ADCJ0=;
 b=fwWMYSh8ZeVINyeQc1ebSFAmgDTWnWCDPUzjrRWRcfBvVR3tdlPwP1J1hbzo96sS714AgpK0xYsx5eIXoqGfsK9mVCqBGRk5idwtM+Igbu7tQBdZuwy8Wbx1KDfuD1k5vo/yyAEzYCb4XFQ92p3XLfhV7dHpZaeq+INvJPGNK2KRU5HCIzqRYvqIeVcWhv90kvdngT7OpX13dJXYbGCjvtwKJ8qXX7a4horgDFgpnQpSVjWLrFWomzWGNG/2uFPHp5wvPFrg7N8rI2Gb6GSrtjY68tGpTbATsNqbnWjSpEYJ1vRGvBoFohG8HevQcv0i4V0HWLgLVc+EVnP2UnyYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy7img0w7T8F4gfFW20jMPvhIVsUC6SQmRIC80ADCJ0=;
 b=IZ+HoHMTQiO40KJ3+8yJZUajF+gV9WjHaJDPpx7hoW47BeRR1eHoW2JzItlj2TAYk5bKg+gxIHLcXtFUQ4bSuTJR787EL7VIGxpEQeKsZgMdF6dTRA1I8QYNJZp5Sn8mYx8KyrohWCM6J/xFZtjOHv7I4ojJ5qVEnFQxHMq2V5o=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY1PR12MB8447.namprd12.prod.outlook.com (2603:10b6:a03:525::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 16:24:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 16:24:13 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
Subject: RE: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Thread-Topic: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force
 (en/dis)abling indirect SRAM mode
Thread-Index: AQHZKfBs/z2FgdQ6GE6+LZfSEG7G0K6hlSyAgAAKg4CAAAHIgIAABzYAgAAeDYCAAB15AIAAyTYAgAAKlwCAABMuEA==
Date: Tue, 17 Jan 2023 16:24:13 +0000
Message-ID: <MN0PR12MB6101E722B07AC8C46BC3D22CE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
 <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
 <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
 <16d17ee0-bda7-af95-b148-df5ce649336f@igalia.com>
 <CADnq5_OzgMy3s_w4Aa-+51PqJHG+iBeaHYu2gv2t3J-5tExGmw@mail.gmail.com>
In-Reply-To: <CADnq5_OzgMy3s_w4Aa-+51PqJHG+iBeaHYu2gv2t3J-5tExGmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-17T16:24:13Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=db56384c-082b-4777-b63f-85b0b64838f7;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-17T16:24:13Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 45deffb1-a2f2-4dc9-bddf-1547ffc4f20b
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|BY1PR12MB8447:EE_
x-ms-office365-filtering-correlation-id: a7c05c46-e4f1-41ae-7808-08daf8a7453c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xRkK+GDVxmu7pOTVnr1V8yMcql5iksoxfFB1158uxQcpz3rN+sZ2DKy7iBpZVu/uNLgf9wr/vYttpRTNCHxphtSgukyBhLtmxo7E4Y+nOuxSGwenrkKCwXygPVOszNgLZRIzBhMzE2ZY7sJjxyx9OD/7u8B8UcIdbQHCvyqTUmgmOlUjsJWD9AVCvJFn5NadiYaWFVkBJXJLoot9u2JQBjI0/dGK1ph5PJyanlx7q8quhtsO6cwsnyRXG4WuaaODWLPHVery5B6KO3jU9rv14RsLZPElDeqNlN5VfK8aezdX+1+V55+uUTqJNh8grT8QqZINkPRVSDSzB113XcfgM0hb9/mYUnktVyLLKuIRdf5DwokugufY/tnFqzvm/7YuYblI6doWuSoYuWw+4ajj1UIhNH4/3sBJYV9iAKQE90sNiZTqGD9MGs60zFxxaWUhMdNao0hb5CY/2dng2ZZd0RFfdvcrjg5MgT2boOgf92/EI6wFdA0FiTHaNNGdbl93IHhuSBdDglL0vzTmMxCnwk2/RRN4jOIMAlA7GdngGmWKinoVKIWy93n4yLz9lQR/H6sEDh/2RaAiYY1euPQoUf1k46OuForBsZ8FqERKaLMjdwUgxgJ9zjfOy8SJzd/83WVH/6zQmEpu6LNJPWphCrONZqIBrTkAIpd3sfbZbpdr25g6tcaYHKkjTFSKO19wF/Mu8LxtCrLXcuwxLwCVTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(64756008)(33656002)(66946007)(66446008)(76116006)(66556008)(26005)(9686003)(41300700001)(66476007)(53546011)(186003)(8676002)(4326008)(86362001)(5660300002)(52536014)(55016003)(8936002)(110136005)(54906003)(478600001)(83380400001)(6506007)(316002)(7696005)(38100700002)(71200400001)(38070700005)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3lwNVVEM2RtNHlqZ2JaU2U3VWNXREgzOWZhcTRBd0xWQU4yVEZRM2hpeHAy?=
 =?utf-8?B?UTR2Mm5IdFphd3M1RnJtYjhpeVNrVW4rRjdxdmQwYTVtQnBjOENVczVwVUdO?=
 =?utf-8?B?cFlCT0xnZ0EzVmU5bkM5cU96RmQ4Sk03ZUx3SXZGelptcEEwK3dSbGMyRGhU?=
 =?utf-8?B?K0VXUUlZZU9FUjFmYkF1MGxmd1Rrbk9iVXlUS2U3UVFYdVV2WFBRT1ZjYXFP?=
 =?utf-8?B?T3VEMXd1UkwyTDdENTU3MlZnMkVrTTM0RksvRmYzMDhUb1NQM3d4b3dMMjEw?=
 =?utf-8?B?YzlJNGFQKzJpWEFqVS9kK2ZGdm9DdjM5Nm5CL1VWZ1VuYnRiSnlwYmZybTlq?=
 =?utf-8?B?NUQ5VzhUdWlHbEx0R0tHRDYvU3E3KzlBVEN4N1JLMGkweDZJb0IzZDZJdndN?=
 =?utf-8?B?ZlAwM1U4Z0pzMVlLMEFWVHZtM2lkZ0h1MXg4bSsreGtzVHFFYmJWYUdVNGt1?=
 =?utf-8?B?QjJUT2YwdGdLWHlhTDM4K3NUM3pLdkZiTEV4OVpwdHo1MlFCekpKSmxzMGZ1?=
 =?utf-8?B?RTZJVE1YeFI1K1pMeVVyUzRxZ0wrSjFGZkUwMmZwVmd5OGxnZ1RQTmdsTHZJ?=
 =?utf-8?B?bnNSSkRIN1NmUzdXUjA1ditRcmpuMFhjaDJHSU5RWWNDbGwzaEx6RmxtNGNl?=
 =?utf-8?B?OXJ5SnI2bnJLd1dqeDZyV2NpeVQyRHVvMkNidGdoMXJiL1BrZzBXMFIxQktw?=
 =?utf-8?B?YmJuVTRvbEdtQlFob1lVMXU2RVhieElIYUlHSWxHY0s1cXViTHh3WWd0NmFi?=
 =?utf-8?B?Vy9qV2lucEhla0JqdktVQ01jUkRyS2p5UHB6bWkvc1FXdE9hTXBIalF0RGNj?=
 =?utf-8?B?S3AydGdOUm5yRlhhZ2RpOVV2Sll1OGp5dVFyekY4dlg0Yjc2ZC9HQnpJUmdV?=
 =?utf-8?B?eU5yU3d6cm53M2FUakU0dExoNUJoNmpsRk5zNHRBcmdLUWlhK3plZDVOc01R?=
 =?utf-8?B?ak14NGZRMFYxSEhZQnBKaHErTlRoQlJlSFROVkN2UWJobzFWbFRWZ2J6eklU?=
 =?utf-8?B?bC9KdDB4WS9KK0hNcHMwYURMU3hjb201UG4rWExjcU1aclI3dXFNYkN4TWN3?=
 =?utf-8?B?elFKRmc3VkNoeFlTb2FHRFI0SlN5VFY4bFVLZ2szb0k4UVM1dnp1M0V6L3lW?=
 =?utf-8?B?STZRL3AvOU1ac25sVDRrazJaVDNTZytQNzZrdjhHbUI5ejdmN2tNRVNRQ2h5?=
 =?utf-8?B?Q25NUDZaL0tNUzNLRXJPWjFYYVd4WnZFZllnbHQwSEtXZy9sU0xzK2RLSkVn?=
 =?utf-8?B?MzV1N2lVejh3VzBvaTBWZDZuZXIvRXB3cGs0UDdSaVBGdmdibVUrTHpwL2FC?=
 =?utf-8?B?OS82SkpUaDhXNENuTFNSc216MjNibFEzVUlCMEZFUVNQSGNObTc3Q1dTVlhl?=
 =?utf-8?B?cFVjcXRadkYwUnIyQVBpaXRCbkZHYjhQUUJMbVROUERPSFJ6MGx2c1U4K01Z?=
 =?utf-8?B?d2N1WEs4MFpQd1F5MWxKbkVDbUgvY0szaGtqbnd3dkhUWG4yaHJFUUNwbjRs?=
 =?utf-8?B?T3owZnNCVEJoempxV2FpQkx0NkJ6clQxdWMwYnhFdWxzazI3aWZnWVVJd3hs?=
 =?utf-8?B?TUZodWovMDF0QVBqYkhZcHUxQWNKdXJRQlR1OVF0dG5QS2o4R0xPL2NzT0ly?=
 =?utf-8?B?aGlxSzRkM1ArQ0hxUm5iMW5RaUhBWUpIbnFteG9GZWlzRG43YWdxSFZrOG1q?=
 =?utf-8?B?b0Q2ZmJ0NVE1TkNSMEVLWDkxa2xrcE9aWldpbmRlblB4a1lMU2daZlg0ZmN1?=
 =?utf-8?B?UGZCR2RtdWdmZ1hrQW95QkhEWEMreG84czYrN1FoakhOWU5zK010cStZT3NW?=
 =?utf-8?B?NWZGaFJZWUVJbkRySkNEaFFCK3c5ZE14cWE5c1ZhODRMY0svSkE3a0lUWFBu?=
 =?utf-8?B?QzNMR1VwTTZYNnhDZnRWMXIzTGl4M1g2OU5IZ1FyZjZNRWVDOHZNVDdLYmV0?=
 =?utf-8?B?eU5iVWNsRElnU2NscmV4b3haL01TcjByMU80NjFCa1JINXN6blRobm5hZFE3?=
 =?utf-8?B?NjBMcUtTeThaUDJEbVlNcnpxejJjekhIbnU5NWZCdGNQZVdHeE8rR0EwVm1D?=
 =?utf-8?B?Vmx1Z1ZjQXpLQkZRWERTcjF0YnhxZytDQjBHd05Ld0VGcjNoaFYvdFd5Nmdw?=
 =?utf-8?Q?HMjc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c05c46-e4f1-41ae-7808-08daf8a7453c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 16:24:13.1007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRTkDPZ5CM43inxpiv52scztn/Af0rrtCIC2Jv9wvAK8rz31D9qCRIxp2L311wnDhcManstEsBaQEjl+X15JFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8447
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxl
eCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVh
cnkgMTcsIDIwMjMgMDk6MTENCj4gVG86IEd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBp
Z2FsaWEuY29tPg0KPiBDYzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0Bh
bWQuY29tPjsgTGl1LCBMZW8NCj4gPExlby5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBKaWFuZywgU29ubnkNCj4gPFNvbm55LkppYW5nQGFtZC5jb20+OyBrZXJu
ZWxAZ3BpY2NvbGkubmV0OyBQYW4sIFhpbmh1aQ0KPiA8WGluaHVpLlBhbkBhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGF6YXIsIExpam8NCj4gPExpam8uTGF6YXJA
YW1kLmNvbT47IGtlcm5lbC1kZXZAaWdhbGlhLmNvbTsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+
Ow0KPiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUGllcnJl
LUxvdXAgR3JpZmZhaXMNCj4gPHBncmlmZmFpc0B2YWx2ZXNvZnR3YXJlLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHUvdmNuOiBBZGQgcGFyYW1ldGVyIHRvIGZvcmNl
DQo+IChlbi9kaXMpYWJsaW5nIGluZGlyZWN0IFNSQU0gbW9kZQ0KPiANCj4gT24gVHVlLCBKYW4g
MTcsIDIwMjMgYXQgOTozMyBBTSBHdWlsaGVybWUgRy4gUGljY29saQ0KPiA8Z3BpY2NvbGlAaWdh
bGlhLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiAxNi8wMS8yMDIzIDIzOjMzLCBMaW1vbmNpZWxs
bywgTWFyaW8gd3JvdGU6DQo+ID4gPiBbLi4uXQ0KPiA+ID4NCj4gPiA+IEZvciBkZWJ1Z2dpbmcg
dGhlc2UgdHlwZSBvZiBwcm9ibGVtcywgSSB0aGluayBhbiBlZmZlY3RpdmUgZGVidWdnaW5nDQo+
ID4gPiB0YWN0aWMgd291bGQgaGF2ZSBiZWVuIHRvIG1hc2sgdGhlIElQIGJsb2NrIChhbWRncHUu
aXBfYmxvY2tfbWFzaykuDQo+ID4NCj4gPiBUaGFuayB5b3UsIGl0IHdvcmtlZCBpbmRlZWQgLSBu
aWNlIHN1Z2dlc3Rpb24hDQo+ID4NCj4gPiBUaG91Z2ggSSBzZWUgdHdvIHByb2JsZW1zIHdpdGgg
dGhhdDogZmlyc3QsIEknbSBub3Qgc3VyZSB3aGF0J3MgdGhlDQo+ID4gaW1wYWN0IGluIHRoZSBH
UFUgZnVuY3Rpb25pbmcgd2hlbiBJIGRpc2FibGUgc29tZSBJUCBibG9jay4NCj4gPg0KDQpJdCBk
ZXBlbmRzIG9uIHRoZSBpbmRpdmlkdWFsIGJsb2NrIHdoYXQgdGhlIGltcGFjdCBpcy4gIEZvciBl
eGFtcGxlDQppZiB5b3UgZG9uJ3QgaGF2ZSBWQ04sIHRoZW4geW91IGNhbid0IGRvIGFueSBhY2Nl
bGVyYXRlZCB2aWRlbyBwbGF5YmFjay4NCg0KPiA+IFNlY29uZCwgdGhlIHBhcmFtZXRlciBpcyBh
IGJpdCBoYXJkIHRvIGZpZ3VyZSAtIHdlIG5lZWQgdG8gY2xlYXIgYSBiaXQNCj4gPiBmb3IgdGhl
IElQIGJsb2NrIHdlIHdhbnQgdG8gZGlzYWJsZSwgYW5kIHRoZSBkb2Mgc3VnZ2VzdCB0byByZWFk
IG9uDQo+ID4gZG1lc2cgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gKGl0IHNlZW1zIGl0IGNoYW5n
ZXMgZGVwZW5kaW5nIG9uIHRoZSBIVw0KPiA+IG1vZGVsKSwgYnV0IEkgY291bGRuJ3QgcGFyc2Ug
dGhlIHByb3BlciBiaXQgZnJvbSBkbWVzZy4gTmVlZGVkIHRvDQo+ID4gaW5zdHJ1bWVudCB0aGUg
a2VybmVsIHRvIGZpbmQgdGhlIHByb3BlciBiaXQgaGVoDQo+ID4NCg0KSXNuJ3QgaXQgdGhpcyBz
dHVmZiAodGFrZW4gZnJvbSBhIENaTiBzeXN0ZW0pOg0KDQpbICAgIDcuNzk3Nzc5XSBbZHJtXSBh
ZGQgaXAgYmxvY2sgbnVtYmVyIDAgPHNvYzE1X2NvbW1vbj4NClsgICAgNy43OTc3ODFdIFtkcm1d
IGFkZCBpcCBibG9jayBudW1iZXIgMSA8Z21jX3Y5XzA+DQpbICAgIDcuNzk3NzgyXSBbZHJtXSBh
ZGQgaXAgYmxvY2sgbnVtYmVyIDIgPHZlZ2ExMF9paD4NClsgICAgNy43OTc3ODNdIFtkcm1dIGFk
ZCBpcCBibG9jayBudW1iZXIgMyA8cHNwPg0KWyAgICA3Ljc5Nzc4M10gW2RybV0gYWRkIGlwIGJs
b2NrIG51bWJlciA0IDxzbXU+DQpbICAgIDcuNzk3Nzg0XSBbZHJtXSBhZGQgaXAgYmxvY2sgbnVt
YmVyIDUgPGRtPg0KWyAgICA3Ljc5Nzc4NV0gW2RybV0gYWRkIGlwIGJsb2NrIG51bWJlciA2IDxn
ZnhfdjlfMD4NClsgICAgNy43OTc3ODZdIFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgNyA8c2Rt
YV92NF8wPg0KWyAgICA3Ljc5Nzc4N10gW2RybV0gYWRkIGlwIGJsb2NrIG51bWJlciA4IDx2Y25f
djJfMD4NClsgICAgNy43OTc3ODhdIFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgOSA8anBlZ192
Ml8wPg0KDQpTbyBmb3IgdGhhdCBzeXN0ZW0gaXQgd291bGQgYmUgYml0IDggdG8gZGlzYWJsZSB2
Y24uDQoNCkluIHRlcm1zIG9mIGhvdyBkZWJ1Z2dpbmcgd291bGQgd29yazoNCkkgd291bGQgZXhw
ZWN0IHdoZW4geW91IGdldCB5b3VyIGZhaWx1cmUgaXQgd2lsbCBoYXZlIGJlZW4gdGhlIHByZXZp
b3VzDQpibG9jayAjIHRoYXQgZmFpbGVkLCBhbmQgc28geW91IGNhbiByZWJvb3Qgd2l0aCB0aGF0
IGJsb2NrIG1hc2tlZCBhbmQNCnNlZSBpZiB5b3UgZ2V0IGZ1cnRoZXIuDQoNCj4gPiBUaGUgc2Vj
b25kIHBhcnQgaXMgZWFzeSB0byBpbXByb3ZlICh3ZSBjYW4ganVzdCBzaG93IHRoaXMgYml0IGlu
DQo+ID4gZG1lc2chKSwgSSBtaWdodCBkbyB0aGF0IGluc3RlYWQgb2YgcHJvcG9zaW5nIHRoaXMg
cGFyYW1ldGVyLCB3aGljaA0KPiA+IHNlZW1zIGRpZG4ndCByYWlzZSBtdWNoIGV4Y2l0ZW1lbnQg
YWZ0ZXIgYWxsIGhlaGVoDQo+ID4NCj4gPiBGaW5hbGx5LCBJJ20gc3RpbGwgY3VyaW91cyBvbiB3
aHkgRGVjayB3YXMgd29ya2luZyBmaW5lIHdpdGggdGhlDQo+ID4gaW5kaXJlY3QgU1JBTSBtb2Rl
IGRpc2FibGVkIChieSBtaXN0YWtlKSBpbiBtYW55IGtlcm5lbHMgLSB3YXMgaXQgaW4NCj4gPiBw
cmFjdGljZSB0aGUgc2FtZSBhcyBkaXNhYmxpbmcgdGhlIFZDTiBJUCBibG9jaz8NCj4gDQo+IElJ
UkMsIGl0IGRlcGVuZHMgb24gdGhlIGZ1c2UgcmVjaXBlIGZvciB0aGUgcGFydGljdWxhciBBU0lD
Lg0KPiANCj4gQWxleA0KPiANCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4NCj4gPg0KPiA+IEd1
aWxoZXJtZQ0KPiA+DQo=
