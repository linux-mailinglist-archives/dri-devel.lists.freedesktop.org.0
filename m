Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ACE77B33C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686EA10E15B;
	Mon, 14 Aug 2023 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8390510E155;
 Mon, 14 Aug 2023 08:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2C9W4uWQhN+xv7EOGR+ItQ3gYfZ8RruCsrcAKamRUh5VpMcwsoEC5p7H12IooFseW1BADI20wGaqHvUyyBD2XNJZOwE0ImF6k1YVzlkGGUaE6rEXvHH8shzEdAoN5awd7TtiRAS4kE4/RjBgAse8fCdHwmbeeCartGemBo1bvNyt7onXtw+BxJ54o1p/OIGnzMhlBlzHdpRklCXxKcuTudj3eSvGcp8wl7SVje7r/VOi8vZ0V7e+pd3JA9RA/lupOrfc9R126Fn7Lj+tAL8xxqg1YFlQlnix8vDL4ZpiNI0Cpxqw54zyss5570GjnIcI8Qs38CRhpvjExP3Y0zmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WrOHsDh72F6+xnbbF4YWbQSIVJoDDVghz+Widr7COg=;
 b=NBBWEGWCkg0I7M4Nvn3x2HnZ8UoKnBSCdZ7cBU7EspJHLdFI86CE4xWYIeCZ8HWiKKr40X/WKkZkaIPNl1jDElIQU4H3cRkC1g/YJ6jZEHwMa3V/mPtFxHX2BCwkrVJgqWPvbfe2fOIAykfc0aSP54tsBp8QVDDQPk6FTEPelP8kVvpSao7YwQwpbNvSYQDqcysK5xdg6GGLFV6CJjlPEyUQm/OVWqeubpG8B8DU+B47LFCFxTD9DdBKfWdQSDENBtI3XbCCBo6VplTGLdzF6Zpz3JbRiMfTRrZKkXwhxJxsLRI0dxCtYhCO9gOaY7NGj/rVeXdYxpC/M5gP/m8O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WrOHsDh72F6+xnbbF4YWbQSIVJoDDVghz+Widr7COg=;
 b=ThKF4IbG+hO9TdAUBgtJRE3SXgnDM45EllAS72CgQoIbLhFkQpwvgrlzV0dmr3QPcBypraPA1qQJdkG/7RN70eN+CsOf8EbY48mGXD3PN0zTejGT8D9IqqQoGVPwZbPa7yBk1QfWdX3XWsk0lzOxpRHjmsWL/NtQNh8R+QmIiaY=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 08:04:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:04:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, "rafael@kernel.org"
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
Subject: RE: [PATCH V8 3/9] cfg80211: expose nl80211_chan_width_to_mhz for
 wide sharing
Thread-Topic: [PATCH V8 3/9] cfg80211: expose nl80211_chan_width_to_mhz for
 wide sharing
Thread-Index: AQHZy13mA9e0B2+iGkK7tLdDIvVtXa/jkNEAgAXj/LA=
Date: Mon, 14 Aug 2023 08:04:54 +0000
Message-ID: <DM6PR12MB2619D4515E63189F6AE489EAE417A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-4-evan.quan@amd.com>
 <ec8d88db-4af7-3567-ac6a-92f50f0da8bb@quicinc.com>
