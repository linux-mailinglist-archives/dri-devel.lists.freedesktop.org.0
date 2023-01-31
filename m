Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF1682483
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 07:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D5210E332;
	Tue, 31 Jan 2023 06:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B9910E329;
 Tue, 31 Jan 2023 06:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5mZAdaNjGZgC+2YAweRzotuf5yS4dqjGJOzMbt3f8NuFbVCMRMwr5jdmmkpGICaaVC+Gl9qfA4XTk+FDr30ZtxSr14yarlnS2DqwNvFVQHjBm1YVA09FNpPldClhIlmISiJ/yK2t0X7rxu7y5jB2vMsViS2Nmj2lxqQhXOTw7UY4zIV7OrFM1MfnYUyQfmgSOIjp7Kf8d7uYGeDJCXCLC0hmK/luSPULWnYwATmZjoQp2kW9z93JvRt6t6XfkiOhq1lR3XLCmmEuEeVtQDImGD01feDnxnfN1WEBV2CfC35on+AyWKEwMJwGWQMFxB1qNI7q7swQ5zVRMK/+iXxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3RnVU43IZr8KUDFe9AOqqjaCT3mSpTRWQLWUydw0eM=;
 b=d9mlC9chwSZZ/igMgl+S7G8lgPUEAYFupDIu5zx/wHIckZxx/c3wtj6/MSPv5oR8Xhw54lFGcF1cXcwDYKWEsntA394AgY8sGWiwesXNEGxEjoBG7BUTDRwFlUBQzySYsMDtfxsgl0Xo2UmhmS2xNpVScfHe4vEkQN6Lc2+e7iCCZ3khOlaEc9KIhVvu9ffoKi8zn5OKvjS6/ktDPd/vvJOi0ZfXhfNRsIAfTJ8VO0ouJEPExXShIjiICtgmtk1+osO3HO+RLmg1ylaRGvabQiEZxXfD+3w2R4rRo9wxiikPbr9ZXfb2uuwi1Kq2tGsJ5ijz9tXDNfDZbFpqqOuIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3RnVU43IZr8KUDFe9AOqqjaCT3mSpTRWQLWUydw0eM=;
 b=rBgw9bSqAJ/AQU2kL5EcB5PX+zR4n2ABQd/PrXxuwoxfTGmPTf9BAjflZBGVhsgRQeNg06wF+FsDxdKxwHvc6aBl/y+rxU/2vbvuH+ElMR0oc4zhQN3AIwF2Vu6AuH1LXf/oPOR/NzWdJnFjt3DTcB43oZuCPSey6RJkDdOrA38=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 06:36:40 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::d068:807d:11c:eee0]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::d068:807d:11c:eee0%5]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 06:36:39 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Thread-Topic: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Thread-Index: AQHZNPQqGMT8M8ST7USP4Twf9c/CJK63gAOAgAAK34CAAIcCEA==
