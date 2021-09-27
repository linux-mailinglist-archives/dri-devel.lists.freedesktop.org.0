Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDA41942F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 14:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9140E89A9B;
	Mon, 27 Sep 2021 12:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8589A9B;
 Mon, 27 Sep 2021 12:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ge3OfCbwoutO3quyfMVKRyMEyc/Uvrj7ZTRCKFxMLhmD8sVfb8lL0Bnpz7/yhBN9hqxtKokHjvEuanFUSwWMmJcEUjIolaMf0xuBDkrMY7CJQ24QwtIxO85Il0pTwinPXCc+YDmtka6DHPyZxcg2OpzEWOX3DNyAb3cFwFEW0Y9QXryKwYVTZd+8LgVlSG1MrhLzNRENXdWuJgm3yKHzUlMyQ7+Uln2vH8/yJo6qHtu5KgkBT6FlorqFC1GP2+wPth7eSvZgE2NU59hAnzHBHSaesCjEogjjJ/6vm3qwcCZBhnGEo2mSeF6U90uJfigpuRCAyGZXznzfOEbJgP1Ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ce9NRdEaSm1FBAdgpTOtnlZKLQkLtA8E39aTtIzv8+Y=;
 b=Sk4zHVIIKtgPq2wzqKCUcRoAp0mDjjjo9WPP5gg6lDW5156+P3GdmwHRua5sx7GQabbKCT6xYKyz+/iubUlmmnsX15fG0h1skE1ne/9otyS3htdS1OqVNdT8Jfrx0QG//D5RHyHytVCIs/ZCys2s0MOGUwBS17zyh+mH3pLo4SdWgX5W3+NAwRgSLnoqf30gTo+mfwLg4zv8YvzUuttQhZI9l/muAZaCaJ3PP43eSveh4Z4BWGKAbLpIl64uBKh0SmNzl1Xuz6zkjhS7aleJPpyPnl4yO8JY8yn5mfRx5L77tniqIqmpAr9FzcDqAgzfEsJbpx9n+oRf6e3uLvH+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce9NRdEaSm1FBAdgpTOtnlZKLQkLtA8E39aTtIzv8+Y=;
 b=jh7OSGsVNyxOfTmP6+KtQBxZXwr3Gn0fW36kwdQ2zfa3M1sfGeAGFlcoc8pIhgRPiiPPRnbrAuCQd9Vt5661agHrUDntYJAJdr0q7Ue7VkVrUvccKBJyGT2QOCSMFrDOZbCk67fQcbbGJ2l8/ExeMmQ5LdhOxSxOtqDYLTnGTTs=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 12:26:23 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Mon, 27 Sep
 2021 12:26:23 +0000
