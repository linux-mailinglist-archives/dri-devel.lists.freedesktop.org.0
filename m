Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87989431222
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5806E98A;
	Mon, 18 Oct 2021 08:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8106A6E98A;
 Mon, 18 Oct 2021 08:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg4uU30YNbtJ2kLcNOCjikdkPci2g03HkpZZwvhAawiq10fO+YO+H4Phj794MBBWEthFA51L7SMMV/x4y4CEBOdsuSMbl/kpSMk7QvhHk4L2iJEBmSO0utA4IoF4cVLkrtmvP2P2Gccg1YD5PFFRnXHqaxERniraBHX+P1rcJ/8qcEW5hutlPtZn7QS1bmyO1w7j04+rIqMWp/H/Si8yMupCYcfxP0L3xNYYq0iuGTgOsRRSNPkflTx0GG+P+hSNJgk0r7y7Tc+xSoYneGVeR/Pd1DUNsjgzySfMAmaxh9b8wU/iuaFZ+1R6IFjMWULtisrUDNrlaWIvjmplXTDB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDbYZvYBg/uIvAO2Wl4Pk47zGTKDTl4Q718ZjpfF4Co=;
 b=RHHKf+6YY8cX3cW5dh+CAwCFJ4UpHhWvGkrqTM/zisXmmz3IppQShodvp33ypZJDtq5Fx083KW8/BiabCI2pHVrl23EolO2LDKxeVZRI7luSO6JdlO9YJnTWCBLdAuhZWzN0HTTSsGbqPQoCaJEYS37PSMjeqFCLEscLPIDHSZcfvfrEMfdOraqexzRdLLccuDxDaFjyGCtyn0xkcx20FkPkD1hhb3TX6K8JQFuXYFmO5ARbLO5iFETxRCXx6cbM6axR8t4sIspmuO9HhW8v1BVHq5JWS1mEu1g3YfDGvm/wxW8jjBqx2mQ9Yg0ZC2JH1rVfHp3AFhzF2V3wYZbtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDbYZvYBg/uIvAO2Wl4Pk47zGTKDTl4Q718ZjpfF4Co=;
 b=PUDOayLgPQNa1B64aPOM8OrTyujm/eI4umkpFXC7ZlQjZGrLPFPJ/QtFdwUOpJAUCgTuU6bNMe5IIu/FRe5y0u/BwDo9FN8TdTyq7ravhrc/SGMfIFdUcOrKxvb6oy3pmeO5AhImbgXOzKfgCCSMcg98sF7PeZmhvkVh40hw7jU=
Authentication-Results: wunner.de; dkim=none (message not signed)
 header.d=none;wunner.de; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:28:17 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:28:17 +0000
Message-ID: <ac83e9e7-1c98-1821-17c4-0f4ab4cd253a@amd.com>
Date: Mon, 18 Oct 2021 10:28:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
 <20211013183601.16514-4-nirmoy.das@amd.com> <20211017200355.GA3480@wunner.de>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
