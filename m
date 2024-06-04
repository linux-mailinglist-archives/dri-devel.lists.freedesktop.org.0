Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93B8FBBAB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 20:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EBE10E5B6;
	Tue,  4 Jun 2024 18:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wi2XY0iM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04FF10E5B6;
 Tue,  4 Jun 2024 18:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBuLO0UzDk7MpHVITyWGAQ0O7KBlECsVbVB3bTDpEF324/JlEOmGS3hNVG++fLJx7kK3te/vsJqn9FFq7n97Kth0F6PgQD4APNujcMCknx5AYIjfy9AUZF7aOQN6D7GfNKjjmwcBJDXpfX+blv7q6Zb74PeVMErqvS2T/kZbFNOT68vbkaX8eyiTJTdvqKpMDrmrR1sbqC6m050ZeQiJbnKHIS0hFzub8kHPjFl3k/VFkwYE3CM8b9GrK1SMtm59D/WW+zEiq0rgSeKt8Oz9iwISZy2vrP2RTlYZHOpUX9oEUtl/W9c+VLkKriFVfmscazZ94H90CSgIpxDPyh+RAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjWxzf/syIzKxIvBp9j9MW98DCK4pQwK6Rfomiy0JBA=;
 b=KF5/9nhA0ymHEeGgMZzJJe1V9noHvL2l2A8w1WhIbMSOMQLotRJNYRe+6LK3JfGo7mwVjKvqW7XpdGP41ZkrlrfG97o/i8BFKDBZF+2cqh2AfwLLrer177siUEY8Ea8lQc3Ky5C1Aq1SarrF5ymJNH7SP0abtoKjCrYzdlpd+ETOl5j4igX7B2iUb6/5tSivwE+cMGUTiSYomSwO6esFu6ptO6A17IS9TC32GLREoUM+GLAZS1VDdyjJB1yb1JAOa0V+QrokSY3agHJV1s+BzNbX3C3gIoJfF34J+c8UHa2sxpiqxCKuXbjNonQ9WR0x/GnG8K5gQkVQ0b5D3vhAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjWxzf/syIzKxIvBp9j9MW98DCK4pQwK6Rfomiy0JBA=;
 b=wi2XY0iMEWJA0wYRM8KOnlSfrsz4MRlziUj5+57NW6lPTJzhSUmxUx4B0zoMGJWCei7gliLZ9/r+LOxpYjRqYq9BSFeOAsrrIwj/OJOiYfEfok6OluFbL1TiDu85ge3xYCDEthzG0Ko1r9+GG5551ZuT4trXAWqPlUcVfHWqp2w=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA1PR12MB5657.namprd12.prod.outlook.com (2603:10b6:806:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 18:28:12 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%7]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:28:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Armin Wolf <W_Armin@gmx.de>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "sashal@kernel.org" <sashal@kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, "bkauler@gmail.com"
 <bkauler@gmail.com>, "Zhang, Yifan" <Yifan1.Zhang@amd.com>, "Liang, Prike"
 <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
Thread-Topic: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
Thread-Index: AQHarTb71TGtQzcurk+uVxyEMrXUV7G2reeAgAFQroCAAABygA==
Date: Tue, 4 Jun 2024 18:28:12 +0000
Message-ID: <BL1PR12MB51446E6BADBA8D24D385DC46F7F82@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240523173031.4212-1-W_Armin@gmx.de>
 <663b8003-3970-4293-930e-e19dce054e01@gmx.de>
 <33295481-6977-415f-abff-472bc6f24b9b@amd.com>