In-Reply-To: <ec8d88db-4af7-3567-ac6a-92f50f0da8bb@quicinc.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-14T08:04:51Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=9e376a33-e566-4452-8cfc-53c0140c7803;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DS0PR12MB6416:EE_
x-ms-office365-filtering-correlation-id: b13b020d-bd1b-437f-7d3b-08db9c9d24e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AgzAyHl0i1K0DQB3XYBaWcq+PpVxK4KmAW2fDXo5ULqaxIr3tz0Hw+FfGzKTiJbpfa0Tbo1SBu+qcwS2qjzTNARrwsIRqj+ZLF/K/qf3qYvgEc4a11IFbQaztyvnmP5DyorleM3wbJ9DJgnv3F7jr8QspNFJG/0PVduMrMVYYmdggwkxFQNXXlJ+09IgCQWbuYn9gB4X38osTsCtIOwM5uJ0pv3hmE/OzyasaXvOSiFjEpudQSOx1pKlrDTS9CjxOnTnDaTl4NrY3+mo2Kq+rvkhWByd84hFNZsx86pXIJcKBl0Nsh2DCkq5jM+WT8eQV4Q2UqMl8VK7nSvblgbVOu5dSqL5HjDyMPP0zxtxGnDOQV2sX6kVk2/i60VhwvzdM1X7IOawr2rQfZPzsI3e0hi4l/5j62L5q7edGK4/KVXekqW4yApGvN5TKdiVCXQhrwweOOzAFa/SQ39XgbZgjVAnmW46ffC8QW7rjGQzuOKtIL0m1v7+RWwKr3aRRUfKBYyT77anG5eEbLBFvl6nWloUGafrVveKs26gOY9AWqWG6MGpmh4BsPnh/0kxd02lRl0T7orK0f15QWLjsRMuzeSdjefYKDUVwOJG2VONWNG3tOxO6ipQEVpeWlVz5hHDZzex/aa6NFKrNXb2ZeZTZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(186006)(1800799006)(33656002)(52536014)(5660300002)(7416002)(2906002)(86362001)(55016003)(83380400001)(66476007)(54906003)(66556008)(64756008)(66446008)(4326008)(38070700005)(76116006)(38100700002)(66946007)(316002)(110136005)(41300700001)(26005)(9686003)(53546011)(6506007)(7696005)(71200400001)(8936002)(8676002)(478600001)(921005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXIrS1o4c3Nidk1NZWUwODdVVDF3VlVqZEtrWkpnMHBQenZaVWdCQUZIY2FX?=
 =?utf-8?B?cGVlVy93Q0JvZ1Zkb203K0dJVmZ1Um4wbUdLK0x5dmJhR2xDZmJPSFJMM1NU?=
 =?utf-8?B?VDU2Q1dlemt2czZOeFhPUy9YNUtETkRXM3Y4WkZyM2xyNzNwUE8yMkZhejE5?=
 =?utf-8?B?cFpWZ1BCaWViS0NwYTQ2eFMxTGVYd1E5cnZUMTJFQU1iZDNseGFQR0M3V0FG?=
 =?utf-8?B?aldGM3FnZnRZaE5PcFFhUlRuZm8xUWI4M0Vzc1FHRVdWa0xOcDUwQW9FdzJ5?=
 =?utf-8?B?RDErZ3NnWHc0Q0dqQWJxRXNUU3ZOdXp2MlRzR3BBSUpna2lZQUhqNUpVTUtt?=
 =?utf-8?B?eXZHMjdreTE1S0FCT0k0RGZyUGowUldxYUxqZ1ZVRnR5cXY0Sm5MVnRxRlFM?=
 =?utf-8?B?VE9PbTR4SmNqMk0xRkk0RDUvWWtsR2ZWby9QNHVXcmQyY2V6RVBBSVc3UndQ?=
 =?utf-8?B?anU0RmNmbnRXbVkydTk3RVJCWENYRHlxUlRXdVZpYlNOdmJGeUU3dWVLZm9W?=
 =?utf-8?B?cUJzZXZRZHR0OFIxb1pGUHQvdUVBUFNneEVIbkk4VkNqbGZoUkY4R0dOVjRX?=
 =?utf-8?B?SUVLSVhXQ1lTYTgvK1BhSm9wa0hWRXg1d0NDZnZIUU9yMTlWRSs3NjVOWkJx?=
 =?utf-8?B?RW16VFJZWTdtZVEvWEJ2OHViNmpuYnVIQmdMdllXQVhzbzJoVTRlMjV0U3Bw?=
 =?utf-8?B?SnQwL0lpWktOQUN1SWpZQ3JSdXg3SHVrTDVwTzlqWFMySmJDSmlqY2JpeTd5?=
 =?utf-8?B?QUNUSHVoeUtxeGlrZlVxZ0toYkRTaXdYNWFRdXloV2w4aU5yN3Z1bDlsUjQ3?=
 =?utf-8?B?cTFWalcyb0h5azM0NTQ1UW5EeVpBNGFNOEgxMnQ0MWNleTFTTm5GeHpSVC9z?=
 =?utf-8?B?TVBZUElnZWlLVXVZVENtR3NCMVhQTzRBM3haRFZDYmxZNjgzRitFM0Zqd1pU?=
 =?utf-8?B?OURXK2JDT3dQQmwwNkt2dk90cU1TNGhDWjhLK0NNejRjWkpyQXN5eThZcHRv?=
 =?utf-8?B?OEp6QnR0L2hoaTUrQVNCdG8wUEdOK0pOK3JqNUMyUFhhVU54Ri9JTmJ2QUFR?=
 =?utf-8?B?WFEvR3B4T3hFUHc3U25mR3EvN1NPT1hFamkvVXpoOUR2SHFqR1k3Y0djNFlv?=
 =?utf-8?B?cm0zVFd5Tk5XbzI4anI4NFJ2b3dLb1d0eGFEeE54bHlqcUE5NlV5am05K2tm?=
 =?utf-8?B?Ym1vNW5CVFhwckd3U0FFa3RjYUEwWnFRY0tIbktrM0dmY2E0TVZXbjdtQ2RL?=
 =?utf-8?B?MkVMNURrOERlRDlhMVhEYjFjc3BwaHlKUGRORGlhYUc3M0FUS2pQY0Mzd1Qz?=
 =?utf-8?B?eE5nK1M4UmZTMUFtNU5kRW9yeG9xYmMzVFkxaTZ3bTBwWnhDdDhFOXJ4NzY5?=
 =?utf-8?B?TmtpQkFoVzVFb1M5MFJGU3NYZXNjUTRZcHBrbFFGS1pnNEpCWmFXL2ZMMXNn?=
 =?utf-8?B?WEc1VTErYkdGVHVrL2dzbG4wd1lFQzVtaW03STJkdGNRRlN3NnZWTTBkMjll?=
 =?utf-8?B?VEZiYmpPTGRjbmpleHpLZnJZVmEvckQ4Tlh1UDNsdW1HTDlRVUNreFhsWGhY?=
 =?utf-8?B?SklWWlNOdVZJYkhlTlVKKy9aeDMyd2k2VnhvcFU5TytEK3RPcUMrdEJDMXlL?=
 =?utf-8?B?aEtiNkUwMFFGNWloT0JHODk4akFrVVNqM1JPVFZhVnpmL0ZYL1hTOGxxWUF4?=
 =?utf-8?B?bUZSdkNXSXVlOC8rb21hRjIxVDJxRG5ENUlkeWczYitXbXJjVllUMTZkMllu?=
 =?utf-8?B?ajBXVDc3bVlaWFJMNmNqalFtblpxd1lzSExvRDlxWGUweDV6YTJsMTVZNzR1?=
 =?utf-8?B?NDFKM0hiVHB0VERUdmUvWGs5UkkraHhGMTZ6c0pRL2VvUTE0Nk5VbW5ldTVj?=
 =?utf-8?B?a2dsOUhSaFNkZ3NLRVYvVWloMkJJb0dXR0xUNVJvWmJObmpQb2c4cmhHZVFF?=
 =?utf-8?B?ZVhIb0NwaWdWZi95OGYzT1ZSOFJJNG14a0NxZ2srTXhQdWIxaVYxdGpXSXpC?=
 =?utf-8?B?bkc0L0VXUnNGaGZmQUZwVnd1VVVTOXF0bHc1MHR4STNwM0lDdm01ZlpndFpo?=
 =?utf-8?B?c3NHWENHVmdFdWtWWXFtMUhERjFVSHp3Nkd2RHR3TzBFMFJJTDFRMWE4bmpG?=
 =?utf-8?Q?3pMY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13b020d-bd1b-437f-7d3b-08db9c9d24e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 08:04:54.5358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0unoAlff1FY7V87ACrHeh31NY2j/lKmuIMpmg0l6ovMB1U5xQ2F/iYSYAHdXRTy
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
TWVzc2FnZS0tLS0tDQo+IEZyb206IEplZmYgSm9obnNvbiA8cXVpY19qam9obnNvbkBxdWljaW5j
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxMCwgMjAyMyAxMDowNiBQTQ0KPiBUbzog
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyByYWZhZWxAa2VybmVsLm9yZzsgbGVuYkBr
ZXJuZWwub3JnOw0KPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUGFu
LCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47DQo+IGFpcmxpZWRAZ21haWwuY29tOyBkYW5p
ZWxAZmZ3bGwuY2g7IGpvaGFubmVzQHNpcHNvbHV0aW9ucy5uZXQ7DQo+IGRhdmVtQGRhdmVtbG9m
dC5uZXQ7IGVkdW1hemV0QGdvb2dsZS5jb207IGt1YmFAa2VybmVsLm9yZzsNCj4gcGFiZW5pQHJl
ZGhhdC5jb207IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT47
DQo+IG1kYWVuemVyQHJlZGhhdC5jb207IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bTsNCj4gdHppbW1lcm1hbm5Ac3VzZS5kZTsgaGRlZ29lZGVAcmVkaGF0LmNvbTsgamluZ3l1d2Fu
Z192aXBAMTYzLmNvbTsNCj4gTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT47IGppbS5j
cm9taWVAZ21haWwuY29tOw0KPiBiZWxsb3NpbGljaW9AZ21haWwuY29tOyBhbmRyZWFsbWVpZEBp
Z2FsaWEuY29tOyB0cml4QHJlZGhhdC5jb207DQo+IGpzZ0Bqc2cuaWQuYXU7IGFybmRAYXJuZGIu
ZGU7IGFuZHJld0BsdW5uLmNoDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4gd2lyZWxlc3NA
dmdlci5rZXJuZWwub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjggMy85XSBjZmc4MDIxMTogZXhwb3NlIG5sODAyMTFfY2hhbl93aWR0aF90b19taHoN
Cj4gZm9yIHdpZGUgc2hhcmluZw0KPiANCj4gT24gOC8xMC8yMDIzIDEyOjM3IEFNLCBFdmFuIFF1
YW4gd3JvdGU6DQo+ID4gVGhlIG5ld2x5IGFkZGVkIFdCUkYgZmVhdHVyZSBuZWVkcyB0aGlzIGlu
dGVyZmFjZSBmb3IgY2hhbm5lbCB3aWR0aA0KPiA+IGNhbGN1bGF0aW9uLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGluY2x1ZGUvbmV0L2NmZzgwMjExLmggfCA4ICsrKysrKysrDQo+ID4gICBuZXQvd2lyZWxlc3Mv
Y2hhbi5jICAgIHwgMyArKy0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbmV0L2NmZzgw
MjExLmggYi9pbmNsdWRlL25ldC9jZmc4MDIxMS5oIGluZGV4DQo+ID4gN2M3ZDAzYWE5ZDA2Li5m
NTA1MDhlMjk1ZGIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9uZXQvY2ZnODAyMTEuaA0KPiA+
ICsrKyBiL2luY2x1ZGUvbmV0L2NmZzgwMjExLmgNCj4gPiBAQCAtOTIwLDYgKzkyMCwxNCBAQCBj
b25zdCBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgKg0KPiA+ICAgY2ZnODAyMTFfY2hhbmRlZl9j
b21wYXRpYmxlKGNvbnN0IHN0cnVjdCBjZmc4MDIxMV9jaGFuX2RlZg0KPiAqY2hhbmRlZjEsDQo+
ID4gICAJCQkgICAgY29uc3Qgc3RydWN0IGNmZzgwMjExX2NoYW5fZGVmICpjaGFuZGVmMik7DQo+
ID4NCj4gPiArLyoqDQo+ID4gKyAqIG5sODAyMTFfY2hhbl93aWR0aF90b19taHogLSBnZXQgdGhl
IGNoYW5uZWwgd2lkdGggaW4gTWh6DQo+ID4gKyAqIEBjaGFuX3dpZHRoOiB0aGUgY2hhbm5lbCB3
aWR0aCBmcm9tICZlbnVtIG5sODAyMTFfY2hhbl93aWR0aA0KPiA+ICsgKiBSZXR1cm46IGNoYW5u
ZWwgd2lkdGggaW4gTWh6IGlmIHRoZSBjaGFuX3dpZHRoIGZyb20gJmVudW0NCj4gPiArbmw4MDIx
MV9jaGFuX3dpZHRoDQo+ID4gKyAqIGlzIHZhbGlkLiAtMSBvdGhlcndpc2UuDQo+IA0KPiBTSSBu
aXQ6IHMvTWh6L01Iei8gaW4gYm90aCBwbGFjZXMNClRoYW5rcywgd2lsbCB1cGRhdGUgdGhlbSBh
Y2NvcmRpbmdseS4NCg0KRXZhbg0KPiANCj4gPiArICovDQo+ID4gK2ludCBubDgwMjExX2NoYW5f
d2lkdGhfdG9fbWh6KGVudW0gbmw4MDIxMV9jaGFuX3dpZHRoDQo+IGNoYW5fd2lkdGgpOw0KPiA+
ICsNCj4gPiAgIC8qKg0KPiA+ICAgICogY2ZnODAyMTFfY2hhbmRlZl92YWxpZCAtIGNoZWNrIGlm
IGEgY2hhbm5lbCBkZWZpbml0aW9uIGlzIHZhbGlkDQo+ID4gICAgKiBAY2hhbmRlZjogdGhlIGNo
YW5uZWwgZGVmaW5pdGlvbiB0byBjaGVjayBkaWZmIC0tZ2l0DQo+ID4gYS9uZXQvd2lyZWxlc3Mv
Y2hhbi5jIGIvbmV0L3dpcmVsZXNzL2NoYW4uYyBpbmRleA0KPiA+IDBiN2U4MWRiMzgzZC4uMjI3
ZGIwNGVhYzQyIDEwMDY0NA0KPiA+IC0tLSBhL25ldC93aXJlbGVzcy9jaGFuLmMNCj4gPiArKysg
Yi9uZXQvd2lyZWxlc3MvY2hhbi5jDQo+ID4gQEAgLTE0MSw3ICsxNDEsNyBAQCBzdGF0aWMgYm9v
bCBjZmc4MDIxMV9lZG1nX2NoYW5kZWZfdmFsaWQoY29uc3QNCj4gc3RydWN0IGNmZzgwMjExX2No
YW5fZGVmICpjaGFuZGVmKQ0KPiA+ICAgCXJldHVybiB0cnVlOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LXN0YXRpYyBpbnQgbmw4MDIxMV9jaGFuX3dpZHRoX3RvX21oeihlbnVtIG5sODAyMTFfY2hhbl93
aWR0aA0KPiA+IGNoYW5fd2lkdGgpDQo+ID4gK2ludCBubDgwMjExX2NoYW5fd2lkdGhfdG9fbWh6
KGVudW0gbmw4MDIxMV9jaGFuX3dpZHRoIGNoYW5fd2lkdGgpDQo+ID4gICB7DQo+ID4gICAJaW50
IG1oejsNCj4gPg0KPiA+IEBAIC0xOTAsNiArMTkwLDcgQEAgc3RhdGljIGludCBubDgwMjExX2No
YW5fd2lkdGhfdG9fbWh6KGVudW0NCj4gbmw4MDIxMV9jaGFuX3dpZHRoIGNoYW5fd2lkdGgpDQo+
ID4gICAJfQ0KPiA+ICAgCXJldHVybiBtaHo7DQo+ID4gICB9DQo+ID4gK0VYUE9SVF9TWU1CT0wo
bmw4MDIxMV9jaGFuX3dpZHRoX3RvX21oeik7DQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQgY2ZnODAy
MTFfY2hhbmRlZl9nZXRfd2lkdGgoY29uc3Qgc3RydWN0IGNmZzgwMjExX2NoYW5fZGVmDQo+ICpj
KQ0KPiA+ICAgew0K
