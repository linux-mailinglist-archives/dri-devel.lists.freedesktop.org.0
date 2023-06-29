Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48829742B75
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 19:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8110E3F3;
	Thu, 29 Jun 2023 17:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9110E1BC;
 Thu, 29 Jun 2023 17:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwQZ54H09hyivGwwLd8dftB8eZZr7t7CF80znhODbmZUcTFGkfrEqSJt6zJzr3viIk9BU12RL0SP9O3axkcW7fmCRmvdyKOwYEJ4OkiGmFO//blVu18kblimqpU9PH85opt0DlS/767o1wdp4imDEvRmdmU/XFFJebEUqo6cfQ16wWJF0v7hH8AwoDkSdPUrZMjnzj+b6mTcqzK88X/p1GbWv47TvY2p88t1rrvQwqJqDQBa9UVwdu7bvQqIYobHjt4YBopGTjLsG2NHrNZT5IrFUU+CTDaSCs58p/mZjjNsRnTnUISs3Bu9L3V+qAMt9yOtpIZOYw9d9QAZiWoeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwbT3f6rI4+elbltkfSzpRVB/oWrS4Az9ui0v4WX7Q8=;
 b=hrutYkOC4DnMJU4AXaHe0bp7uY9yUXRrd3s4U0tMeXTNovkJa1AFr+Gj96K5taJ/Z6l7nEM8WM8j8nRMt0FpyaW/eNE6kf3N9yp43820s51R1H5O8/Dq0g5Njyr5Y/3T3tATE5Xxdx5tcdc5ghSWf7Q5bkWWQEBoVxf9jGtxcWMYrplem3tYZG7WcFtCAV8l2PB84h0ZsrtVan4N0NHCpgqN1uhhKLuOQ5mqKDHz95drO5Fkmq4TZXuP6+Z1AMehkikARsZRRaXGzGxEh9F4gmPWHbFaJLC7ot8B+bvwNOA+qcV22eLr+ClwRIf5xpVDFnQGDWN8XGdRZTsNYpagVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwbT3f6rI4+elbltkfSzpRVB/oWrS4Az9ui0v4WX7Q8=;
 b=iuierPbhSjl9lAUy4O7td28H80UoXZMOGQ/NOLTtc6/qlbHnnX4m+l+lDVCiFP8MLeTa/cbxV5n//2nXJk++mEjorYCk5w+N704aX5Gjuw+tK10E/Y4gJfxqvcNB8CR6N8zjgmPLJtyD73zoXE+0R/r25XnM+BLFw9NYRYoA4U4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 17:44:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 17:44:09 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "15330273260@189.cn" <15330273260@189.cn>, Bjorn Helgaas
 <helgaas@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
Subject: RE: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
Thread-Topic: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
Thread-Index: AQHZnaN/L5Yz9nKGVEm+PmUgHWpz36+WU9KAgAu06ACAABJSAIAAC+RQ
Date: Thu, 29 Jun 2023 17:44:09 +0000
Message-ID: <MN0PR12MB6101CDB6FF9DC8F8EDEF5F45E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230629155436.GA397963@bhelgaas>
 <bcfdc77d-a94d-bca1-56e3-5e14e91f6fd9@189.cn>
