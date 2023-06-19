Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC1734A11
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AA710E131;
	Mon, 19 Jun 2023 02:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EB110E131;
 Mon, 19 Jun 2023 02:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFlPc31UHnmi6+chnQXu9rNB2yvb+IMyJgoIbGo0cAS+Ozodh34tgKVYouNwVENES2N3wAgmA8+ijck+OU5+uf8szQDs6jL0hy6lY1yd6tiR+qY3jFYLwgi64D0ozaUU6O6Teyq1OrHxLsL8ybidhre8dELb7GahRYJEDxFVptKzShslLHwPWFu3E22Fo3uXloyyVBNSVnKXIK/uEGbmgl3IwdVOubz01fbXXHIpetBP+L7BABJuTwSNHjoEwVPzq1GyS5rBDceNpVOFBRsfBTcY2byTJtgh4qcCSNws6rwdciYjawQXyZQxYYj3ucEImJZPFhNH/8CTG5wAmNKmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYWmxK8Z6jEx0bBliNePUUtDmBYlpr++6EaXpl12yDI=;
 b=mFSenZQG88glviHrR8eG/+gvqWubcM77KUQWTRmeWvbtpd7YIj+QM57qEuY1xYeE0vCvY4eKCArt+SZs4oLeovrQhZwXvfHOy5fZFy8cfXqk3bX1H5a+Kzqf4pYRvIO6fv8wxzMWBqEX2UW6EdVXpifCwppcq0W+cGPZfv+FoZdxFb+k1TVNmfwmx4vBWBrcqDNs8KIMhCgiYrfHi/fAp5rW8hOmZ5Qs1MsuOePZ74YsKOS6cJcZwNkRXQX0UcTVAl6J9/wPavsWM2zxRb22MaG6dKiao6356WHW/mQ/1iJS0wCBhs+OZ+Zk5Qb7D+6QoinYOi4j0BmkUPrH4sWzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYWmxK8Z6jEx0bBliNePUUtDmBYlpr++6EaXpl12yDI=;
 b=Cr93LjyA0VphM7BeVRxFV6pmXfOvVwWghoWJqMxL1TESb8KeUe6SaNDVFskMwBPAU64FEwXCLmLdvhGmCEUyzYhVfcH4xQfdbYnspT6/CSeZ4T2lkt2lZrHr2PCtqEp6IwIqcM9mSAd85DgcsueKSqhWlAHMtJw0WLPvxxdZXKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 02:18:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:18:06 +0000