Subject: Re: [PATCH] drm/amdgpu: fix clang out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Huang Rui <ray.huang@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210927121958.941637-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <998000b4-993a-1053-e1f2-b716dc32ae9b@amd.com>
Date: Mon, 27 Sep 2021 14:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210927121958.941637-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:208:be::29) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:208:be::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 12:26:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84960288-c3c4-4ab8-4a08-08d981b20463
X-MS-TrafficTypeDiagnostic: MWHPR12MB1453:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB145378587812C14B0E3CA7BA83A79@MWHPR12MB1453.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLTR/ZP4Q9crsLngjqHXl/Sdoyo/MCPOHOBofl9BByqs1UxPczDUxfLgFtb2hao7hcTZKxPYwdmCjc88nb4NOTut+1HCJXVge5GowUmYoFS/utQq6FQOg14uAC6Y7YExUK8ztDM8mM16wSbaaslVqeLFX8mkCqUo95d4f6tBRaJb9FcubV67/d0affmUtBpuAB5U5Y6jZnnQ0HbiW/IUS8QeM95u51oSxJPslE6UXhtVmYqtSL0aInFIcVYq4Imo5Jx/LBd9NeKMH2V0CVSIZyGABBDZYo/S6Wc+Ly+5rJ9co+jZpM5fOdb6xDrWDBOPw9/XYHnETh+qLZXViYvqTUoxkcNh3QdGVKY0Kf5ahzh7fgSbuYD7UqO+kzuE9Ky1gJd5iRIbmX3sM2MHuk2inBcTg6ZqBx9vvDfvZnvZFcv4YjUaKU0iZs0bHhy0SLpqYtna3V8wsC7dXM99ikZfO6ub5eyrKeE5xn/3hGysCfDRnQ98sWGHUOIj8AxxGs7biB7JtyK0gAd7BpSezqtxu+3/hu7N4vj1eaEl2KnWU10a68WseJQzMg6VjX9qGtKps2h47RzUsVhxL7APo97wobugnhYXz0Wd2K/LQ5sCXlAYDou1lfEi7Fmmr1GaO7ypXp4GVdQ6Jbg+IStai52CFtSEgovcCAojUiTU3a4DBM58389BxWRz3Hi83k27X9j9zsYYq2QQ8e8hdIf4ZeSrozmY5ARYbDfdX9bDuzkJJb+eo6YrvvLuzWH96a/kqmCs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(8676002)(36756003)(186003)(8936002)(7416002)(316002)(83380400001)(26005)(4326008)(6486002)(5660300002)(2616005)(66946007)(54906003)(6666004)(66476007)(38100700002)(31686004)(2906002)(66556008)(508600001)(86362001)(16576012)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXEyNjkvM094WDdTeVdMV2hheUpMY2JaWVlNTEYwaUFEb1ZSTFZqTGxuMDJp?=
 =?utf-8?B?Rkgvbi9EZ2ptTTZrOHR0NUxwRGx0M0RsSHFZTGo2dkU5bzhOaVZ3YnhMT0tn?=
 =?utf-8?B?Qm1jUmVkK3laOFRsQVF6QlRWR1dIYTRLRnhvQmYxU2NjRFUzM29QWTlCRWJs?=
 =?utf-8?B?Zlc4QVNwY2RCWE81SlFDRVRlWGRYd3d6a3gwRzdnOTVUdXhscE5GVWtadnVt?=
 =?utf-8?B?bjhUWkRlQlRHYmk4YjVUcUcvVVlYUWlFVHNqenk3cUQ4QlBmaWw0UExyM1k0?=
 =?utf-8?B?dFc0QlBPN0ZKOU5xRWtMZUcxejFQaDFUSHkwS2YzTC9HTXhhMFBvWGZPQmNw?=
 =?utf-8?B?aHpxSnBZSVFMNjlaeVlhcVlVL2lGMld6RCtmbGZsdDczbWVNZjAweWsrMGtp?=
 =?utf-8?B?RFRSd3J1eVh1NmJ2R2VjNFUwVGpYdEtlemlDdE0wUHA3QVpmSTdpRVdydzVI?=
 =?utf-8?B?VUw1ZHBWSzVZNlgzcEVDOE41M0gvRUtTbGIwWVBmRnFTaHliRVRYQ3FKcGpr?=
 =?utf-8?B?S29YTFdBK01QdGZ2M0djdThsSm90R3E3ZWx4SWVuUVBhdDI1aUk0U2UrTGFa?=
 =?utf-8?B?U1U1eWtTV3U3WnJRMmNvT2NDVkNQRUZCMS9rVWtNSFdXTzhDVkt4WjVKUXU3?=
 =?utf-8?B?dDNvU2RaL3N4ZVpSR3l2ZndObmtFWEtNbzRQeGFlVEx3RHBtWTFxTWpDT1JP?=
 =?utf-8?B?amlrWTF3YzNQcm9zNy9mTjIyMlExSXkzZzVSYjRxUFE4dmRyT01mSHBFWmRI?=
 =?utf-8?B?emMraGxZVHZZUDQ2U1pWSkVHSzdsdDN6Y0pWam0zSC9GcHVwTkVtVzVqNGtB?=
 =?utf-8?B?bk9yU0tCSmNpMFdJS25rRlAyVjlZNUtnNkdoUzZVS0ZrSDVsc0RkUEFSYkNL?=
 =?utf-8?B?Q3M0VXQ4d1pQR1FiczhjN1NiVm1XK3o1WS96TlZaWXFqdW1MVkhRYkRTSUh6?=
 =?utf-8?B?NXhQZ0U5dEZweEF0blZyOGk0T2NIOUJzNGQ0eXFzaHRuL1lId2tuaUJxdXBu?=
 =?utf-8?B?d3cwc3dSU3pydEM2UzFQbVB0bzFjYklBOE5DVHNnRVNORm41YWY5Z0piQWFY?=
 =?utf-8?B?ODVNRm85MmJjVlZlWW10eTRqRE4yQy9oV2dHNW1ZRVVCZW1iYmpyRUdrM1BC?=
 =?utf-8?B?ZTg5TzNreGEyYVU2STZQZlFZcit1QlRlREVwb0pWSGRmWkVJZTU3cXZ3b0hh?=
 =?utf-8?B?TGNmeVduNFVLbTY5R1dHNEtWTEd3MjVJUGJtaFJPWHFwSjM4SHNlL3FORjkz?=
 =?utf-8?B?SmZXSUtmV0VCazdnd29YSFM3VS8zSFZtVGprQVZEc2pjb1hQQy94RXBQem9B?=
 =?utf-8?B?VUkxYjVQZGFPM25wdFJtOHV5K0NieFhRSTczMjgyV0FScUxrYTVXSTIrNUpB?=
 =?utf-8?B?R1ZRN3VHY0dQOFVpNGIwa2N3bUxaak9UYklCRnpPNTlMYkdtYWsyNzVXYjBD?=
 =?utf-8?B?ME52cEpBYkN3Mlk4UkJsUFl2eVRtalBsMFhqbWtLL3JkbkZ5Y0Q5OFhkSXN3?=
 =?utf-8?B?Z25WaUdNK2ZVV2xEQXh5c0h4SlJib3NqN3Y1S3huZFdsRzFxWW1Cd2VmTlN5?=
 =?utf-8?B?alVXUm55WWpVSndOTDZuNzJhYURmaytxZzUxYkZHeUJ1TG9WR0huUnZaU2Zn?=
 =?utf-8?B?UHEwVlBtQUpiRldKd1djMXlBNTczbEdjZnlPOTU4elQzb0lXNDdHTU42MU5r?=
 =?utf-8?B?VCtER0tPNExnbnVLaHZ1MjFtYU5tS0d1akN4SElNbmRyV0lQTGgxdUN6T2cv?=
 =?utf-8?Q?7l+pCbWORe9aUmvaELyDRD71MfQy9xIo57m4YbG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84960288-c3c4-4ab8-4a08-08d981b20463
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 12:26:22.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKlxj6UngwsKJP0rQETm6WSbFVr9dP9AWRpPue67c7tPZIUUAoQvtxkNKCy9HuWB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1453
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

In general that change looks good. But what configuration is that?

Background is that it doesn't make much sense to compile the amdgpu 
driver on systems where resource_size_t is only 32bit.

Christian.

Am 27.09.21 um 14:19 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-14 points out that comparing an 'unsigned int' against a large
> 64-bit constantn is pointless:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1206:18: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                      res->start > 0x100000000ull)
>
> Rephrase the comparison using the upper_32_bits() macro, which should
> keep it legible while avoiding the warning.
>
> Fixes: 31b8adab3247 ("drm/amdgpu: require a root bus window above 4GB for BAR resize")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index ab3794c42d36..741a55031ca1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1203,7 +1203,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>   
>   	pci_bus_for_each_resource(root, res, i) {
>   		if (res && res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> -		    res->start > 0x100000000ull)
> +		    upper_32_bits(res->start) != 0)
>   			break;
>   	}
>   