Date: Tue, 31 Jan 2023 06:36:39 +0000
Message-ID: <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
In-Reply-To: <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|SA1PR12MB8143:EE_
x-ms-office365-filtering-correlation-id: 469d450f-723b-4ac5-5138-08db03558268
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJbA6E4w4DqwM18YSGR9Js0+1ElELFzB9nlYxe5G5uOQoC5xNtylRPyD71tM6nc5lGpwEIpmdSHAx1etmHFsyVwGnfr4mhrNplhK1fJTM1y/CSXVKoVSLLL6ln7nnkGvCdj3SRUIjbm1xhmXBMJ6paxMZbhW8M3KyUWIjAgyxKp/Ola0FmAjJOzFifJldu3mlF/UhjIS8lWQN3ZxPL0Edwk2MYUk8wcQLrt4aCpWQNlDZzaANyrGANIai2kebD0rRhMe9DjKofiHYG9pGzDW89rTyeDJagu5Sm4tW+9DVNcdRyXPxZUJQMYY6IUbZGd1NCZgUUrPKgdzHIxCc09A8jHKqhd5sIrVRYfdL8Z1sxTwEPWZTzMlnaJnrwKN6J+sOhv+HaZ7rWwQLyDhulhDpy0AcFFEHTIC+ZtYXM1GqKL+Umap2XnM5Cwj9hG7y3U0o76jKJDMMAB285yc7NeS2Gk6YeskU9YYmYAkI1/I9UhIJnqJnT1UFyw7FA8n6+JAlx6DsVQim/9Bz+qysjzkaKAypsEzIB4OXRyJRaz6RFJ1VNssHvfC6fwPv15fMMvNc+khSjLLXupzvVkcjnKqsECtQQcjxbSmdS2g/2F0bYzpXWHW3BWNsjusQZAPk2xWDp6ItxyXjmLDZNx5UlJOXD3iQ4lcgXXVusyOCJidUbZ3Ij1JB4RrFpHz6yXuD71/NqvUJ+Wv8qbFWBWrC6e78g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(83380400001)(110136005)(316002)(54906003)(41300700001)(76116006)(4326008)(8936002)(52536014)(66446008)(66476007)(66556008)(64756008)(66946007)(8676002)(9686003)(6506007)(186003)(53546011)(478600001)(26005)(7696005)(71200400001)(38070700005)(86362001)(33656002)(55016003)(5660300002)(2906002)(122000001)(38100700002)(66899018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTRKVWp1T0FQVGU5MmdJTUxsWXBwWGJITDMzY0MxOWpDYk1iVFF5S3hYZS9Z?=
 =?utf-8?B?ZkpUSzRDQTM4MEE5dUxwYXltV3lnTkovNlpUUEVEdXd5WUd6YVFCMmpBT2pP?=
 =?utf-8?B?WGZWZ2NLdEFsR1BlUTNQOXQvL1R2aXNZR2JUUGNlQWhudU1ROEZadlhITmpz?=
 =?utf-8?B?YXdxQ0plVWZmMkpZZTVwb3RHVVZNNEFzd1dKRmxCejU1dXdPYUxQQzZxODRH?=
 =?utf-8?B?Kys1a0I5Y0tkRHRPZVNocXVWcUI0TGwwMU5XaXYyeENGb0JNb0tSeXZ5d2Rq?=
 =?utf-8?B?TkN2OFgraVpBMmE3d0l2dElHNVdoV3hUSjlTWWhvOUhnUEFKZW9ESGNNUDZ3?=
 =?utf-8?B?QmtDTzZYd2lKT3JPRUV2c1plM09kOURla20xY2tUWnJPUlF5VTNZMzF3b2E5?=
 =?utf-8?B?WHhJUTMwM2tYU2VpeTF3MjlrWFVYZktiazcrSEtvZ1FlV3g5OUlLc2NNanBs?=
 =?utf-8?B?dXhOWmhDY1Q4WmZ3bW1PNzRNMC9CUjRxWGwyK2svNjlDUGVncVJKeGh2Y2hK?=
 =?utf-8?B?bGMrNXdqQ2tNcEFRQUpnZGxXeUwrb2FEYVpkeXgxQU1nU0RPL2JFMHVkOWFC?=
 =?utf-8?B?dWhDNjBUYmJCZlFTbGlXYk0yQ3lEbXlab2VnZWlkdC9QRTZrcXZFT0dFMzBS?=
 =?utf-8?B?d3MzVGVUcnQyNnp5cjBiYXVYallIZlhxNWgvMlNRVFZ3ZWxRRG9yTU5JOEhD?=
 =?utf-8?B?OUNXR3ZaN0lRTkhxeFE2NlY3R2NTOVJkRURqUGtwUk0zb0dJaHRpT0o0MG82?=
 =?utf-8?B?VHlueVM1QVZDRWcxaG94eGJSOCtMeE40QTk0SjNoYm1RWWdXc1BMcFJOTFNC?=
 =?utf-8?B?MStPZlhDQlB4emhDWThhTko5QXVKQVFpNTJlUzA5UktNSjYyYnA3akppMHUz?=
 =?utf-8?B?N1d2NnozaWR1L3J0ZWlMRDZYK3NtTzlZTkFaSzBpczB3WFRhU2FoTVh1N0Mv?=
 =?utf-8?B?SXR5TlRUbko2Zk4xNDljK2VvYlJ1T3gxeXpPbjEyZ0s1N3d5K084ZStYckdr?=
 =?utf-8?B?RVZTamZlbENyLzFWWTEwYTY5STBTUGdtaUtZcGF0aTI1WmsxdkpzTWoxM1FF?=
 =?utf-8?B?MjQwV0Q2dzE4VnRJWkVRb1JsZlFUQ1lmYU9FQzRmTXptS2p3amdZdERuMmtD?=
 =?utf-8?B?SkVpOTBpMjRQRUY4LzBRd1NsU0l0MThHdHYyVkN2U1VEOTBZTEY5dUUyMno4?=
 =?utf-8?B?R3RoaHl2dHpWY2FoMGdZQmd4VmhYRlVlMEZJN3lzeklZK00zZkVRRVJ2N05y?=
 =?utf-8?B?b1BtN3JWYzg2d3B5TTBGOE45WFRtNXgwT1hKZkg3ZjlkRTQrQzZjbFJOTzZj?=
 =?utf-8?B?Vkh6alA3ajJ1VWhpZDR1azJlMWIzVmVNU3dJNllJdzRpcFBXK3J4cm1jSk1N?=
 =?utf-8?B?R2l3NUx6U1M5M1U0ekQzZ0o0OTlLUXZTclNlb0hSZU04Vk9ncVRVT0VSS2Y0?=
 =?utf-8?B?WmY0bUJWR1JvQURObzNKS2krNlcrOWdqUDc4NTYrMWpvQW9GWm93eG5nRmJL?=
 =?utf-8?B?K05jZ3NZWnMxTmo2WW0zUnJ1TzNrTjJWTUVtWXdpbzB6SzhQYWt6L0JPakpy?=
 =?utf-8?B?UUhtYUc1QXlrN3ZxcTlhRVZyKzRhQ2wzN3dRUUx2QXdxQTFxdmV0SDRvTE81?=
 =?utf-8?B?RGNETThyL01Hc294T2lsbWU4R2xac1g5OXhJNUU2bzN3dlpLV3ZSeWdPVFNk?=
 =?utf-8?B?WXgxc3M3amNCUXRPZ1A4K2E2ZGdHdWNtUURhQ1JlaDJNbHUwWkdTMVFEaGQv?=
 =?utf-8?B?OW9na2xwbDRmcndNdjZMRzhYS3ZnK2ttdHVoUWZCTnphNGFUd0ZhVGdMNFZw?=
 =?utf-8?B?eHN4SnVGNWRTSG53a0MrMHFhbXlZblE1aHhBVnVrV3BLZUJOenJnVll5V3Bs?=
 =?utf-8?B?bEdwYlNqbG1XU3p4bWEyT2JCVG1pbDQrZjVYdHpWZ2xWcmdIbTV5VEZBZFVr?=
 =?utf-8?B?MGZaejA3TlpuYnd6a2ZBZjQ5TGJjSms1b0EvdkM5c0NyR2hrdER3S2tacWo4?=
 =?utf-8?B?VHIzbnNiVENsVldGYWw5bktJRjAxdlk4MGdsaHEvc3pST2t3MzBVSUNCczU4?=
 =?utf-8?B?aUFMVE5xR1Q2UFZyVVdqSkswNnhjYURBOTlrVk1ROG45VENSTkNvSXlMYWVY?=
 =?utf-8?Q?1W73f2J8lbJ9C7PGFDNYU2/dD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469d450f-723b-4ac5-5138-08db03558268
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 06:36:39.7566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3cjX2a0+mAjgBKFtF6n0USR/jMkRA/8IIgU6Qy9wc8OFlIl1MiQ15Q8Ojm6dn61/6AjGbGucJHwmfzR08dQi0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGljY29saSwNCg0KSSBhZ3JlZSB3aXRoIEFsZXgncyBwb2ludCwgdXNpbmcgcmluZy0+c2No
ZWQubmFtZSBmb3Igc3VjaCBjaGVjayBpcyBub3QgYSBnb29kIHdheS4gQlRXLCBjYW4geW91IHBs
ZWFzZSBhdHRhY2ggYSBmdWxsIGRtZXNnIGxvbmcgaW4gYmFkIGNhc2UgdG8gaGVscCBtZSB1bmRl
cnN0YW5kIG1vcmU/DQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiANClNlbnQ6
IFR1ZXNkYXksIEphbnVhcnkgMzEsIDIwMjMgNjozMCBBTQ0KVG86IEd1aWxoZXJtZSBHLiBQaWNj
b2xpIDxncGljY29saUBpZ2FsaWEuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBrZXJuZWxAZ3BpY2NvbGkubmV0OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5j
b20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgVHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+OyBMaW1v
bmNpZWxsbywgTWFyaW8gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+OyBrZXJuZWwtZGV2QGln
YWxpYS5jb207IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTdWJqZWN0OiBS
ZTogW1BBVENIXSBkcm0vYW1kZ3B1L2ZlbmNlOiBGaXggb29wcyBkdWUgdG8gbm9uLW1hdGNoaW5n
IGRybV9zY2hlZCBpbml0L2ZpbmkNCg0KT24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNDo1MSBQTSBH
dWlsaGVybWUgRy4gUGljY29saSA8Z3BpY2NvbGlAaWdhbGlhLmNvbT4gd3JvdGU6DQo+DQo+ICsg
THViZW4NCj4NCj4gKHNvcnJ5LCBtaXNzZWQgdGhhdCBpbiB0aGUgZmlyc3Qgc3VibWlzc2lvbiku
DQo+DQo+IE9uIDMwLzAxLzIwMjMgMTg6NDUsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0K
PiA+IEN1cnJlbnRseSBhbWRncHUgY2FsbHMgZHJtX3NjaGVkX2ZpbmkoKSBmcm9tIHRoZSBmZW5j
ZSBkcml2ZXIgc3cgDQo+ID4gZmluaSByb3V0aW5lIC0gc3VjaCBmdW5jdGlvbiBpcyBleHBlY3Rl
ZCB0byBiZSBjYWxsZWQgb25seSBhZnRlciB0aGUgDQo+ID4gcmVzcGVjdGl2ZSBpbml0IGZ1bmN0
aW9uIC0gZHJtX3NjaGVkX2luaXQoKSAtIHdhcyBleGVjdXRlZCBzdWNjZXNzZnVsbHkuDQo+ID4N
Cj4gPiBIYXBwZW5zIHRoYXQgd2UgZmFjZWQgYSBkcml2ZXIgcHJvYmUgZmFpbHVyZSBpbiB0aGUg
U3RlYW0gRGVjayANCj4gPiByZWNlbnRseSwgYW5kIHRoZSBmdW5jdGlvbiBkcm1fc2NoZWRfZmlu
aSgpIHdhcyBjYWxsZWQgZXZlbiB3aXRob3V0IA0KPiA+IGl0cyBjb3VudGVyLXBhcnQgaGFkIGJl
ZW4gcHJldmlvdXNseSBjYWxsZWQsIGNhdXNpbmcgdGhlIGZvbGxvd2luZyBvb3BzOg0KPiA+DQo+
ID4gYW1kZ3B1OiBwcm9iZSBvZiAwMDAwOjA0OjAwLjAgZmFpbGVkIHdpdGggZXJyb3IgLTExMA0K
PiA+IEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAw
MDAwMDAwMDA5MCBQR0QgDQo+ID4gMCBQNEQgMA0KPiA+IE9vcHM6IDAwMDIgWyMxXSBQUkVFTVBU
IFNNUCBOT1BUSQ0KPiA+IENQVTogMCBQSUQ6IDYwOSBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0
YWludGVkIDYuMi4wLXJjMy1ncGljY29saSANCj4gPiAjMzM4IEhhcmR3YXJlIG5hbWU6IFZhbHZl
IEp1cGl0ZXIvSnVwaXRlciwgQklPUyBGN0EwMTEzIDExLzA0LzIwMjINCj4gPiBSSVA6IDAwMTA6
ZHJtX3NjaGVkX2ZpbmkrMHg4NC8weGEwIFtncHVfc2NoZWRdIFsuLi5dIENhbGwgVHJhY2U6DQo+
ID4gIDxUQVNLPg0KPiA+ICBhbWRncHVfZmVuY2VfZHJpdmVyX3N3X2ZpbmkrMHhjOC8weGQwIFth
bWRncHVdDQo+ID4gIGFtZGdwdV9kZXZpY2VfZmluaV9zdysweDJiLzB4M2IwIFthbWRncHVdDQo+
ID4gIGFtZGdwdV9kcml2ZXJfcmVsZWFzZV9rbXMrMHgxNi8weDMwIFthbWRncHVdDQo+ID4gIGRl
dm1fZHJtX2Rldl9pbml0X3JlbGVhc2UrMHg0OS8weDcwDQo+ID4gIFsuLi5dDQo+ID4NCj4gPiBU
byBwcmV2ZW50IHRoYXQsIGNoZWNrIGlmIHRoZSBkcm1fc2NoZWQgd2FzIHByb3Blcmx5IGluaXRp
YWxpemVkIGZvciANCj4gPiBhIGdpdmVuIHJpbmcgYmVmb3JlIGNhbGxpbmcgaXRzIGZpbmkgY291
bnRlci1wYXJ0Lg0KPiA+DQo+ID4gTm90aWNlIGlkZWFsbHkgd2UnZCB1c2Ugc2NoZWQucmVhZHkg
Zm9yIHRoYXQ7IHN1Y2ggZmllbGQgaXMgc2V0IGFzIA0KPiA+IHRoZSBsYXRlc3QgdGhpbmcgb24g
ZHJtX3NjaGVkX2luaXQoKS4gQnV0IGFtZGdwdSBzZWVtcyB0byAib3ZlcnJpZGUiIA0KPiA+IHRo
ZSBtZWFuaW5nIG9mIHN1Y2ggZmllbGQgLSBpbiB0aGUgYWJvdmUgb29wcyBmb3IgZXhhbXBsZSwg
aXQgd2FzIGEgDQo+ID4gR0ZYIHJpbmcgY2F1c2luZyB0aGUgY3Jhc2gsIGFuZCB0aGUgc2NoZWQu
cmVhZHkgZmllbGQgd2FzIHNldCB0byANCj4gPiB0cnVlIGluIHRoZSByaW5nIGluaXQgcm91dGlu
ZSwgcmVnYXJkbGVzcyBvZiB0aGUgc3RhdGUgb2YgdGhlIERSTSBzY2hlZHVsZXIuIEhlbmNlLCB3
ZSBlbmRlZC11cCB1c2luZyBhbm90aGVyIHNjaGVkIGZpZWxkLg0KPiA+PiA+IEZpeGVzOiAwNjdm
NDRjOGI0NTkgKCJkcm0vYW1kZ3B1OiBhdm9pZCBvdmVyLWhhbmRsZSBvZiBmZW5jZSANCj4gPj4g
PiBkcml2ZXIgZmluaSBpbiBzMyB0ZXN0ICh2MikiKQ0KPiA+IENjOiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gPiBDYzogR3VjaHVuIENoZW4gPGd1Y2h1
bi5jaGVuQGFtZC5jb20+DQo+ID4gQ2M6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNp
ZWxsb0BhbWQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1aWxoZXJtZSBHLiBQaWNjb2xpIDxn
cGljY29saUBpZ2FsaWEuY29tPg0KPiA+IC0tLQ0KPiA+DQo+ID4NCj4gPiBIaSBmb2xrcywgZmly
c3Qgb2YgYWxsIHRoYW5rcyBpbiBhZHZhbmNlIGZvciByZXZpZXdzIC8gY29tbWVudHMhDQo+ID4g
Tm90aWNlIHRoYXQgSSd2ZSB1c2VkIHRoZSBGaXhlcyB0YWcgbW9yZSBpbiB0aGUgc2Vuc2UgdG8g
YnJpbmcgaXQgdG8gDQo+ID4gc3RhYmxlLCBJIGRpZG4ndCBmaW5kIGEgZ29vZCBwYXRjaCBjYW5k
aWRhdGUgdGhhdCBhZGRlZCB0aGUgY2FsbCB0byANCj4gPiBkcm1fc2NoZWRfZmluaSgpLCB3YXMg
cmVhY2hpbmcgd2F5IHRvbyBvbGQgY29tbWl0cy4uLnNvDQo+ID4gMDY3ZjQ0YzhiNDU5IHNlZW1z
IGEgZ29vZCBjYW5kaWRhdGUgLSBvciBtYXliZSBub3Q/DQo+ID4NCj4gPiBOb3csIHdpdGggcmVn
YXJkcyBzY2hlZC5yZWFkeSwgc3BlbnQgYSBiaXQgb2YgdGltZSB0byBmaWd1cmUgd2hhdCANCj4g
PiB3YXMgaGFwcGVuaW5nLi4ud291bGQgYmUgZmVhc2libGUgbWF5YmUgdG8gc3RvcCB1c2luZyB0
aGF0IHRvIG1hcmsgDQo+ID4gc29tZSBraW5kIHJpbmcgc3RhdHVzPyBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBhZGQgYSBmbGFnIA0KPiA+IHRvIHRoZSByaW5nIHN0cnVjdHVyZSBm
b3IgdGhhdCwgYW5kIGZyZWUgc2NoZWQucmVhZHkgZnJvbSBiZWluZyANCj4gPiBtYW5pcHVsYXRl
IGJ5IHRoZSBhbWRncHUgZHJpdmVyLCB3aGF0J3MgeW91ciB0aG91Z2h0cyBvbiB0aGF0Pw0KDQpJ
dCdzIGJlZW4gYSB3aGlsZSwgYnV0IElJUkMsIHdlIHVzZWQgdG8gaGF2ZSBhIHJpbmctPnJlYWR5
IGZpZWxkIGluIHRoZSBkcml2ZXIgd2hpY2ggYXQgc29tZSBwb2ludCBnb3QgbWlncmF0ZWQgb3V0
IG9mIHRoZSBkcml2ZXIgaW50byB0aGUgR1BVIHNjaGVkdWxlciBhbmQgdGhlIGRyaXZlciBzaWRl
IGNvZGUgbmV2ZXIgZ290IGNsZWFuZWQgdXAuICBJIHRoaW5rIHdlIHNob3VsZCBwcm9iYWJseSBq
dXN0IGRyb3AgdGhlIGRyaXZlciBtZXNzaW5nIHdpdGggdGhhdCBmaWVsZCBhbmQgbGVhdmUgaXQg
dXAgdG8gdGhlIGRybSBzY2hlZHVsZXIuDQoNCkFsZXgNCg0KDQo+ID4NCj4gPiBJIGNvdWxkIHRy
eSBteXNlbGYsIGJ1dCBmaXJzdCBvZiBjb3Vyc2UgSSdkIGxpa2UgdG8gcmFpc2UgdGhlIA0KPiA+
ICJ0ZW1wZXJhdHVyZSIgb24gdGhpcyB0b3BpYyBhbmQgY2hlY2sgaWYgc29tZWJvZHkgaXMgYWxy
ZWFkeSB3b3JraW5nIA0KPiA+IG9uIHRoYXQuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiBH
dWlsaGVybWUNCj4gPg0KPiA+DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9mZW5jZS5jIHwgOCArKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZmVuY2UuYw0KPiA+IGluZGV4IDAwNDQ0MjAzMjIwZC4uZTE1NGViODI0MWZi
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5j
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMN
Cj4gPiBAQCAtNjE4LDcgKzYxOCwxMyBAQCB2b2lkIGFtZGdwdV9mZW5jZV9kcml2ZXJfc3dfZmlu
aShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gPiAgICAgICAgICAgICAgIGlmICghcmlu
ZyB8fCAhcmluZy0+ZmVuY2VfZHJ2LmluaXRpYWxpemVkKQ0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgaWYgKCFyaW5nLT5ub19zY2hl
ZHVsZXIpDQo+ID4gKyAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICogTm90aWNl
IHdlIGNoZWNrIGZvciBzY2hlZC5uYW1lIHNpbmNlIHRoZXJlJ3Mgc29tZQ0KPiA+ICsgICAgICAg
ICAgICAgICogb3ZlcnJpZGUgb24gdGhlIG1lYW5pbmcgb2Ygc2NoZWQucmVhZHkgYnkgYW1kZ3B1
Lg0KPiA+ICsgICAgICAgICAgICAgICogVGhlIG5hdHVyYWwgY2hlY2sgd291bGQgYmUgc2NoZWQu
cmVhZHksIHdoaWNoIGlzDQo+ID4gKyAgICAgICAgICAgICAgKiBzZXQgYXMgZHJtX3NjaGVkX2lu
aXQoKSBmaW5pc2hlcy4uLg0KPiA+ICsgICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAg
ICBpZiAoIXJpbmctPm5vX3NjaGVkdWxlciAmJiByaW5nLT5zY2hlZC5uYW1lKQ0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fc2NoZWRfZmluaSgmcmluZy0+c2NoZWQpOw0KPiA+DQo+ID4g
ICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDw9IHJpbmctPmZlbmNlX2Rydi5udW1fZmVuY2Vz
X21hc2s7ICsraikNCg==