In-Reply-To: <20211017200355.GA3480@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0050.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::13) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (217.86.114.39) by
 AS9PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:20b:463::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:28:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a5fe5c-52f1-4bae-a4c5-08d992113c4f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5230586DAB732892A39959B38BBC9@DM4PR12MB5230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhgLJQCm95kAb2aFho6mkD7dNalxImbOVySajzuEkEEo1HKupgwOaC9M8Be2/AxD0PrmRaG0EEVa1hcmlcEDKL4KErXSFQx+YeodWvfSzaLYGdEa0UTtU03qJl95QRc/cO1gt0GPHDs/VmQYxc7AhGIG45MFFTG7Rky7RzgTjuCE4gqKaPRaxEPmiFgRIK12J6TWzuR8R2O4NnQzGSLB6rPKlgIPxYWy4RCo6RjLGfWnw0/ivUxu0gHbgrPsENX6DXD63li62ZArMBHwN9y00in8Oz8MhplPJG2PojbV2KBULdxG+5hswn8SGHU84TmFf95aoqbaIbgXuxD3PRWs0eIAkYvTLGCZqGJJy6Q4IsxBCQaXHFHgwTpT6DBHSibKuRWFCzIi//0D4dzq3fpVujnqdd2zy/vZL6g8C0XXxPUyqUJ9pIlEocGxOMXf0Q3B8WGPDUG0+1C1GJYnM26kkdR/kWYzBoy+GzYrAwzMfeE1PbEcBLezJxVZ6AoOZpW+JtnB9IEtmmiEKab7Lc6L7DXUeBaP00s6V0tk7DQsvhGKMX8Lxpl8TlVgJ6um+cs/4+uyWV7jMCPx56xXJQBuyR3BmSsD+22CBK48/9cs5l5UZtFB5XNjlnUfJjRb4tej4q1stFSlPXFjv3qZVyCRRsAc8+0FTBHJM894LPv7uH6MSPGnMbqbrXT3vy/+BWxiHus/3kA8KeD+j84b34+LCBIXY+6ruCnS8NbA5HR+6iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(83380400001)(54906003)(53546011)(31686004)(26005)(66476007)(66946007)(508600001)(6916009)(8676002)(31696002)(5660300002)(38100700002)(186003)(36756003)(6486002)(66556008)(316002)(8936002)(86362001)(956004)(2616005)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWN1cFNZQWdKUVFHL3lmOGJ6bmxUSDlNTXBxTGNPM1pyVmJLdGpFTmk3aTUr?=
 =?utf-8?B?M0NHOHlZL256NVBqOHVtbSs2UlhQazFLeGNiYjFwMWpHWkZOVXFSTHNRaCs2?=
 =?utf-8?B?RGJjTUtXdGZxK3pxc1lwczRBVXk0WmQvYXpjMEd5QUh3L1FCeHZudGlURTI4?=
 =?utf-8?B?SWV6UEtWUklmNVMzbWZiUDVYdHdTY0RKdUVoNzNsZXF6MzRZVjJLNGtXU0pD?=
 =?utf-8?B?bHVYSkNmcDBqdjV1c2pQK2h2TGVweXJSeWtwRDNFY28rV3gzdE43cHpobGhW?=
 =?utf-8?B?aUVLeXVYNDVHMGVtV0pXMkh1SnQwenlOdk02aUUzc20zMUtOOEF5cHh2OHRt?=
 =?utf-8?B?SldkYUZyL1AwdEpESVVrck93RzFKTWsvaG83SmpCaWYrT05MRVlzellKcnJi?=
 =?utf-8?B?T2VoRU5zQzhYMk9paldrTno0UkVUendIVlpOZGd6WVVNZ2RjeTcvS0RBbXpN?=
 =?utf-8?B?WXN1Z1pDR2hIdUQzNk5peUlYOFdBTkVDNnhiK21VbDNFNTZwY2VWdVpLazRa?=
 =?utf-8?B?bnduRHJ2Znc0enJ3NUVWZWlaVThtUmlscW45TzdXbURKT0FJY20za1RuVlNR?=
 =?utf-8?B?ZlRiV1BsYXRuNFRTemtFZy9IU0JZQkVDSjB3Ym96Mjc0OTFPRkg4cldlSDdP?=
 =?utf-8?B?SHgwRGpkeTZYOVZFYjcra1dsV1dha0hFcVNUN0o5RGwvTXpxd2lzbGdwbmlU?=
 =?utf-8?B?SVUzdnFCNzZNN05nQnBlcVdOeEdtZHlsUzVaUFVGamljNkJzUGlNdUhscjl2?=
 =?utf-8?B?M3laT1M1UUdjamtGY2piMkJFTXF6TWpFTFB2V2lRWVpxT2ZoVnFvb094QnVR?=
 =?utf-8?B?SUMwOHVGV3RyTGxHT1F4THdKSW9lZ1lwdEE0ZFp2RUZ5dStjdVQ5L2h3Ujly?=
 =?utf-8?B?TElIK3pmTDZvZG03aGc3N1BRcDV1NkxMeHpCVXErVnZZbXRlNU05OGxwNU14?=
 =?utf-8?B?ajVRa1ovVGJYalg5R2lsNEY3Y2Y0UUVXTWNrek1wTUFJL0pSZklBV0xyZ2J0?=
 =?utf-8?B?ODhSU2U4Qnl6VWJYdjlPNkhaMVNHV0dKZVo5T3U5dWVwMXp2NTZDVVBEcXJK?=
 =?utf-8?B?N1FxVlFyU1hHMWJjU1NMZ1JwL3JMR2FNb2RyaGtCZVN1RnNkS3puVnNFNTlD?=
 =?utf-8?B?RzhhMkF6UFpMeTN0ekdQdktHdit0QjMyb29HQ2NTdDhEV0FLUVl4SGVDNm9s?=
 =?utf-8?B?TnFaSUFBMStmUG1QcWFoZXBuUEI5QXpya2VEb3dCZDdSZ1ROQjNLQ0V5RSs5?=
 =?utf-8?B?UkRUaDNNa3JUMjNibFhmMU9oVjd4NEZybjlaMHMwL2ZkbE93TUtReU82RTYx?=
 =?utf-8?B?MGpjZEhLZTJIS0Z1cnlUOGtnWFh4UjFrZ1hMQ29NYktBbEZhZk1Sb0JVMFNj?=
 =?utf-8?B?SWFJa3hER05uZHhCQTF6dzVWYmJaSlNxRlg2Nkd3TDc2Qk1Fams5R29ISmpV?=
 =?utf-8?B?ZDlCYlpMbk5pelMza0xyNlVsblpkU20xTnJpVmRuTnFWV2FvVVcyUUtheGdQ?=
 =?utf-8?B?Sjh3VWNUanIvZGFTN3BFWWd3VFBSUEUwYi93eWFQTkZKOHNsSklyRUxpMHdP?=
 =?utf-8?B?SDVrRkxjWUlKM1F6K0hoMXBHS3Q0Z2c3NU96Y3dpNktsSFVmblF1RnVDU0ZW?=
 =?utf-8?B?c1kvbVVNWTJOdng1a2NCWmR0d2xITUtjbVl2czMrN1Awd3RLdWY0ckI1cFlQ?=
 =?utf-8?B?RXhhTG9NZjFwTE1vbmU2RU5hcWVZOHR0UHZCVG9pa3hkVUgwdmZoejZSTzdy?=
 =?utf-8?Q?YC46HX5H6IARRmzKmIlmY8j7dg1g0ld7zKRNYb0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a5fe5c-52f1-4bae-a4c5-08d992113c4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:28:17.6136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJNPTqqF5qu0V/Chj/jTJGlQKm0zZeUTPsMv4qSAULNk8sdj8cyDHE8PA+AYs1i7IvTEML6V0PHfrfRfS7dmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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


On 10/17/2021 10:03 PM, Lukas Wunner wrote:
> On Wed, Oct 13, 2021 at 08:36:01PM +0200, Nirmoy Das wrote:
>> Debugfs APIs returns encoded error on failure so use
>> debugfs_lookup() instead of checking for NULL.
> The commit message no longer matches up with the patch itself
> (debugfs_lookup() isn't called).
>
> My suggestion would be something like:
>
>    Retry creation of the vga_switcheroo debugfs if a previous
>    invocation of debugfs_create_dir() returned an error code.
>
> With that addressed,
> Reviewed-by: Lukas Wunner <lukas@wunner.de>


Thanks, Lukas. Yes, I missed that commit message modification.


Nirmoy

>
> Thanks,
>
> Lukas
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/vga/vga_switcheroo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
>> index 365e6ddbe90f..07ab8d85e899 100644
>> --- a/drivers/gpu/vga/vga_switcheroo.c
>> +++ b/drivers/gpu/vga/vga_switcheroo.c
>> @@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
>>   static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>>   {
>>   	/* already initialised */
>> -	if (priv->debugfs_root)
>> +	if (priv->debugfs_root && !IS_ERR(priv->debugfs_root))
>>   		return;
>>
>>   	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
>> --
>> 2.32.0