In-Reply-To: <33295481-6977-415f-abff-472bc6f24b9b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=83c7d409-61e0-43ff-8615-8e1aae16aff8;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-04T18:26:34Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA1PR12MB5657:EE_
x-ms-office365-filtering-correlation-id: 8173be3c-3470-4a0e-af33-08dc84c417c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?MWtQK1l1Wm5ZVFdCTzdrMm9PdW9lWllhQnExWDlIUEFPNHBjQ1B3Wm92Q0J3?=
 =?utf-8?B?c2JDWTlJSjZMd3ZDN096YzVRKzBsQ3ptWDNNN1lXbERzSFpGeWdSNmkxaU03?=
 =?utf-8?B?VEg4OEo1cDJNV1RIMFNKbHpQOXU1R2wxTVpDN0prSmVDa3JDVmlLNGlhcE1C?=
 =?utf-8?B?NjE1MWZwRjVGcGFLcTBtSmRRQW53M1BCQVRXaVpjcjJnKzA3QzBjYnR1ZEM1?=
 =?utf-8?B?d1NMVFlFRGxRN3ptejhNWjYxY3ZUMzBLZ1Z3dUNIVEZ5NGFUck1tekVYc2lx?=
 =?utf-8?B?b1J2aFBDVDRpUFVodlAyckRhcEJzYnZKNW1xaDg0bGlVRTdrRlBzRlJCcGdt?=
 =?utf-8?B?UWZZcGFhejVSeDB5Z3QzT0FHVXhuempoWDg0dWZLdmV1alJtV1R0S1BnS0wr?=
 =?utf-8?B?RUlDREYyamRZVTg1cDlQZ1QyeVpWbkprRjhYamt5Qk9NOEgwb2o2TEZXRVFY?=
 =?utf-8?B?WGFOajRwWkNUcFI4Z3NqZm8zNnFiNU9xeGVmeDFMTU1nME9Cc2tRMDRtV0JW?=
 =?utf-8?B?Q0JmNDd2bjMwWGZDY1pHZmpFMnlDMXYvM3hIaTVUaXF5M0lvMUtDd09Ia05S?=
 =?utf-8?B?dk9sVzFsTlJKSExFM3RIZjhvRlZzcVVUeU8xRHRNMVV1YlQ1VzdwSDFwMHdi?=
 =?utf-8?B?Q1ZSN00zMi93VXBRbTN1a1VudGRERCtKSzh0VGtia3hycmsxRnBrQUNyaFk4?=
 =?utf-8?B?cG9kQzdjamNzUnNsNmp4LzR2eXBSWjFwWGJDckFZZk9PZ21KcFVRNnN1M0tQ?=
 =?utf-8?B?dUxNTGJESTNJU0svWjFHbytRVnRSMnVKbHl1L2ZxdUhBZlRvazh5WGFOSkNv?=
 =?utf-8?B?VThuWnhvbDA4OWFZRDJIREpjdEFETW00VjI0Q0Ftd2VOVG5RaUtoeVhpaVVR?=
 =?utf-8?B?MWE3UEpGdjlRc3d5U3pic0xBakJwOUx5OTk1UVVTNm1MMS9EL3Q2Z3FLYUx5?=
 =?utf-8?B?OUlSOE9BU1U2YnlkZElSY0V3cmlxL0E2RUdSWnlFdkU2ajdITVlEQ0tWQ05W?=
 =?utf-8?B?ZzRlR3NPbVY1QVNib01kcWtuMVRCa0xQOU8wZG5uMzlWTDd6WWMvdGFGZ2JQ?=
 =?utf-8?B?SnBrSzNuOWZEOU1wQmtESWRBOWwvZzNZaTRCbGpzakl6aEpZcTh5UWxlWC9P?=
 =?utf-8?B?YjdibjZFUkRSUGRRdU04MzRPdjc2ZDZnRXFEWGNGUVpRN2JkakE1SXp0ejJM?=
 =?utf-8?B?eVlBaitTL3NNM1pPWmhFZ2M4NUYxUmw3eFVERjZkdjE1L21vWVo4WG80U29M?=
 =?utf-8?B?L3haZmRTN21LY3V2R2RHSzlFY0kyUzR4U0V2VU9odW1SZ2xSZUk2L2Rld3Js?=
 =?utf-8?B?a2p1b1dQa3pIeE5McmR0N2ZWd2ZreWR5ZHBpTk1Id0hDWDcrc056NzFkcWhN?=
 =?utf-8?B?c08weVQrZk1Ram16UVVMMEtjT0Z3NyttMEIrNHFzZTJVV2Q4UG5neHhXalJN?=
 =?utf-8?B?bHRGOXNEcitEU3JXOWdkUUtmcFJ4dm1ZOW5DZFFSSi9HRitmcnVReVV0MHpQ?=
 =?utf-8?B?VDMrU0h4dEZXYTJIaWpQcWRaWkEvYTR4Q3IzbkFWajJaRXByM2dzMnN3ZUxl?=
 =?utf-8?B?MkxMMTN4dUpUK2QvYTNMZ0ljaXErWWI4UmlHR3JHN3QwNlZxbEJzYmtrSjdE?=
 =?utf-8?B?N0JkdmFZcW9GUHg3STcyT1RCSWM5ZmlXRkU4eHhUaGNiWk9sc2svdEtEc1FF?=
 =?utf-8?B?TXRYRHRTL0wwT21WRCtsRzdnZzR0aXQ3ZmdTZXdkL2xDYWFUZ0NUSTJBSmVl?=
 =?utf-8?B?ZHVxVlM1Q2NOVnJ4Um1ybytjSWtWakdRUElqUFdzaUVTdlZBR2NJRFFOWjNM?=
 =?utf-8?B?LzRzU1RJbmlkMGdFTHdQUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0thWHVyb3ZvME9GSy91TFhZVUp3ZElicmVCNWJkS1ZDOUsyd1F3dDYyeDRC?=
 =?utf-8?B?TElobEJvRjRhcjhFczI2dndwaU5VdUNqOGU0WlozQVZIdUQ5c0YyaktFWGpj?=
 =?utf-8?B?M0FtV1g2R3kzSjJvdEgzcFljdXMvSTJBVDl6ZWxHVHlDZW5mWXkrS1JlZ3lm?=
 =?utf-8?B?N3RlNmppQUM0cG5pQXNSR0FUQmkzcVk1TGZlRjEwOWNyalY5SDJtSmNIb3pK?=
 =?utf-8?B?QjlpdjZMeVpySTRXWWhNRVdHaU1Ddk1qa3hBV2JnenVFSnpiSjZiL3R3OTJ3?=
 =?utf-8?B?elA1dGN1SEtYME9pMW9jMWwxckU5Z0pFOXFMREJZOXBZWElBaDk0KzB5bXNF?=
 =?utf-8?B?UXJuK1pUNnFUczdVekQ5RTk3d1IvK2lyQU45eFd4d1MwTzB6ODBPQ0lISFJL?=
 =?utf-8?B?OWd6RUN2UVlBSkZlbDVqMzZsODRReVJvcVIvUS8yRk5RZWhFZFMrNTIrMHFj?=
 =?utf-8?B?Vkt0UVlscWFGbFp0MkZMMkd1VkVuMjdMZHFOdzN5TExsMTZZSm5udWRnc0ZE?=
 =?utf-8?B?WTBPU0t0bW8wY3NOQ0VjTEVGeEt2QU9SVTFWOFVtZTZJYk9jejE1eG1nTnNs?=
 =?utf-8?B?bTZXaHlkdTBqbFJCNjJrOGlqQy9uK0VjLzBqOXJ4Ry9YeUFoRTNwaFVvQXRG?=
 =?utf-8?B?MXJaWWloK3BmMW4wM3VQeXVGTzZCV1lmQVdMQzUvZE5rYnZWWk9FV0hPKy9I?=
 =?utf-8?B?azZ3ekpVRHdmc3BTeisrajN6OUc3SE0ySW9ZZTZmemhGZXMvdCtBTTVoZzNG?=
 =?utf-8?B?bjA3OGFIWWpnbWVleDNsMW05S0FBM3A2eG9TQjdIZkVGYm9KQXlzaXNmeWU4?=
 =?utf-8?B?eXpiZDVkeVExcTQyZFF1OG5VdnR2ZlJtSUZzNUFINUtNZytFZ3JZeURTa3Fi?=
 =?utf-8?B?cUxGSzZhZW9LVllpY3VDSTl6dytiNDJlUWY3S1JIaFRNUnNHRnMzWkpJRjFs?=
 =?utf-8?B?UmhHZEJ5ZG5Ec1pHZS8zbk03K0NhaE9LeU43R0hQaXN1blZRdUxVWnJyek52?=
 =?utf-8?B?OTdFK0tnbE1SazVjTGRUMjJXZ1U5WUZzVENMbVg5b3lvWERKaWZqUDFUcEFX?=
 =?utf-8?B?N0swTVNFR1NhQk5RRDlxZksvUGJrd3JDS25lOG41SnpxUm1SU2tvaHMyV2pF?=
 =?utf-8?B?YjRiZDJhWUNveVlGbm9JM0lHNU1PaE4wN1RjeldNZ29mdlpSZCsxb3kya08z?=
 =?utf-8?B?ZzZxN29LL0tuV2FFRG40YWtTZnBxcTNwK3I0MkIxU3lVdDJZZlJTcy9OM0hw?=
 =?utf-8?B?U2c2MFplVUt6bWpKcHBhY29hQkp5UWlVc3VNTkQyU2VOcVRGSHJDdlE1d0pi?=
 =?utf-8?B?RDlKMWxjWnVRZ0QxdzBtZUF0N2J4SDhQZEZwb2xhbElWT2FCSGhld1d5VkxU?=
 =?utf-8?B?bG4wMW9MN2hyd2ZHZUpLM0pESE5ucjB3WHNad0tpYWZVd3Z6OHdxS1VQREM1?=
 =?utf-8?B?aDhlenpHaGM5YUJQbVFUclBTUytSNHluNWhOaXl5b29WRnQ3WVUxckxuWnlE?=
 =?utf-8?B?bzhLcjRaRHBmd0JTRTU0SE00OEx4TFZkQ2JjcmFETU81amxSa3RYZmkrNytS?=
 =?utf-8?B?MkpScHpUNEVwTElGOG5wZEkreEhOdzhCNUV1Vm8xRFhTN1RwclR6aGNJRFJY?=
 =?utf-8?B?eHpGTDdhTWIrRSt0bU1sK2hzREExM1BETmtxc01XZ2NYRnJVcjJrZEhzUXEw?=
 =?utf-8?B?cWYrdnZYbHRxK3lKcUI2OUNvbldJY0czZ2lISTFEV3puVXRrUUlFZXF4V2xU?=
 =?utf-8?B?WW5Hd2JnME5PaEJrWmRWazQzSmZ5ekI2VjBGWUc5U1BGWlRTOFNmWG9UcmhU?=
 =?utf-8?B?UnBwN3BvOEJ0WEc4Tjg4enZKU2NrRlRvQ0F3NW1UanhUa3MranR0dUV1ckEr?=
 =?utf-8?B?d1E3SUUxUHRHSHAraEtMcEM4YzYyWTRyaFJLcnRXT08veE9EZ044b042L2FR?=
 =?utf-8?B?SzY1ZVF1NnFKUWZsbUdGeGpET2RJdlBnZmJyTzg4RjVlaE5WNUUvdHdxbk1L?=
 =?utf-8?B?YS9tZ1l0b0VSS1JoSDFFNGVDekc5YVRUOEJLcHhqUER1NU4wM1ZxMkM4Y1Qv?=
 =?utf-8?B?eGhmcHdzSVUxaHNpQTZUUlB4QjJlYlp0bHRmdGV4cVpHaGFhcHVCOG1YT0lx?=
 =?utf-8?Q?3KQA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8173be3c-3470-4a0e-af33-08dc84c417c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 18:28:12.6588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZigVjzukSJvhcHNeMCZFodpId0qmsNoa2ZbL8jdjl0FY6V4mWN2Uc8LNKJ0cUZI8Idy4uH35UvHwoFC5CbHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5657
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLdWVobGluZywgRmVsaXgg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgNCwgMjAyNCAy
OjI1IFBNDQo+IFRvOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT47IERldWNoZXIsIEFsZXhh
bmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQu
Y29tPjsNCj4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IHNhc2hhbEBrZXJuZWwub3JnDQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBia2F1bGVyQGdtYWlsLmNvbTsgWmhhbmcsIFlp
ZmFuDQo+IDxZaWZhbjEuWmhhbmdAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdA
YW1kLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBSZXZlcnQgImRybS9h
bWRncHU6IGluaXQgaW9tbXUgYWZ0ZXIgYW1ka2ZkIGRldmljZQ0KPiBpbml0Ig0KPg0KPg0KPiBP
biAyMDI0LTA2LTAzIDE4OjE5LCBBcm1pbiBXb2xmIHdyb3RlOg0KPiA+IEFtIDIzLjA1LjI0IHVt
IDE5OjMwIHNjaHJpZWIgQXJtaW4gV29sZjoNCj4gPg0KPiA+PiBUaGlzIHJldmVydHMgY29tbWl0
IDU2YjUyMmY0NjY4MTY3MDk2YTUwYzM5NDQ2ZDYyNjNjOTYyMTlmNWYuDQo+ID4+DQo+ID4+IEEg
dXNlciByZXBvcnRlZCB0aGF0IHRoaXMgY29tbWl0IGJyZWFrcyB0aGUgaW50ZWdyYXRlZCBncHUg
b2YgaGlzDQo+ID4+IG5vdGVib29rLCBjYXVzaW5nIGEgYmxhY2sgc2NyZWVuLiBIZSB3YXMgYWJs
ZSB0byBiaXNlY3QgdGhlDQo+ID4+IHByb2JsZW1hdGljIGNvbW1pdCBhbmQgdmVyaWZpZWQgdGhh
dCBieSByZXZlcnRpbmcgaXQgdGhlIG5vdGVib29rIHdvcmtzDQo+IGFnYWluLg0KPiA+PiBIZSBh
bHNvIGNvbmZpcm1lZCB0aGF0IGtlcm5lbCA2LjguMSBhbHNvIHdvcmtzIG9uIGhpcyBkZXZpY2Us
IHNvIHRoZQ0KPiA+PiB1cHN0cmVhbSBjb21taXQgaXRzZWxmIHNlZW1zIHRvIGJlIG9rLg0KPiA+
Pg0KPiA+PiBBbiBhbWRncHUgZGV2ZWxvcGVyIChBbGV4IERldWNoZXIpIGNvbmZpcm1lZCB0aGF0
IHRoaXMgcGF0Y2ggc2hvdWxkDQo+ID4+IGhhdmUgbmV2ZXIgYmVlbiBwb3J0ZWQgdG8gNS4xNSBp
biB0aGUgZmlyc3QgcGxhY2UsIHNvIHJldmVydCB0aGlzDQo+ID4+IGNvbW1pdCBmcm9tIHRoZSA1
LjE1IHN0YWJsZSBzZXJpZXMuDQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IHdoYXQgaXMgdGhlIHN0
YXR1cyBvZiB0aGlzPw0KPg0KPiBXaGljaCBicmFuY2ggaXMgdGhpcyBmb3I/IFRoaXMgcGF0Y2gg
d29uJ3QgYXBwbHkgdG8gYW55dGhpbmcgYWZ0ZXIgTGludXggNi41Lg0KDQpJdCdzIGFwcGxpY2Fi
bGUgdG8gNS4xNSBzdGFibGUgb25seS4gIFRoZSBvcmlnaW5hbCBwYXRjaCBjYXVzZWQgYSByZWdy
ZXNzaW9uIG9uIDUuMTUgc28gcHJvYmFibHkgc2hvdWxkIG5vdCBoYXZlIGJlZW4gYXBwbGllZCB0
aGVyZS4NCg0KQWxleA0KDQoNCj4gU3VwcG9ydCBmb3IgSU9NTVV2MiB3YXMgcmVtb3ZlZCBmcm9t
IGFtZGdwdSBpbiBMaW51eCA2LjYgYnk6DQo+DQo+IGNvbW1pdCBjOTlhMmU3YWUyOTFlNWIxOWI2
MDQ0M2ViNjM5NzMyMGVmOWU4NTcxDQo+IEF1dGhvcjogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPg0KPiBEYXRlOiAgIEZyaSBKdWwgMjggMTI6MjA6MTIgMjAyMyAtMDQw
MA0KPg0KPiAgICAgIGRybS9hbWRrZmQ6IGRyb3AgSU9NTVV2MiBzdXBwb3J0DQo+DQo+ICAgICAg
Tm93IHRoYXQgd2UgdXNlIHRoZSBkR1BVIHBhdGggZm9yIGFsbCBBUFVzLCBkcm9wIHRoZQ0KPiAg
ICAgIElPTU1VdjIgc3VwcG9ydC4NCj4NCj4gICAgICB2MjogZHJvcCB0aGUgbm93IHVudXNlZCBx
dWV1ZSBtYW5hZ2VyIGZ1bmN0aW9ucyBmb3IgZ2Z4Ny84IEFQVXMNCj4NCj4gICAgICBSZXZpZXdl
ZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+ICAgICAgQWNr
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gICAg
ICBUZXN0ZWQtYnk6IE1pa2UgTG90aGlhbiA8bWlrZUBmaXJlYnVybi5jby51az4NCj4gICAgICBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
DQo+IFJlZ2FyZHMsDQo+ICAgIEZlbGl4DQo+DQo+DQo+ID4NCj4gPiBBcm1pbiBXb2xmDQo+ID4N
Cj4gPj4NCj4gPj4gUmVwb3J0ZWQtYnk6IEJhcnJ5IEthdWxlciA8YmthdWxlckBnbWFpbC5jb20+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFybWluIFdvbGYgPFdfQXJtaW5AZ214LmRlPg0KPiA+PiAt
LS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA4
ICsrKystLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KPiA+PiBpbmRleCAyMjJhMWQ5ZWNmMTYuLjVmNmMzMmVjNjc0ZCAxMDA2
NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
DQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0K
PiA+PiBAQCAtMjQ4Nyw2ICsyNDg3LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9p
bml0KHN0cnVjdA0KPiA+PiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiA+PiAgICAgICBpZiAocikN
Cj4gPj4gICAgICAgICAgIGdvdG8gaW5pdF9mYWlsZWQ7DQo+ID4+DQo+ID4+ICsgICAgciA9IGFt
ZGdwdV9hbWRrZmRfcmVzdW1lX2lvbW11KGFkZXYpOw0KPiA+PiArICAgIGlmIChyKQ0KPiA+PiAr
ICAgICAgICBnb3RvIGluaXRfZmFpbGVkOw0KPiA+PiArDQo+ID4+ICAgICAgIHIgPSBhbWRncHVf
ZGV2aWNlX2lwX2h3X2luaXRfcGhhc2UxKGFkZXYpOw0KPiA+PiAgICAgICBpZiAocikNCj4gPj4g
ICAgICAgICAgIGdvdG8gaW5pdF9mYWlsZWQ7DQo+ID4+IEBAIC0yNTI1LDEwICsyNTI5LDYgQEAg
c3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2luaXQoc3RydWN0DQo+ID4+IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQo+ID4+ICAgICAgIGlmICghYWRldi0+Z21jLnhnbWkucGVuZGluZ19yZXNldCkN
Cj4gPj4gICAgICAgICAgIGFtZGdwdV9hbWRrZmRfZGV2aWNlX2luaXQoYWRldik7DQo+ID4+DQo+
ID4+IC0gICAgciA9IGFtZGdwdV9hbWRrZmRfcmVzdW1lX2lvbW11KGFkZXYpOw0KPiA+PiAtICAg
IGlmIChyKQ0KPiA+PiAtICAgICAgICBnb3RvIGluaXRfZmFpbGVkOw0KPiA+PiAtDQo+ID4+ICAg
ICAgIGFtZGdwdV9mcnVfZ2V0X3Byb2R1Y3RfaW5mbyhhZGV2KTsNCj4gPj4NCj4gPj4gICBpbml0
X2ZhaWxlZDoNCj4gPj4gLS0NCj4gPj4gMi4zOS4yDQo+ID4+DQo+ID4+DQo=