Message-ID: <6386e0a4-3cea-e691-e33f-d4617812e8c6@amd.com>
Date: Sun, 18 Jun 2023 21:18:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 3/7] drm/amd/pm: update driver_if and ppsmc headers for
 coming wbrf feature
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Lijo.Lazar@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-4-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-4-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f942450-20e1-43a3-f420-08db706b6b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cb4Py57sjDg8Y/JhGburhNv7rqH6TkGNWUoL2cPOwCAVFma2nCYm/i/OJWhsYU2q9JCuzKruW+sohb+KpdmwrbWovi7Z0D78+wzPO2JcmR9xgcmDsm2i4bdFqLR7PIw5ylTVzQOcICAQTWa9hZvq/JBG5EeDGmvoSXRFCS/PKvAbuJf/pQW81w/KVjSpb/RI8X6OVEPnXFSAyT/J3bOfwzpi14GChCAN0yjOS2NJXRpfEu9aqfmRbWeTeDNVrtAyrVHTiPvZ4FizR7HFopyYkJvjIxxFxooaB+GuKxxtL8d2Nyj72yDW9jH6rWHP4k1HRYPrkkVXLICoDJSCLqiwhZ4UImg8GPqA0jMEP+3TFey+98alFsdjxzQCeUN1YwvCGENlhzq2SIuqSSRee6fXP76vUKTOOF/MsAZKYAHfecteGmlEvpbBwUFZvNMismHGOqF4JR1Rza0zMzukI1uE/3bJWhtLQrJsPwIX5IA12G2dx3FrvOpIRrAAd+uyUrddCRM0dtIZifQHcpKng3w4RPx6NJyYSNZKoBfE6YwA70/gOgMIPCbRUqGJF5G/jRuFRaQGwqvP3q8Rr89A8bIYy6he/zkxznfq4At1qY1CJMyidJeQuWQQVN1aCIkkhUj6CScMnQvBLsPW7a0Pbr8jVgfcIqv7EEsdUuoYDw+nsSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(31696002)(478600001)(2906002)(6666004)(6486002)(921005)(2616005)(15650500001)(86362001)(36756003)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(7416002)(5660300002)(38100700002)(44832011)(316002)(4326008)(6636002)(83380400001)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtjbmJ5TUxHblRLRGNkaDZZSmVUbHRBSGhpZEdRSnNuVjB6MGRuc1FzNVRH?=
 =?utf-8?B?Y01LTFd3cUQ0TmlXZlhXWjk3WitlNjFxTFQ5d3RuemRwbW8vM3R0bUI4UXlY?=
 =?utf-8?B?RkdsTmJCUWdlUlpKb0pSLzd6L2trb0VoZzBXZGRHUVM4VFNweU5RNG0yMEl0?=
 =?utf-8?B?MzMvL3lvWnJiYXR4a0N3eWxpYWZiOTQ5V0d0ZHBzMTVpV2dwdXF0ZXR6THdJ?=
 =?utf-8?B?VUlIV0JFZ0VwUFFiREs4a2YvcHBIQ3p6aHhxdVBtNlkwTmhPclN2Q3RwcWtV?=
 =?utf-8?B?aFZxUjF2R0poVUJBT242bS9mcGZDR21oc2hlN3E0RDhqd0ZxYVNhWlIyUVNE?=
 =?utf-8?B?WlJOaU45QnlvaEttN2JDaGxCTzN2M2VSekdidkNmNjRKckgyOWxkMXAxa2RH?=
 =?utf-8?B?UFpTVEtZVVcwUFdNaDJBc0RsNlEzRldmZFJBQU5kcmxVcnZ5WGtRb252TDJR?=
 =?utf-8?B?ZEk5NjlORkZXUnNJa1M1N3RPWDVXZWVuU3QwMWRoSHJrNk85czUwZjdSV1ho?=
 =?utf-8?B?UWJPVVdPYW85ZC80T3k1WTk4UlRXWmNUeGhUSGFSclhlQlorWGZPYmVtc1lG?=
 =?utf-8?B?eFk4ZG81N0E2amp3RjAyckJqNDBrRmMxL3JJaG1qOFF5T1ZCK3orQ2ZINERp?=
 =?utf-8?B?bkV0aUxjYlZhUzN6eWh6OSttTjBFa1dQODU0bnZPdkplL1dnajB2U2dHTmRB?=
 =?utf-8?B?RmVOZDIrQm83STM2NzlMckY4cUpaN1ZLQjdxNHBHbDZLOGUvZCtKcUMwOTRK?=
 =?utf-8?B?QmtXK3U1ZTNxNE9RY1pJbXErVzVkdVQyWlVVcGQ4cmV0bXJwZDM3NGZOYWJB?=
 =?utf-8?B?TGZ4TlpRdktHM3NySTcxVEhPSWJaSmttblNUVEEvN0U4K3VsUUNYQ3RYYzdn?=
 =?utf-8?B?SXVHb1djU2hIOG4valhRd1J0dmcrV3d5ekRmTjhXbmk1bm1DQ2NoMlg0aDlP?=
 =?utf-8?B?eEpGWVpEUmJqOXp4VU9ZclVxcWlwREkyZHFONGZjYVlmVDVnYTBQY1lrRitW?=
 =?utf-8?B?NmFXa09ITGh1dFJ2SW9Ody9Cc2xoaTFmRnhwd2xuRXd4dmdWMWE3dGRtOEVj?=
 =?utf-8?B?Q0hjb0hnQ05ISnJEVUxmZXJFVnFTUVNTaUt1NmJJSUI2TGVVSmRJZTkzUEo0?=
 =?utf-8?B?VlV0NnJ1VWVoTXJ6WU51aUFSZG5peXpEZ0pkRW9oUGw4NmxkWEF0STBYbi84?=
 =?utf-8?B?WjJWSm1BZEkzbWErTi9HM1ZGU1lpQjJXMExTRHhyeFkyUVM5c2F6N1VrZHZ1?=
 =?utf-8?B?ZzBMUEtzRFovQ2JhZkd4eVFjZUFMTEFOdUFjWThGbUlSS001T0xPVS84QzRr?=
 =?utf-8?B?M3cyejBmTkQxVktXTGs2U1dsVjI2bVF4R3hlUE8raDhHazRzQVcxK2VBVXdk?=
 =?utf-8?B?dkR4NG5pRENHRE55UjBUQzkwYXBsT2NISng2dUZjOXNMcHlITFhYY1A0Mjgw?=
 =?utf-8?B?ZlFGSS82cTE0bjhXQkFjOGFsSEtBTDFFcjRHLzRseXBPTFRnVXJaRWljNkV0?=
 =?utf-8?B?NmhQNWxDNTZWc1Nzc1dqNFIyS1hwdTlzQWlKRXdTTEJYS3FpaXpFemVWMXhh?=
 =?utf-8?B?YlpMaFlQZW1yVS9iSkdZblZaS1R3YjJaNHoxQ1lVcWlTQTBwdzc2aG5ObE9Y?=
 =?utf-8?B?QXN2di9zMEZWZXVIckkyTXc0RTJsUnoyUkc1KzVOK0ZGNERhejJxS0RxYUR2?=
 =?utf-8?B?ODg2ZG9PUlBRR3Z1L3B1em9BOFVjMVA3d0VKUHlZbkprM1AxUlZDaEx4OGNE?=
 =?utf-8?B?VytYMGwxNkY0Z3BOZVNPWldBQ01JcVdubTVseFJiMm83UHJpNkVIcVlxTHFT?=
 =?utf-8?B?TmZ4dGVFOStrMGkzTmRGN2VqK2s0YXZad212QllBQ0RrdkJzOWtuWGd0TEIy?=
 =?utf-8?B?MGthbnhxcm5IODFGNmxUOXhwK3VKa1BCL1YyT1dHQWxxQXVrcmtQSmp6VzU5?=
 =?utf-8?B?WEVseXB4SUpYQnFYTDNsa2xWbmZGQWpvYXVmOTVHekdnQ05zWFpwdm5qdnZs?=
 =?utf-8?B?cVFyZ3hDWitiMkJaMWJLbUt4cnliM0Y0S2FzMFZ4RkE1RTc0Q0xxRkRHUTB4?=
 =?utf-8?B?WDRVMkEwVlo3WWhDNXV4QmlleFRRN25MeXduREk4eVZCY3VQeGFYSzFOMzFn?=
 =?utf-8?B?Zk5XSW51ZEFJNnJLandmMEE4RG1lUlBGZ2NsbUxnVXZYWmdubnROQ2RGYmZY?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f942450-20e1-43a3-f420-08db706b6b47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:18:06.7851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCIfv00AZwpvN9ffgOd30S0EFpKL69h9UxclTaNwYDGpeN2deZHrKdw3TbWDG16zLoz0itNTfEAZad4unGno/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905
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
Cc: linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 01:57, Evan Quan wrote:
> Add those data structures to support Wifi RFI mitigation feature.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 14 +++++++++++++-
>   .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 14 +++++++++++++-
>   .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |  3 ++-
>   .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |  3 ++-
>   4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
> index b686fb68a6e7..d64188fb5839 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
> @@ -388,6 +388,17 @@ typedef struct {
>     EccInfo_t  EccInfo[24];
>   } EccInfoTable_t;
>   
> +typedef struct {
> +  uint16_t     LowFreq;
> +  uint16_t     HighFreq;
> +} WifiOneBand_t;
> +
> +typedef struct {
> +  uint32_t         WifiBandEntryNum;
> +  WifiOneBand_t    WifiBandEntry[11];
> +  uint32_t         MmHubPadding[8];
> +} WifiBandEntryTable_t;
> +
>   //D3HOT sequences
>   typedef enum {
>     BACO_SEQUENCE,
> @@ -1592,7 +1603,8 @@ typedef struct {
>   #define TABLE_I2C_COMMANDS            9
>   #define TABLE_DRIVER_INFO             10
>   #define TABLE_ECCINFO                 11
> -#define TABLE_COUNT                   12
> +#define TABLE_WIFIBAND                12
> +#define TABLE_COUNT                   13
>   
>   //IH Interupt ID
>   #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
> index 4c46a0392451..77483e8485e7 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
> @@ -392,6 +392,17 @@ typedef struct {
>     EccInfo_t  EccInfo[24];
>   } EccInfoTable_t;
>   
> +typedef struct {
> +  uint16_t     LowFreq;
> +  uint16_t     HighFreq;
> +} WifiOneBand_t;
> +
> +typedef struct {
> +  uint32_t         WifiBandEntryNum;
> +  WifiOneBand_t    WifiBandEntry[11];
> +  uint32_t         MmHubPadding[8];
> +} WifiBandEntryTable_t;
> +
>   //D3HOT sequences
>   typedef enum {
>     BACO_SEQUENCE,
> @@ -1624,7 +1635,8 @@ typedef struct {
>   #define TABLE_I2C_COMMANDS            9
>   #define TABLE_DRIVER_INFO             10
>   #define TABLE_ECCINFO                 11
> -#define TABLE_COUNT                   12
> +#define TABLE_WIFIBAND                12
> +#define TABLE_COUNT                   13
>   
>   //IH Interupt ID
>   #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
> index 10cff75b44d5..c98cc32d11bd 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
> @@ -138,7 +138,8 @@
>   #define PPSMC_MSG_SetBadMemoryPagesRetiredFlagsPerChannel 0x4A
>   #define PPSMC_MSG_SetPriorityDeltaGain           0x4B
>   #define PPSMC_MSG_AllowIHHostInterrupt           0x4C
> -#define PPSMC_Message_Count                      0x4D
> +#define PPSMC_MSG_EnableUCLKShadow               0x51
> +#define PPSMC_Message_Count                      0x52
>   
>   //Debug Dump Message
>   #define DEBUGSMC_MSG_TestMessage                    0x1
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
> index 6aaefca9b595..a6bf9cdd130e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
> @@ -134,6 +134,7 @@
>   #define PPSMC_MSG_SetBadMemoryPagesRetiredFlagsPerChannel 0x4A
>   #define PPSMC_MSG_SetPriorityDeltaGain           0x4B
>   #define PPSMC_MSG_AllowIHHostInterrupt           0x4C
> -#define PPSMC_Message_Count                      0x4D
> +#define PPSMC_MSG_EnableUCLKShadow               0x51
> +#define PPSMC_Message_Count                      0x52
>   
>   #endif

