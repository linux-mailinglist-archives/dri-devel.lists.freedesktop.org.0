Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DEAE68D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836310E02F;
	Tue, 24 Jun 2025 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PG4Z4ktX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8649C10E02F;
 Tue, 24 Jun 2025 14:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJZHawfM/u3Yz8VEAcXh2qtAy6lG/EDL8Epf/FUcEhHF9FD00ebvrUz5HaMJjVPTzYEIADzl+WPQNEdqvu9wuxeKoAshsMYuJghuNFCnujK7Qh9+sal4R+WMQnzd3wlXaUiNz4E0dKq+JA0+1QLNJmBsTy9GAlXTbPlcmnGLSeZvSZNLFVfLtiQLh8OIFQHBDlZSoWjzji/Fvl8dZq2oNYuVDSKAobEy8X+8Gy8Rws1/JCdw/wlh3KK0C1PaE+gLLiyrO1B2ywncjYTsWHwwjizYK65MCwxVfkK1D7bcKHJi3gi/Nj3nyrOUYRVNcpksf2LxUdJoKEHbUxCHHm9+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/04KFZDeFn0wgQOHkab8R2Bjh6fkBUFklNOoSXSqlbA=;
 b=d6ejIJsuqqLkA7y0JvhTQbT4Dmn3vZ6/+oNhDC+2WDVl9H9E6aS7t48YZ9PkPtghxSBuj0+c7GtiqJQazyJxDV2VTn4+u+yik0Sk3Ue38rCCUDJE+2Fdj5JBh0VF3iAYpZZucAP5XL81E1rz2Ib9ZaVZOJG8+fRr1FWr5C9zIFBXrB9Y5sjuHjN9iIgGjCcmnWMdN6+7UeV50Yu6dYxnG0wFwWcWcPFFiYr2ijXLz1T796uUHqMt+ZKNDnFKV4S7ogNdJCYIvNnEpD2sMmwHZB9lA2CA/7vkbe4upeRGJW0dcqxO9IH7IHhThUYYjKwew/9tTZ70Qp1ObRQeJFOjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/04KFZDeFn0wgQOHkab8R2Bjh6fkBUFklNOoSXSqlbA=;
 b=PG4Z4ktXZ84CZHXPLifFoBGOTEWNI5tjtNAIERkfty5jjCc8OnvIcrJN8ZDEbqqsgd5HirT2yyd74hfjUNM8q8s8oXGnZJHQnuJ/FsNb4Cojb3kJAtBmVHARL84N+iYUbFqAufmfUNzdxcrI4ZjETsGikWXYnKGBu8t22RsTeBU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH1PR12MB9645.namprd12.prod.outlook.com (2603:10b6:610:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 14:33:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:33:27 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Werner Sembach <wse@tuxedocomputers.com>, Rodrigo Siqueira
 <siqueira@igalia.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hung, Alex"
 <Alex.Hung@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
Subject: Re: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
Thread-Topic: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type
 on some TUXEDO devices
Thread-Index: AQHb5HL5Z9IsMEQZxkCnf62661NCV7QRzMrMgAAAq4CAAEO8gIAAT80A
Date: Tue, 24 Jun 2025 14:33:27 +0000
Message-ID: <d9b65672-07e0-40ba-a882-1db59cb7ad3c@amd.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
 <20250409163029.130651-2-wse@tuxedocomputers.com>
 <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
 <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
 <8c048899-e307-4229-8165-fa70d001176e@amd.com>
 <293be5bc-11ad-49b8-a549-864ce4016f14@tuxedocomputers.com>
 <2de286af-fcfe-414c-b951-384e1acae89f@amd.com>
 <f551abbd-b901-4779-9bd9-c87981690460@tuxedocomputers.com>
In-Reply-To: <f551abbd-b901-4779-9bd9-c87981690460@tuxedocomputers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH1PR12MB9645:EE_
x-ms-office365-filtering-correlation-id: e3fc27ca-d0f4-426b-bd30-08ddb32c1528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enJZRXVSbHlzY0l6dmdoZ3pKV3pLWXc5MXN0T2JOcnNhZVRHb3Z0dGFiT2NK?=
 =?utf-8?B?VVlkV2QzN0dEY3BRTXpic1FUM3NDem1GSE9MUU96S296TlZEOFpjMG5mcXFa?=
 =?utf-8?B?bzFFVjk2UnFqaStwbHo5elc3MXhnMHVNbGJjVWJlU0JhUFVVZU9LZTJMRXJK?=
 =?utf-8?B?TDZnR2grVWFCSXExU1JEc0daZG5Lemx4OXE1TXlWVTJPbnR5bVN1R2hmY0xh?=
 =?utf-8?B?c20vSTNiRWNFZDBwek92dFVlSWM5V052VjJXTWdrOWZ4YnViSGRvNWh0Q2R3?=
 =?utf-8?B?Zk9XektETjBWMTdNcnpMOTJ2K0lLMjN6clZMNlNPMDhvUEhML3JBbCtvOVNE?=
 =?utf-8?B?QkZNSnBBNnpIZG4wL2pWaldjWitnQWVTQlUraTVtS2JKejR2QWQ4dytxTDBa?=
 =?utf-8?B?c2s4enBGR3Zjdk13L1JoK01CZHYxNEMwR1lRN2dtS2o2VzVqNDQySEpKVEVo?=
 =?utf-8?B?ZStXdkd3VXhBMC9TOGRvK1U4SThQbXBvVmRjLzE4ZDM3OTlZNkxQbVVMbDJN?=
 =?utf-8?B?RjhLaVE3UGVGVVNUQ2ErZktyYnhBcTgzcE9RSlp5dkJ1TDhhSHlzLytRRUgx?=
 =?utf-8?B?YnVaUlBnY2JndENpMmd1bnZEN2hVOU1aempBT1dCYTZIWnBPT0NXemNIR3dv?=
 =?utf-8?B?Ris4a3gzeFl5WFNycTJRUE44emkwUjlhdFFaNFAwcWFDd3h0N091TzdKblhU?=
 =?utf-8?B?ZlEzM1dDdEFwUXliMXBEc05PSlFqTmtabnR2a0hRR2FUNVloSTZTc1NsWGVk?=
 =?utf-8?B?dlZRb3E1OGdLaGFuSWthZ0JNUTFwUVB3ZGFLSzV0L2cwTThKc24vcjJjTEYz?=
 =?utf-8?B?dHNHYnlLcndKRFNIWXZPNHZoaDQ0eUh6UTZzRVhzU09Td3ZvN0hUaDZ0Y2Zv?=
 =?utf-8?B?M3MrVXc1VWRnNTZmd09TS3ZTekVlaS96SWpFVVdvVGlWUWRINUxhd0ZiT3Zs?=
 =?utf-8?B?TDF1dXZ4NmdLVDRMQ2RLSkg1d2VDM21iTTF6UnVyQ0Y5NHZQdXpVWFA5eXN4?=
 =?utf-8?B?bTFRTVJYZFRFNlc0M3pqNGVmYVVOYUFYOG40UW13SEFxUnh1R0loakdnQVhK?=
 =?utf-8?B?TWhIWVU0bkJpbEppWVJhVERzRkFqZkZhR2tQdC9jWkxnUmIwcmt1M2FzN0Jv?=
 =?utf-8?B?WFRSUm14bmpqeENVQlRWSGZtY0QwOFNJZ0ZuREFGODZIbUtjU1VmWnBGbVRI?=
 =?utf-8?B?T2NEdUo3Z1lTT0ZhY05lTU4xNFgxMlZnZjkxTnUxelJHSkNmWnczTTBrU0dJ?=
 =?utf-8?B?Y0pOOC83YU0zRWhvc2wrbXBkenMyTmNTWFdIbWR3WEVrMldaNkFTa3ZsMVFy?=
 =?utf-8?B?SzR4aDBJTnREUDlxS2t2ckJzdDBKbHA4dllkVCtMUUk0cmdUZXBUS0VLVDFX?=
 =?utf-8?B?WVlIb1VtVDV2d1AzaW9ZenR3YXNldStMZ3pocFhqVWhUNGRhNzQxbVlidVVM?=
 =?utf-8?B?ZW1SRGhLc0dEbElOcDNueThBcUJoSUx6YklYLy9KTzduMit4YnlQMEkzY0F0?=
 =?utf-8?B?UWNGQStsY0N3UDJPYzAyZkhaRjVhWnhSZFVoSytyUDQxUGhRbVBYUmloWm5Z?=
 =?utf-8?B?cm9kWkwxdTJQbGR0OXlyZzcyNnNPWFVVSm8vOWdXaEU1Z1BLZHRWRWpoUGU1?=
 =?utf-8?B?MlZYNC8wMU5NRVFyZ09ZZDQrTTljYTZoTzJDL0ZYaE81YklpUUVmQldmSlBZ?=
 =?utf-8?B?akxBdy9PcEVYUWNvRVh1M3dseThiU1ArU3p3NkUxcXA0eGh4Smc4dENsWDJr?=
 =?utf-8?B?dzQ4YmpUb2JYZHJvdERERmF5NmgwZWJRdm4vWWR5c2dqV1BiOS9UblFWazNC?=
 =?utf-8?B?MWxvYXFTaWtMV2k5VjlNYTJxN2FmRmpGVHRWKzRhSU1YaU5zOVJmVWZuN3oy?=
 =?utf-8?B?dHdhWElDNFBkR3B3N21uV05jSnVTQnVKVXEzd0Q4Q2ZuRkdmZ1FKVFdoZmlu?=
 =?utf-8?B?SzZ3cU5XRFJuUnNNUEZBQm9uWXU4NDBmZlRzM0RZT1NTaGF5alpHd2htN2xu?=
 =?utf-8?Q?sypX2VxfbEi5FRq+DxsJUvLR+FZOoY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkJTeGpOSU14ZHA0bGhRTkpwMTYyMkIvdC9IeVo4d2VKaHRRMWpaRG1Sd0dF?=
 =?utf-8?B?dHlKMEhRZW80ZkxGODlwRmQrNDZ0WTZCU054ZVJaSng1V1BaMzRoWmVpUVRU?=
 =?utf-8?B?ekF1NHZ0cXFod1U1ZXh3U3lGdkcvaHR2SkNhdm9sNDhWNWxWUFBpZW05Y29y?=
 =?utf-8?B?RUkxUkE0ak95T2ZPL2UvdkxSWTFqbGI4M28xSGx4NEYvdU96K2NuV0FUY3dL?=
 =?utf-8?B?S2dCSEJkWlExREduLzNKVnpRMXl4ZnJPQTdadUpQZDdCWGRrNzdnVzVCRWxq?=
 =?utf-8?B?aDlsV3RsdHRsbHhadDQ2cXI3dS9oVzZudkNyZkJ6V0h3ZnJKbndyMlJLR2dy?=
 =?utf-8?B?dmVVT05wT2FIVDFLakEyQ2FBNWFGeWp5RnZ2VGlFdWtqS1h3ZDdWbFdCd1lh?=
 =?utf-8?B?TnhKWEUra0xyM2JEN1ZFMWdDWlRNN1I3TFJ0U1JJeFVNU3JiTmVuSy9DdmJG?=
 =?utf-8?B?Qzh4Y3Z3QTBTMlpnZmhHZ1BnSllUSkNzejFTbkh3SFJFQWhHNlMzNnNCN2lZ?=
 =?utf-8?B?OVNaN2hnSDkvNElnYVRoQng3OHphdHZDVStOb2g5LzBEVk15U2EyaHE3RVFm?=
 =?utf-8?B?MFFqZGRKWUJrZXNBV3dXdVlPYWxkWVBIZ20vTGRGMmNZaTk0ZHFLbmhqeHdh?=
 =?utf-8?B?VkJuVlZqUktXK1hjR3ozSXlualBJWUJFS3RHTTNjWUdDWUFlaXRpWjBHb0p6?=
 =?utf-8?B?Wk1TWVpuRnA0d1pBUE9td3MzdW9xZ1ArZVZ6a0ZEbm1PQXltcHVWU3B4UkRU?=
 =?utf-8?B?dVVveTQ1N01TYVE0NWlIMUJLelNKcWVHaE1HTVVKcjZVZHp4Z1piRHhRYmc1?=
 =?utf-8?B?QVJYcDBJUThJMlpMMEFmWUVBT3d0QlYrQ01DZWFBZEozN1FXRXpLSDcyRTNI?=
 =?utf-8?B?Y3A2NStaR1F4RWs3SFV5S1RMM1NmMTRLVERmbW1DTDJldUI2aUJSYmlrVVAw?=
 =?utf-8?B?Q21uNEtqRHpNRzhtY1FmUEppcHZVaGlvMzRmS1BacWhlSy9IdHRERHpKY3gr?=
 =?utf-8?B?ek5WTlhWUURXeEI5VC9XNDMwNWxtODZ3ejhrMndEQUpMVTVuaEVjOTRYakJO?=
 =?utf-8?B?RWRLWnpxSlhaNncrMzBONG5BWnV2QzNkbUtYdXpVOVFmc2ZJamI0bnlJdlgz?=
 =?utf-8?B?Z2dyZG84UVk2dk9kMklXektxU010MXFuUzVWYnZ4eU0vWlB1a212QW96S2xw?=
 =?utf-8?B?Vnl0QUpOQTg2YlNSSmd4UUVVbjlYWHIwUFE0LytPVFFmVGQzWkU3RUFKVUhW?=
 =?utf-8?B?d2FhZlBMNlphN2NsNG1rRUNFai8xREg2OTFKOXkwbXJGNkNJUnRaemlXbWw2?=
 =?utf-8?B?N3hocTJ5VGhvbmhPRzR1ekR6QjFUQnBFUTE4SGdlaUJ6a1ZKc3VVL2FqcDY1?=
 =?utf-8?B?YytwTk55V1MvZnRDVjB1SGNHUy9UMCt2alk2Y3BUc2JmQk5kcjhEa29SV3Fh?=
 =?utf-8?B?U09hdGloTTVQNmREQk93Ujl5SG91Mmt5Vk9MVjdxZTMvZHB6Z0hXcnMrdjRj?=
 =?utf-8?B?YXZJclAzRTIxRFB6NVl4NVpicDlMYU1rODFwVmJQL2dTVjlmMy9hWGV5ZktF?=
 =?utf-8?B?dkZXNkw0SzZhSFhpL1hTa0NYQnlBWVlEWnpxTEVmY3FWdktGdkdEei83dXMy?=
 =?utf-8?B?d0YySEtOMEtIaUd6NEpwY1NBamtyaWZlM09WYkFaL2NLd2hKUEdsRjdmeXVD?=
 =?utf-8?B?VTVMZTZ6Tzh2ajV6YTk5bDNJejRuSzdNd2JIMGRWOFZQMVMxdURqWFdLNXlX?=
 =?utf-8?B?N2d3aGwrcmlKWlg5V0h1V0tXTEJOUmFmWmxkN0ViYkpzekNKSGpnSUJMNTU4?=
 =?utf-8?B?L2RyZ3JoQVNUZndkNm1VYTREMjRDRkR6MUlxOEdxNEE1YVBiNFdITjZJWlJq?=
 =?utf-8?B?eUVFUTdHLzdTS25rZ05tMW1GYk9qaXd2SlhtZ3Z6N21mdVBYU1o5WU43SmlZ?=
 =?utf-8?B?L29rTWRvN0RIdTRuQmZaQWhJQXlZVG4yYy85OFFLRUowTElMdnMzREZZNlo0?=
 =?utf-8?B?RUZXNlZMK2U3WHNyaVpnK0EvMjVrNkZKMVhHOUdJU2F6eFNFNzI3cjF5T09x?=
 =?utf-8?B?Vm1MbjhPV0hLZG9nUFpUK1VhMUx3bDN1ZjMzbDA2RHZBNUwxMDlEeVBqbVJR?=
 =?utf-8?Q?QnAk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26AD88F625644F449FE2B4BFAC207B78@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fc27ca-d0f4-426b-bd30-08ddb32c1528
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 14:33:27.1155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWZXV/YDlcJvSGQDhFqBTZVirsTVn7MWQ6HcEbdZBVhchj/7062JXsGMFOBhmNzp8Fqu8S5zbpz/h39Tbeizeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9645
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

T24gNi8yNC8yNSA0OjQ3IEFNLCBXZXJuZXIgU2VtYmFjaCB3cm90ZToNCj4gDQo+IEFtIDI0LjA2
LjI1IHVtIDA3OjQ1IHNjaHJpZWIgTWFyaW8gTGltb25jaWVsbG86DQo+PiBPbiA2LzI0LzIwMjUg
MTI6NDIgQU0sIFdlcm5lciBTZW1iYWNoIHdyb3RlOg0KPj4+IEhpIE1hcmlvLA0KPj4+DQo+Pj4g
QW0gMjMuMDYuMjUgdW0gMjE6NDIgc2NocmllYiBMaW1vbmNpZWxsbywgTWFyaW86DQo+Pj4+IE9u
IDYvMjMvMjUgMjoxMyBQTSwgUm9kcmlnbyBTaXF1ZWlyYSB3cm90ZToNCj4+Pj4+IE9uIDA2LzIz
LCBXZXJuZXIgU2VtYmFjaCB3cm90ZToNCj4+Pj4+PiBnZW50bGUgYnVtcA0KPj4+Pj4+DQo+Pj4+
Pj4gQW0gMDkuMDQuMjUgdW0gMTg6Mjcgc2NocmllYiBXZXJuZXIgU2VtYmFjaDoNCj4+Pj4+Pj4g
VGhlIGRpc3BsYXkgYmFja2xpZ2h0IG9uIFRVWEVETyBQb2xhcmlzIEFNRCBHZW4yIGFuZCBHZW4z
IHdpdGggDQo+Pj4+Pj4+IHBhbmVscw0KPj4+Pj4+PiBCT0UgMjQyMCBhbmQgQk9FIDI0MjMgbXVz
dCBiZSBmb3JjZWQgdG8gcHduIGNvbnRyb2xsZWQgdG8gYmUgYWJsZSB0bw0KPj4+Pj4+PiBjb250
cm9sIHRoZSBicmlnaHRuZXNzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGlzIGNvdWxkIGFscmVhZHkg
YmUgYXJjaGl2ZWQgdmlhIGEgbW9kdWxlIHBhcmFtZXRlciwgYnV0IHRoaXMgDQo+Pj4+Pj4+IHBh
dGNoIGFkZHMNCj4+Pj4+Pj4gYSBxdWlyayB0byBhcHBseSB0aGlzIGJ5IGRlZmF1bHQgb24gdGhl
IG1lbnRpb25lZCBkZXZpY2UgKyBwYW5lbA0KPj4+Pj4+PiBjb21iaW5hdGlvbnMuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0
ZXJzLmNvbT4NCj4+Pj4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4+Pj4+Pj4gLS0t
DQo+Pj4+Pj4+IMKgwqDCoCAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCAzMiArKysrKysrKysrIA0KPj4+Pj4+PiArKyArKysrKystDQo+Pj4+Pj4+IMKgwqDC
oCAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4+
Pg0KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiLyANCj4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+Pj4+PiBpbmRleCAzOWRmNDVmNjUyYjMyLi4yYmFk
NjI3NGFkOGZmIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+Pj4+Pj4gQEAgLTE2MjUsMTEgKzE2
MjUsMTMgQEAgc3RhdGljIGJvb2wgDQo+Pj4+Pj4+IGRtX3Nob3VsZF9kaXNhYmxlX3N0dXR0ZXIo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4+IMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2RtX3F1
aXJrcyB7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGJvb2wgYXV4X2hwZF9kaXNjb247DQo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgIGJvb2wgc3VwcG9ydF9lZHAwX29uX2RwMTsNCj4+Pj4+Pj4gK8Kg
wqDCoCBib29sIGJvZV8yNDIwXzI0MjNfYmxfZm9yY2VfcHdtOw0KPj4+Pj4+PiDCoMKgwqAgfTsN
Cj4+Pj4+Pj4gwqDCoMKgIHN0YXRpYyBzdHJ1Y3QgYW1kZ3B1X2RtX3F1aXJrcyBxdWlya19lbnRy
aWVzID0gew0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAuYXV4X2hwZF9kaXNjb24gPSBmYWxzZSwN
Cj4+Pj4+Pj4gLcKgwqDCoCAuc3VwcG9ydF9lZHAwX29uX2RwMSA9IGZhbHNlDQo+Pj4+Pj4+ICvC
oMKgwqAgLnN1cHBvcnRfZWRwMF9vbl9kcDEgPSBmYWxzZSwNCj4+Pj4+Pj4gK8KgwqDCoCAuYm9l
XzI0MjBfMjQyM19ibF9mb3JjZV9wd20gPSBmYWxzZQ0KPj4+Pj4+PiDCoMKgwqAgfTsNCj4+Pj4+
Pj4gwqDCoMKgIHN0YXRpYyBpbnQgZWRwMF9vbl9kcDFfY2FsbGJhY2soY29uc3Qgc3RydWN0IGRt
aV9zeXN0ZW1faWQgKmlkKQ0KPj4+Pj4+PiBAQCAtMTY0NCw2ICsxNjQ2LDEyIEBAIHN0YXRpYyBp
bnQgYXV4X2hwZF9kaXNjb25fY2FsbGJhY2soY29uc3QgDQo+Pj4+Pj4+IHN0cnVjdCBkbWlfc3lz
dGVtX2lkICppZCkNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4+IMKg
wqDCoCB9DQo+Pj4+Pj4+ICtzdGF0aWMgaW50IGJvZV8yNDIwXzI0MjNfYmxfZm9yY2VfcHdtX2Nh
bGxiYWNrKGNvbnN0IHN0cnVjdCANCj4+Pj4+Pj4gZG1pX3N5c3RlbV9pZCAqaWQpDQo+Pj4+Pj4+
ICt7DQo+Pj4+Pj4+ICvCoMKgwqAgcXVpcmtfZW50cmllcy5ib2VfMjQyMF8yNDIzX2JsX2ZvcmNl
X3B3bSA9IHRydWU7DQo+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4+ICt9DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gwqDCoMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBk
bWlfcXVpcmtfdGFibGVbXSA9IHsNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgew0KPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jYWxsYmFjayA9IGF1eF9ocGRfZGlzY29uX2NhbGxiYWNr
LA0KPj4+Pj4+PiBAQCAtMTcyMiw2ICsxNzMwLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1p
X3N5c3RlbV9pZCANCj4+Pj4+Pj4gZG1pX3F1aXJrX3RhYmxlW10gPSB7DQo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIkhQ
IEVsaXRlQm9vayA2NjUgMTYgDQo+Pj4+Pj4+IGluY2ggRzExIE5vdGVib29rIFBDIiksDQo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfSwN
Cj4+Pj4+Pj4gK8KgwqDCoCB7DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvLyBUVVhFRE8gUG9s
YXJpcyBBTUQgR2VuMg0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmNhbGxiYWNrID0gYm9lXzI0
MjBfMjQyM19ibF9mb3JjZV9wd21fY2FsbGJhY2ssDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAu
bWF0Y2hlcyA9IHsNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1JX01BVENIKERN
SV9CT0FSRF9OQU1FLCAiR014Tkd4eCIpLA0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+
Pj4+Pj4gK8KgwqDCoCB9LA0KPj4+Pj4+PiArwqDCoMKgIHsNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIC8vIFRVWEVETyBQb2xhcmlzIEFNRCBHZW4zDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAu
Y2FsbGJhY2sgPSBib2VfMjQyMF8yNDIzX2JsX2ZvcmNlX3B3bV9jYWxsYmFjaywNCj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIC5tYXRjaGVzID0gew0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJHTXhaR3h4IiksDQo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCB9LA0KPj4+Pj4+PiArwqDCoMKgIH0sDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IHt9DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC8qIFRPRE86IHJlZmFjdG9yIHRoaXMgZnJvbSBh
IGZpeGVkIHRhYmxlIHRvIGEgZHluYW1pYyANCj4+Pj4+Pj4gb3B0aW9uICovDQo+Pj4+Pj4+IMKg
wqDCoCB9Ow0KPj4+Pj4+PiBAQCAtMzU4Niw2ICszNjA4LDcgQEAgc3RhdGljIHZvaWQgDQo+Pj4+
Pj4+IHVwZGF0ZV9jb25uZWN0b3JfZXh0X2NhcHMoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KmFjb25uZWN0b3IpDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2Ow0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2x1bWluYW5jZV9yYW5n
ZV9pbmZvICpsdW1pbmFuY2VfcmFuZ2U7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGludCBtaW5f
aW5wdXRfc2lnbmFsX292ZXJyaWRlOw0KPj4+Pj4+PiArwqDCoMKgIHUzMiBwYW5lbDsNCj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGFjb25uZWN0b3ItPmJsX2lkeCA9PSAtMSB8fA0KPj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjb25uZWN0b3ItPmRjX2xpbmstPmNvbm5lY3Rvcl9z
aWduYWwgIT0gDQo+Pj4+Pj4+IFNJR05BTF9UWVBFX0VEUCkNCj4+Pj4+Pj4gQEAgLTM2MTAsNiAr
MzYzMywxMyBAQCBzdGF0aWMgdm9pZCANCj4+Pj4+Pj4gdXBkYXRlX2Nvbm5lY3Rvcl9leHRfY2Fw
cyhzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcikNCj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXBzLT5hdXhfc3VwcG9ydCA9IGZhbHNlOw0KPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCBlbHNlIGlmIChhbWRncHVfYmFja2xpZ2h0ID09IDEpDQo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2Fwcy0+YXV4X3N1cHBvcnQgPSB0cnVlOw0KPj4+Pj4+PiArwqDC
oMKgIGVsc2UgaWYgKGFtZGdwdV9iYWNrbGlnaHQgPT0gLTEgJiYNCj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgcXVpcmtfZW50cmllcy5ib2VfMjQyMF8yNDIzX2JsX2ZvcmNlX3B3bSkgew0KPj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcGFuZWwgPSBkcm1fZWRpZF9nZXRfcGFuZWxfaWQoYWNvbm5l
Y3Rvci0+ZHJtX2VkaWQpOw0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHBhbmVsID09IGRy
bV9lZGlkX2VuY29kZV9wYW5lbF9pZCgnQicsICdPJywgJ0UnLCANCj4+Pj4+Pj4gMHgwOTc0KSB8
fA0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYW5lbCA9PSBkcm1fZWRpZF9lbmNv
ZGVfcGFuZWxfaWQoJ0InLCAnTycsICdFJywgDQo+Pj4+Pj4+IDB4MDk3NykpDQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcHMtPmF1eF9zdXBwb3J0ID0gZmFsc2U7DQo+Pj4+Pj4+
ICvCoMKgwqAgfQ0KPj4+Pj4gSXQgbGd0bSwNCj4+Pj4+DQo+Pj4+PiBBZGRpdGlvbmFsbHksIEkg
YmVsaWV2ZSB0aGlzIGlzIHNhZmUgdG8gbWVyZ2Ugc2luY2UgaXQgb25seSBhZmZlY3RzIGENCj4+
Pj4+IHNwZWNpZmljIGRldmljZS4gUGVyaGFwcyBkaXNwbGF5IGZvbGtzIHdvdWxkIGxpa2UgdG8g
aW5jbHVkZSB0aGlzIGFzDQo+Pj4+PiBwYXJ0IG9mIHRoaXMgd2VlaydzIHByb21vdGlvbj8gQW55
d2F5LCBDYyBvdGhlciBkZXZzIGZyb20gdGhlIGRpc3BsYXkuDQo+Pj4+Pg0KPj4+Pj4gUmV2aWV3
ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHNpcXVlaXJhQGlnYWxpYS5jb20+DQo+Pj4+IFRoYXQn
cyBhIGJpdCBvZGQgdGhhdCBhdXggYmFzZWQgQi9MIGNvbnRyb2wgd291bGRuJ3Qgd29yay4gQXJl
IHRoZXNlDQo+Pj4+IGJvdGggT0xFRCBwYW5lbHM/wqAgV2hhdCBkZWJ1Z2dpbmcgaGF2ZSB5b3Ug
ZG9uZSB0aHVzIGZhciB3aXRoIHRoZW0/DQo+Pj4+IFdoYXQga2VybmVsIGJhc2U/DQo+Pj4+DQo+
Pj4+IENvdWxkIHlvdSByZXBybyBvbiA2LjE2LXJjMz8NCj4+Pg0KPj4+IFNhZGx5IG91ciBhcmNo
aXZlIGlzIG1pc3NpbmcgdGhpcyBwYW5lbCArIGRldmljZSBjb21iaW5hdGlvbi4gVGhpcyANCj4+
PiBwYXRjaCBpcyBiYXNlZCBvbiBvdXIgaW5zdGFsbCBzY3JpcHQgdGhhdCBzZXRzIHRoaXMgZml4
IHZpYSBib290IA0KPj4+IHBhcmFtZXRlcnMgc2luY2UgdGhlIHJlbGVhc2Ugb2YgdGhlc2UgZGV2
aWNlcy4NCj4+Pg0KPj4+IFNvIHRoZSBxdWlyayBpcyBmaWVsZCBwcm92ZW4sIGJ1dCBJIGNhbid0
IGFjdGl2ZWx5IHRlc3QgaXQgYW55bW9yZS4NCj4+Pg0KPj4+IEJlc3QgcmVnYXJkcywNCj4+Pg0K
Pj4+IFdlcm5lcg0KPj4+DQo+Pg0KPj4gRG8geW91IHJlY2FsbCB3aGF0IGtlcm5lbCB2ZXJzaW9u
IHlvdSB3ZXJlIGRvaW5nIGl0IHdpdGg/wqAgSSdtIGp1c3QgDQo+PiB3b25kZXJpbmcgaWYgQVVY
IGJyaWdodG5lc3MgY29udHJvbCBoYWQgYSBidWcgd2l0aCBzdWNoIGEga2VybmVsLg0KPiBXZSBz
aGlwcGVkIHRoZSBkZXZpY2UgaW4gMjAyMSB3aXRoIFVidW50dSBmb2NhbCwgc28gdGhlIGtlcm5l
bCBwcm9iYWJseSANCj4gd2FzIDUuOCBvciA1LjExIChpbiB0aGVvcnkgaXQgYWxzbyBjb3VsZCBo
YXZlIGJlZW4gNS40IG9yIHdoYXRldmVyIHRoZSANCj4gVWJ1bnR1IE9FTSBrZXJuZWwgd2FzIGF0
IHRoYXQgdGltZSkuDQoNCklmIGl0IHdhcyA1LjQgdGhlbiB0aGF0IGRpZG4ndCB5ZXQgaGF2ZSBP
TEVEIGJhY2tsaWdodCBjb250cm9sIHN1cHBvcnQuIA0KSXQgd2FzIGZpcnN0IGludHJvZHVjZWQg
aGVyZToNCg0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC85NDU2Mjgx
MDFiZTU1ODMzYTYzMzU1NTEwZDRiNmM5MzQxODNkZWFiDQoNClRoZW4gZXZlbiBhcyByZWNlbnQg
YXMgNS4xMiBJIHNlZSB0aGF0IHRoZXJlIHdhcyBhIG1vZHVsZSBwYXJhbWV0ZXIgZm9yIA0KcHJv
YmxlbXMuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvN2E0NmYw
NWU1ZTE2M2MwMGU0MTg5MmU2NzEyOTQyODZlNTNmZTE1Yw0KDQpCdXQgdGhlbiB0aGVyZSB3ZXJl
IGFsc28gY2hhbmdlcyBmb3IgYXV4IGNvbnRyb2wgdXNpbmcgdGhlIGNvcnJlY3QgREMgDQpBUEkg
aW4gNS4xMiB0b286DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQv
MGFkM2U2NGViNDZkOGM0N2RlM2FmNTUyZTI4Mjg5NGUzODkzZTk3Mw0KDQo+Pg0KPj4gRG8geW91
IGhhdmUgdGhpcyBwYW5lbCBvbiBzb21lIG90aGVyIGhhcmR3YXJlIHBlcmhhcHM/IA0KPiBQcm9i
YWJseSBub3QuIEkgd2lsbCBhc2sgaG93ZXZlci4NCj4+IE9yIGNvdWxkIHlvdSBzZW5kIGEgY2Fs
bCBvdXQgdG8gZ2V0IHNvbWUgdGVzdGluZyBkb25lPw0KPiANCj4gQW4gaWRlYSBJIGFsc28gaGFk
IGluIHRoZSBwYXN0IHRvIHBsdWcgdGhpcyBhbmQgc2ltaWxhciBob2xlcyBpbiB5b3VyIA0KPiBh
cmNoaXZlLCBidXQgbm8gInByb2Nlc3MiIGZvciB0aGlzIGluIHBsYWNlIHlldC4NCg0KSSdtIHNv
cnJ5IGJ1dCBJJ20gbm90IGNvbWZvcnRhYmxlIHBpY2tpbmcgdXAgdGhpcyB0ZWNobmljYWwgZGVi
dCB0aGF0IA0Kd2lsbCBuZXZlciBiZSByZW1vdmFibGUgdXBzdHJlYW0gd2l0aG91dCBwcm9wZXIg
ZGVidWdnaW5nIG9uIHdoYXQgdGhlIA0KInJlYWwiIHByb2JsZW0gaXMuDQoNClJlY2VudGx5IEkg
aGF2ZSBiZWVuIHdvcmtpbmcgb24gY2hhbmdlcyB0byBicmlnaHRuZXNzIGNvbnRyb2wgaW4gDQph
bWRncHVfZG0gYW5kIHBlcnNvbmFsbHkgdmFsaWRhdGVkIGl0IHdvcmtpbmcgcHJvcGVybHkgb24g
cGFuZWxzIHRoYXQgDQp1c2UgYXV4IGNvbnRyb2wgZm9yIGJyaWdodG5lc3MgdGhpcyBwYXN0IGtl
cm5lbCBjeWNsZSBvciB0d28uDQoNClNvIHBsZWFzZSBoZWxwIHRyYWNrIGRvd24gb25lIG9mIHRo
ZXNlIHBhbmVscywgZWl0aGVyIGZyb20geW91IGd1eXMgb24gDQphbm90aGVyIHN5c3RlbSwgb3Ig
YSBjYWxsIHRvIHVzZXJzIHdpdGggdGhlc2Ugc3lzdGVtcyB0byBoZWxwLg0K