In-Reply-To: <bcfdc77d-a94d-bca1-56e3-5e14e91f6fd9@189.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=edb14e9f-9323-4323-b357-4ca98e57e83e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-29T17:44:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB7630:EE_
x-ms-office365-filtering-correlation-id: 3ace58cc-2cb0-47bb-6212-08db78c871a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNJz5xySblNgj0C4MC0MTKeIo/SIivjgP6DeuqEbEFxDu5Qp7O4d4eSYhxpvE3+IdvIEY2ownX84BH8iGHZcIqcszozbGMLsLOYV6WSO5s0ODrbXIXeHX7pkY+17m6MNX6kvKXQnAZ0wT03ttV90sQXUdNg5ijr3twMOjz/UFAnzTEdeQClOIgJZ98lKunGFJzUd68KYBiWq/rTaY4dP9CcvPD6mt2PD4MW8ms9+wSoNvjtd2I+SH1bGMlLcQ6TFo8O1RiLxeZqBwjRC71Cd15KxzQxfdUQAeQQzmcAZsDvk3ILV8AYhP6vONbqSQ9n1EOZhQP6iKooWhVp4Vd3J5M7mXjU6GurOAOrNmYMrIOOyd3awsVJOO0Efp8E/lNq4YmaXwi6Ndu8EE8XewPyZsXeqFCIdP5UsFDIqYxI1I8rwyGT/Ja3AwanhH9X3PoI2uSaDK59v4EbWwYPaq/Q9b+Gx038MaAxmmeFtsR6EotA7XB6S3VGUesvj7BdyUfLDhaDL8iIrRByAub/Ua/3B5aCCzIoGbMU63oiWXo/J9dHOiJCd++4/h6zDmne82DCffdD0UtLKcK8V76wQlLAgsfuWX6u7nZOA4yqdn8JzZzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(6506007)(53546011)(186003)(26005)(9686003)(83380400001)(55016003)(38070700005)(52536014)(5660300002)(54906003)(110136005)(122000001)(38100700002)(71200400001)(7406005)(7416002)(478600001)(316002)(66556008)(66476007)(4326008)(66446008)(66946007)(64756008)(76116006)(8676002)(41300700001)(8936002)(86362001)(33656002)(966005)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzFNeWU0UEMyNk1Hb1IyNW9Zb0tPSnFGYlBGSFE4NldFWXRoZnRHQ0RtaUJC?=
 =?utf-8?B?ZFIvWkxJa2VWVzNDV0w2STRGU3Nqc3p3VVRNUTkwR3ZLU05haGc0YWNHMERp?=
 =?utf-8?B?Q08yS29xL0Y1bWpNY3JPaHh1eTlVemZtc2FtRU5sMnZRNDgyUnJERUdxNlMx?=
 =?utf-8?B?b2lYaXFTZFVmNFVTQ2pRNlVCRGx6NURUZjlySUVJUWJoYlQ4eE43ZEduYnp1?=
 =?utf-8?B?aXVuOGJsVXJWWUwrbk8rcngxOXV2TlJMVkE5UXhHbTZTUS9nQ3UwRlZuM0lm?=
 =?utf-8?B?WHZKQnk1a0xSRXdIbU83R2RKaXVxUmh2RElYTWZaRFkrM2dnUHJrZG5QcFpl?=
 =?utf-8?B?YW5zK0lVZ0tmWmRkL241RTFCSG9ONWRrL2tJWEJYUis4cy80RlFIWkZ5eksr?=
 =?utf-8?B?T0dPbnowclMrQ1RaR1RTb2Zidlk5cGxlYU15L2VuaWVBQ1I2ZkR5ZTJSZ212?=
 =?utf-8?B?OXkrSlJOVmthVkNKSjVpMkEwVmhZL0FMb3dqVk0xRUJBRm1yOHQvZlVKQ0FT?=
 =?utf-8?B?WkhUa2o3N1JlUG1Mck5uNWZUTFFENmhMMnY0S25mR09ZREh2NDdEQ3M4SG5G?=
 =?utf-8?B?REl4aFpLa21qVmZEN1Fhc2ZlNitBUU11Rm5VVWdocWgxOEJmVDJqbjc4TXFx?=
 =?utf-8?B?UkdyWVZKRkNtdEZBS3FvWllhcTFCUWJtVFJRbllIZHFFeitEdlRqSWV6UFZF?=
 =?utf-8?B?aGNPcmtyUVI5Nlp1MTEwTktYdnp4cWsrMlNLQno3aE9vYndVeXhjVVk3MUJs?=
 =?utf-8?B?eTcrMDYrN1hVR0xsQWl5SUVJSDAxWDZDVEdXcHpwZ2JiQlhCaWhYNnRlRVNZ?=
 =?utf-8?B?a2VVWENhV2NZc08wcjhNQURKcjRLblhLTWlCSWE2L0t5WXFHaHdZNzdxMXZM?=
 =?utf-8?B?eUF6R2NCbHZTV1liTFQvZVErVUNzQWwwMFpLK3BRUXJmVm40d2JDUXBXb1BM?=
 =?utf-8?B?SFo4SUxESEpqT0cyL204amI1V2pPQmRKTzk2NGI2WDFtRTVmbHZvN2tSRVM1?=
 =?utf-8?B?dnNqTXQ3NnF1bk9sbzlUTEZ6dlBGZSt1Z2J2VFdvbHVpV2dZejBnKzlGYVZB?=
 =?utf-8?B?ZlVCNlR5NzYrSkJBWVYvSi9xSUg3aDdqZzB3WXpLY2psc2RNTHpDUmNadUpR?=
 =?utf-8?B?TmZWVEw1bEh4bXFlZ1ZjZG9oZjJ2UXp1ZXRjRW1RQmhtTlpWYWRCN3hoS2Uv?=
 =?utf-8?B?RTN4SDNWMURwWXFhTDdwbU5lQ2QrTjRxVDBKcDBMODVtQkhmYkpPMnhGTFJC?=
 =?utf-8?B?Z21BYTBrak5qNFdwUUtXcWQ5SHNqcCtybFFBa3ZlemNUQVVMbGEvV3htZE5s?=
 =?utf-8?B?T0ROMFJoYldJTjVoalJ4TElEcDNLcWEza3FIalZ6WEJiRDJxZ0VOczFYYkx3?=
 =?utf-8?B?M24vSm5lV1FQeUFlVVpMSnRrZUdySlJVZERrNUJ2YldINW5uWlljTGpwSEJj?=
 =?utf-8?B?emRkYWY4Q1hIOGZTaVp5dHo4T0NXVE1GVDNNVlU2cVlKUDNvKzZ5dUVoY0Rz?=
 =?utf-8?B?OUxpZ2tJWGhrb2xaTXZsSGc4QU9UYmJtWEdrc3d0NW5leUNtWTE0REZwaDkr?=
 =?utf-8?B?ZzVXZFhDZE44ZGNjQi9uZ3hFblNMZTIxVnlMODV0L2tXbUlKdmxINDRJN2cz?=
 =?utf-8?B?WnVJdE9ndkFGTUQzcDByWlE0a2dQVXA3SWtEa1lDY3BPa0gyR2pZNTBNQ2NE?=
 =?utf-8?B?SkdDb1Z1QjNaYUtNWEpRd3BLYWdQMTVYOGdGRTdOdGdBYXJzbGpGemZOa1h6?=
 =?utf-8?B?NzBqTXBtMkIwZkJyL20xOG52Y2V2WFNBWkxOU1N6SDdYQnpHWExNR3BkZWdl?=
 =?utf-8?B?aTRvUTBzNzMzZnZ2b0svSDNFVlFXRnA4Mm0xUjd5anV0MWhKL3dRdGRwaUZK?=
 =?utf-8?B?Y1RVbk9IK2NVTytYRHFodzVrL3A3WU1qV0NLTDRqMGZwaEZnWWd3dXpPV3Bq?=
 =?utf-8?B?MXdxUk1tbXVKMktLb0hQcXI2Njc5Vk9qSEJmRkE0eElyb20wSGtzNGZWZ2lo?=
 =?utf-8?B?RHVwQzB3d3FSSXBBYUlZdUt6cWl6MlI2NzQvQ095V0lVeE52MkhxRWhwdXVV?=
 =?utf-8?B?YlhTT0EyOXlRQjJNTXFwZVhObnBodEdWeTZRb0h3d1BXUEJ1ajR3eGtHOVRV?=
 =?utf-8?Q?5UZ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ace58cc-2cb0-47bb-6212-08db78c871a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 17:44:09.7804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENsks10MoJ/zMEFQLmhbTcRFr5tPkywvw+j7D7W7dWaXXwOQgxN8bQ4uhAyfc0JrcxGI1fYDi922bkXK55bd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang,
 Bokun" <Bokun.Zhang@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiAxNTMzMDI3
MzI2MEAxODkuY24gPDE1MzMwMjczMjYwQDE4OS5jbj4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUg
MjksIDIwMjMgMTI6MDAgUE0NCj4gVG86IEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9y
Zz47IFN1aSBKaW5nZmVuZw0KPiA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IENjOiBCam9y
biBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPjsgbGludXgtZmJkZXZAdmdlci5rZXJuZWwu
b3JnOw0KPiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47IEthcm9sIEhlcmJzdCA8
a2hlcmJzdEByZWRoYXQuY29tPjsNCj4gbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEpv
b25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoYWksDQo+IFRob21hcyA8WWlQZW5nLkNoYWlA
YW1kLmNvbT47IExpbW9uY2llbGxvLCBNYXJpbw0KPiA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNv
bT47IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgRGF2aWQNCj4gQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT47IFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPjsgWWkgTGl1DQo+IDx5aS5sLmxpdUBpbnRlbC5jb20+OyBrdm1Admdlci5rZXJuZWwub3Jn
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+OyBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+OyBsaW51eC0NCj4gcGNp
QHZnZXIua2VybmVsLm9yZzsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBMYXph
ciwgTGlqbw0KPiA8TGlqby5MYXphckBhbWQuY29tPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Ow0KPiBaaGFuZywgQm9rdW4gPEJva3VuLlpoYW5nQGFtZC5jb20+OyBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgSmFuaSBOaWt1bGENCj4gPGphbmkubmlr
dWxhQGxpbnV4LmludGVsLmNvbT47IEFsZXggV2lsbGlhbXNvbg0KPiA8YWxleC53aWxsaWFtc29u
QHJlZGhhdC5jb20+OyBBYmhpc2hlayBTYWh1IDxhYmhzYWh1QG52aWRpYS5jb20+Ow0KPiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+Ow0KPiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50
ZWwuY29tPjsgWWlzaGFpIEhhZGFzDQo+IDx5aXNoYWloQG52aWRpYS5jb20+OyBQYW4sIFhpbmh1
aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDYvOF0gUENJL1ZHQTogSW50cm9kdWNlIGlzX2Jv
b3RfZGV2aWNlIGZ1bmN0aW9uDQo+IGNhbGxiYWNrIHRvIHZnYV9jbGllbnRfcmVnaXN0ZXINCj4N
Cj4gSGksDQo+DQo+IE9uIDIwMjMvNi8yOSAyMzo1NCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToNCj4g
PiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCAwMTowODoxNVBNICswODAwLCBTdWkgSmluZ2Zlbmcg
d3JvdGU6DQo+ID4+IEhpLA0KPiA+Pg0KPiA+Pg0KPiA+PiBBIG5vdXZlYXUgZGV2ZWxvcGVyKEx5
dWRlKSBmcm9tIHJlZGhhdCBzZW5kIG1lIGEgUi1CLA0KPiA+Pg0KPiA+PiBUaGFua3MgZm9yIHRo
ZSBkZXZlbG9wZXJzIG9mIG5vdXZlYXUgcHJvamVjdC4NCj4gPj4NCj4gPj4NCj4gPj4gUGxlYXNl
IGFsbG93IG1lIGFkZCBhIGxpbmtbMV0gaGVyZS4NCj4gPj4NCj4gPj4NCj4gPj4gWzFdDQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wYWZhZGM2OWY5OWEzNmJjOWQwM2VjZjU0ZmYyNTg1
OWRiYzEwZTI4LmNhDQo+IG1lbEByZWRoYXQuY29tLw0KPiA+IDEpIFRoYW5rcyBmb3IgdGhpcy4g
IElmIHlvdSBwb3N0IGFub3RoZXIgdmVyc2lvbiBvZiB0aGlzIHNlcmllcywNCj4gPiAgICAgcGxl
YXNlIHBpY2sgdXAgTHl1ZGUncyBSZXZpZXdlZC1ieSBhbmQgaW5jbHVkZSBpdCBpbiB0aGUgcmVs
ZXZhbnQNCj4gPiAgICAgcGF0Y2hlcyAoYXMgbG9uZyBhcyB5b3UgaGF2ZW4ndCBtYWRlIHNpZ25p
ZmljYW50IGNoYW5nZXMgdG8gdGhlDQo+ID4gICAgIGNvZGUgTHl1ZGUgcmV2aWV3ZWQpLg0KPg0K
PiBZZXMsIG5vIHNpZ25pZmljYW50IGNoYW5nZXMuIEp1c3QgZml4IHR5cG8uDQo+DQo+IEkgYWxz
byB3b3VsZCBsaWtlIHRvIGFkZCBzdXBwb3J0IGZvciBvdGhlciBEUk0gZHJpdmVycy4NCj4NCj4g
QnV0IEkgdGhpbmsgdGhpcyBkZXNlcnZlIGFub3RoZXIgcGF0Y2guDQo+DQo+ID4gICBXaG9ldmVy
IGFwcGxpZXMgdGhpcyBzaG91bGQgYXV0b21hdGljYWxseQ0KPiA+ICAgICBwaWNrIHVwIFJldmll
d2VkLWJ5L0Fjay9ldGMgdGhhdCBhcmUgcmVwbGllcyB0byB0aGUgdmVyc2lvbiBiZWluZw0KPiA+
ICAgICBhcHBsaWVkLCBidXQgdGhleSB3b24ndCBnbyB0aHJvdWdoIHByZXZpb3VzIHJldmlzaW9u
cyB0byBmaW5kIHRoZW0uDQo+ID4NCj4gPiAyKSBQbGVhc2UgbWVudGlvbiB0aGUgY29tbWl0IHRv
IHdoaWNoIHRoZSBzZXJpZXMgYXBwbGllcy4gIEkgdHJpZWQgdG8NCj4gPiAgICAgYXBwbHkgdGhp
cyBvbiB2Ni40LXJjMSwgYnV0IGl0IGRvZXNuJ3QgYXBwbHkgY2xlYW5seS4NCj4NCj4gU2luY2Ug
SSdtIGEgZ3JhcGhpYyBkcml2ZXIgZGV2ZWxvcGVyLCBJJ20gdXNpbmcgZHJtLXRpcC4NCj4NCj4g
SSBqdXN0IGhhdmUgYWxyZWFkeSBwdWxsZWQsIGl0IHN0aWxsIGFwcGx5IGNsZWFubHkgb24gZHJt
LXRpcC4NCj4NCj4gPiAzKSBUaGFua3MgZm9yIGluY2x1ZGluZyBjb3ZlciBsZXR0ZXJzIGluIHlv
dXIgcG9zdGluZ3MuICBQbGVhc2UNCj4gPiAgICAgaW5jbHVkZSBhIGxpdHRsZSBjaGFuZ2Vsb2cg
aW4gdGhlIGNvdmVyIGxldHRlciBzbyB3ZSBrbm93IHdoYXQNCj4gPiAgICAgY2hhbmdlZCBiZXR3
ZWVuIHY2IGFuZCB2NywgZXRjLg0KPg0KPiBObyBjaGFuZ2UgYmV0d2VlbiB2NiBhbmQgdjcsDQo+
DQo+IGl0IHNlZW1zIHRoYXQgaXQgaXMgYmVjYXVzZSB0aGUgbWFpbGJveCBkb24ndCBhbGxvdyBt
ZSB0byBzZW5kaW5nIHRvbw0KPiBtYW55IG1haWxzIGEgZGF5Lg0KPg0KPiBzbyBzb21lIG9mIHRo
ZSBwYXRjaCBpcyBmYWlsZWQgdG8gZGVsaXZlcnkgYmVjYXVzZSBvdXQgb2YgcXVvdGEuDQo+DQo+
DQo+ID4gNCkgUmlnaHQgbm93IHdlJ3JlIGluIHRoZSBtaWRkbGUgb2YgdGhlIHY2LjUgbWVyZ2Ug
d2luZG93LCBzbyBuZXcNCj4gPiAgICAgY29udGVudCwgZS5nLiwgdGhpcyBzZXJpZXMsIGlzIHRv
byBsYXRlIGZvciB2Ni41LiAgTW9zdA0KPiA+ICAgICBtYWludGFpbmVycywgaW5jbHVkaW5nIG1l
LCB3YWl0IHRvIG1lcmdlIG5ldyBjb250ZW50IHVudGlsIHRoZQ0KPiA+ICAgICBtZXJnZSB3aW5k
b3cgY2xvc2VzIGFuZCBhIG5ldyAtcmMxIGlzIHRhZ2dlZC4gIFRoaXMgbWVyZ2Ugd2luZG93DQo+
ID4gICAgIHNob3VsZCBjbG9zZSBvbiBKdWx5IDksIGFuZCBwZW9wbGUgd2lsbCBzdGFydCBtZXJn
aW5nIGNvbnRlbnQgZm9yDQo+ID4gICAgIHY2LjYsIHR5cGljYWxseSBiYXNlZCBvbiB2Ni41LXJj
MS4NCj4NCj4gSSdtIHdvbmRlcmluZw0KPg0KPiBXb3VsZCB5b3Ugd2lsbCBtZXJnZSBhbGwgb2Yg
dGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgKGUuZy4gaW5jbHVkaW5nDQo+IHRoZSBwYXRjaCBm
b3IgZHJtL2FtZGdwdSg3LzgpIGFuZCBkcm0vcmFkZW9uKDgvOCkpID8NCj4NCj4gT3IganVzdCBw
YXJ0IG9mIHRoZW0/DQo+DQo+IEVtbSwgSSBkb24ndCBrbm93IGJlY2F1c2UgbXkgcGF0Y2ggc2Vl
bXMgYWNyb3NzIGRpZmZlcmVudCBzdWJzeXN0ZW0gb2YNCj4gTGludXgga2VybmVsLg0KPg0KPiBU
aGVyZSBpcyBhbHNvIGEgZGV2ZWxvcGVyIGZvciBBTURHUFUgKE1hcmlvKSBnaXZlIG1lIGEgUi1C
IGZvciB0aGUNCj4gcGF0Y2gtMDAwMiBvZiB0aGlzIHNlcmllcy4NCj4NCj4gU28sIGF0IGxlYXN0
LCBQQVRDSC0wMDAxLCBQQVRDSC0wMDAyLCBQQVRDSC0wMDAzLCBQQVRDSC0wMDA0LCBQQVRDSC0N
Cj4gMDAwNg0KPiBhcmUgYWxyZWFkeSBPSyhnb3QgcmV2aWV3ZWQgYnkpLg0KPg0KPiBUaG9zZSA1
IHBhdGNoIGFyZSBhbHJlYWR5IHF1YWxpZmllZCB0byBiZSBtZXJnZWQsIEkgdGhpbmsuDQoNCkkg
dGhpbmsgd2hhdCB5b3UgY2FuIGRvIGlzIHBpY2sgdXAgYWxsIHRoZSB0YWdzIGluIHlvdXIgbmV4
dCB2ZXJzaW9uLiAgT25jZSB0aGUNCndob2xlIHNlcmllcyBoYXMgdGFncyB3ZSBjYW4gZGlzY3Vz
cyBob3cgaXQgbWVyZ2VzLg0KDQo+DQo+IEkgbWVhbnMgdGhhdCBpZiB5b3UgY291bGQgbWVyZ2Ug
dGhvc2UgNSBwYXRjaCBmaXJzdCwgdGhlbiB0aGVyZSBubyBuZWVkDQo+IHRvIHNlbmQgYW5vdGhl
ciB2ZXJzaW9uIGFnYWluLg0KPg0KPiBJIHdpbGwgcmVmaW5lIHRoZSByZXN0IHBhdGNoIHdpdGgg
bW9yZSBkZXRhaWxzIGFuZCBkZXNjcmlwdGlvbi4NCj4NCj4gSSdtIGZlYXIgb2YgbWFraW5nIHRv
byBtdWNoIG5vaXNlLg0KPg0KPiA+IEJqb3JuDQo=
