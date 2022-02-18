Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62E4BB384
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2448310EB84;
	Fri, 18 Feb 2022 07:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637910EB54;
 Fri, 18 Feb 2022 07:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBrkzRz3VqWelZub0fQwiMQyhG1ACqE8Loc9+6Ige6TPCVjo5uElKt/YyCdoOfWyoyU7weW58Ohqs8VRH0FjTwxhPzPOGiWpSeb6TMXpqAZ3qkqE7J+KmQ0tnCtP5V6SYBs/Yd/pzaKeYSnKGxe0ddVKF6+uRqL748GqtsLD0MZo+pgLwfyHRsKF9zr7mhe/O0CycCk49FRWUltvfas9sYBX2rXvU+G4f1xxgO7e+3g4Cw+uiGwvNBvlee/FgQwQ5r+ffNq8kmN9g1ecX4DomBC2SrQ8933NefCDl7D3bVHsbE2I2l83tM7mGeSjvWIpUBuB3mspAtbfK9hdNqMVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NSpXZYjW0TBj43f/kNkE+EChqBuLZ7rTb1DeIkEeOc=;
 b=nOcsg/+MnvMse/p6/8ESvPQDXf5dvyomi8jvhinJ2Ji9duDYDCAUMPLDmUp3b3WHX10rD+/Q4tsGws9sSHugoBYR4RXMp93z0cO72lRsDqvxWz0rCeLn1DPFe7zz8h6iZioCrGcGfXjdQI3yXohiTEBaKR4acEz9mWnXHgIDQ3Ohomub08fnw9P0Fbkl+BGNn1x0Bt3Pp6JqrBkXrBtvM6lNm9YNNcDhsty0nYjlsAVmts7I0XKtsR6CWSCB/2jP1P+PA5YBaMLpwU0NrTnqa0kb+8gCyTyPtdma8/9FPLl+PZc1LWik2HNHRpyVHYQG7m0VAK8JO9YmsIJZFSaznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NSpXZYjW0TBj43f/kNkE+EChqBuLZ7rTb1DeIkEeOc=;
 b=Nu4ZMCpdOMTUnw4pEUzUJMsJDciTAXUSeUfb37ABfAwIe4ihAJa7ZDC9j7CKIOE+53xORoI9TnXvVNUHEJ4pVbYJ3Qq0YN3XeGaMATjlFPduh5m0indJNEgur5RN52QePVVvVYkZCl38dZnof7sqEkfCRhzEI3Q/ukyeZxGXJ+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 07:47:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.022; Fri, 18 Feb 2022
 07:47:24 +0000
Message-ID: <cbc80795-af46-21fd-dc9f-ce932be76d4f@amd.com>
Date: Fri, 18 Feb 2022 08:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Replace one-element array with flexible-array
 member
Content-Language: en-US
To: cgel.zte@gmail.com, Felix.Kuehling@amd.com
References: <20220218030943.1905838-1-deng.changcheng@zte.com.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220218030943.1905838-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1440b34e-6084-4ed3-4619-08d9f2b2e6ff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4221A27B8247E761F6E7F4E883379@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YjFKJhZTpbX8lJBdO4eRpKOQzwCTLaKkpJpqEIY7eSkVGeG0/Q+wWymOwJKvIuUEYoBdmsgayLhKbqcTK+euMLoAm/afn8Q2t7pIcoNwnhVMzL7Sn+wADTszhwk9IIXYk/CYBkPfMbUntUFQVUNJN+K4OTML4wR6Dpso48nDedxOsMfQ7baFM64xNLIQrWmQPRwi9Zt/CVtIDT6UIDvedQMGUfQBTSZ71cA/y1Hz9AM1+3DZkqrLZpj6mJVVuDwXzp6dAwG660YpAiXmZMetnD4+5UzQC9/L9IfZiM4laT/9efau7M5vlFXKoyiNuCcXkFbYQb1hMssZtsJzsTsz3VCudwG5QVzhE6Uqfyx1JLtZ4dd75YZqxcfZVh3S1sEUhHSPu2Dmk0u1HTYd89kvVPa57it3nhD6RXdc8kv2uAIrf516iC/RLLkVE7Ke471ztfOpN3290L2Cd99AK3MsMTd/lwbueSyPDXxuNs8JIobP5i08gBe7apv8Pi9NmNcqk4/2iCp6uE/JSekyIruEQExn0zKjKnTcMCk5Ey93HWiufM2i8KkE4D403GhoSggIBleMuswZI81rmzp3fF8UGCZebe4u1t8y6lk6BjNPUTm77OdDqJdLjdntV1OUZ0Wae5ppW4GcmRIAONAqLIuSWcuSCnUqe29Ckvx8o93dyDcbGmevWmHdVPijNF2I0FJHqUIOyVGJlumrc6UNa3zWgeQgPo/anTKoIEC8wcfB4eBLa4jS/i6Mi+5aw8BLLdgeUygeBa4oPiY79BqYgNsVdmbhJurJ6y5ZCVEdmFpeQtqJ95J/uzb5EnAcNC86iwEN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(316002)(31686004)(6486002)(36756003)(2616005)(186003)(26005)(66946007)(86362001)(2906002)(83380400001)(6636002)(66556008)(66476007)(4326008)(38100700002)(8676002)(54906003)(966005)(6666004)(6512007)(6506007)(31696002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2I0OXRyVUpySjFOTjdvR055cXpPVjNzdktpeDVUaHY4dUhuc2JFWml1ZHBI?=
 =?utf-8?B?eUQxOHo3SmlEVlFOOEh2dStuMHhLU29CTXpDdlc1YkxPQWQyb1RUZG93M1hJ?=
 =?utf-8?B?c0hpUWFWQUtVWWxORTVMZlkwODgxMUR6SWFnUDJBMmRmWXN5a2VGUytQalZ4?=
 =?utf-8?B?UUNHZUlsekxmM3A3L3BWNWttcTZPU202SExJVkhlSVJPWVEvNGN2MWxGZVFK?=
 =?utf-8?B?aGZPV1VpQ210VzIvcVdEOVl4KzZSeTA3eUdNMDJvZWdVSGlWQmVMZDgreXNQ?=
 =?utf-8?B?Zk56R3prS0p3c1h3VUNwbS8ybzJ2MlpXMmJ3NVRoeFFhMEtzam4wNUV5RXVH?=
 =?utf-8?B?d21ZT1Z4aWcxRW1SNWVaVnhXQ2VkWFUzZzFFdTMydGsyK09nTWx1TVNjU1BR?=
 =?utf-8?B?RGY3cHRmNm1HcHczNGRLdS85UE9WSldHT2hsalBLbXUyY0VnN1YwWTB4Zzk2?=
 =?utf-8?B?UWNGYS9YSzRXSmtXMWd5NmxtMXpRZkQvS3phZmJnMVNJYlgvcEV0QW03YWtF?=
 =?utf-8?B?UllsZ2FSbzVDRXpkUzFncDZvR3NHZ1ExZElHL0RiUzczdXM4NnJOVytXdzJX?=
 =?utf-8?B?anRLeTBFK1RsVFFySDJlV2RWR0pCTWpRMkF3aTJ3cWFNV3grV3dITkVNQ0hN?=
 =?utf-8?B?UjBGRkkzV1AzSTczSkEwVUlwSUFSTGQwb0IyMmREd2EvQk9ZekpzdW9BYk9Y?=
 =?utf-8?B?Nk00Mzg1UVQ0K3F2emJ6emJiZ2Ixek5USCtlLzllQk4wY0RmRDFCVmVXVS8v?=
 =?utf-8?B?VEtNWVpLTlI1cFU5V1A4d2hveW4wMXhjZ3VVaUs1OTB1K0xVMGFCN1l2UGpP?=
 =?utf-8?B?MSthbFpDcVR2KzZSanJOQTdVVUFHVzV3M3BzSXFhaXl6NVZEWEJmK2dpOXR2?=
 =?utf-8?B?VmhxWklvSWxFVG83VGZ3OGxOcnhSL0RQZW5hcFVaVm1XaVErWkFia1ZHYVhO?=
 =?utf-8?B?UmFkTWtDQ0hZTVRFa3NsbGtaQm1mMXgwQXlOV2NNUmp5QmRxWHIzWDJRSHgv?=
 =?utf-8?B?MlpPSVQwZldEellWbitLSkcwU3dVVllVblZ3UCtFMmR2L3dhVjZkTWFEa2lp?=
 =?utf-8?B?RzJPbytZcVhqb1dxM3hRcUlDUHJiK0E3ZWs1Ymc4MnNKTmFndDkvVittUjlQ?=
 =?utf-8?B?a05selZITmVrMFpaNEFZRFAzYkwzbFB2Um40WkZlNlh4c0ZvcHFTZ1FsaUNj?=
 =?utf-8?B?dEV0S2t2VUExUlV1SUlHTXgwLzRWTFVONmo5Z3BQQkJuNk9vd3hVR2lhRW9H?=
 =?utf-8?B?U0lseE9YOEgvTllPVEVRVUlNYU9MWEZTbWp0bjFGOTVOekFIZ2xQa0MzN1pO?=
 =?utf-8?B?MkxtT2RUcjZ0WnMyY0lvVFNXU1RBU05jQnY0YWEyclY4dW9rZFNpckt5bGo2?=
 =?utf-8?B?dERzQVFVRFdNc0VyWGJJeU1HZS9LUk01d3Z5MURGT3NMZGxMVitjeGFyUWpH?=
 =?utf-8?B?dFhKeFY2UEZ4R1E5UEMxbXpBM2JEQlpxMEdhblV0MjRsVGJmemsxQ0c5WndK?=
 =?utf-8?B?a2kxY2FhN2s4d0x3KzhLdXFaWXBQYk9OUSs1UVEvdHl0ZXVvQy9nOEJiSVcy?=
 =?utf-8?B?MktiUTRYRnd3eEc3NDVrY3pLcnc3V0J6MEd0aGg2cTZ2TkRzUzY1NkVocEZz?=
 =?utf-8?B?OEU4SmhIazN0cmNYdkNPR3cydW1yQW5GVUR4Y09tTUE2U2VXSnNyZTQzalJr?=
 =?utf-8?B?RlFNRk9hbHVaR3NOUHlRZ1kvQmtFVUtvL3lweHZUemthRCtxNS9yN1UyTXJG?=
 =?utf-8?B?ZlI0ak9HUjREY1lSdCtodkViLzhtTEJkT0hqdkpCNTVKVHNjUUJoZU5JeTcx?=
 =?utf-8?B?bHYwTHNXK3dpNEx1Tm9OYmQzZ3lZQUJ3RUlUMnhEbm1udkhiN2pEQWw4K1p1?=
 =?utf-8?B?STRHVFNMR3hlUzdXbHk0akJuR3RlR0FVK3RXVlB2NmpNc090cGZZeGY3WXc1?=
 =?utf-8?B?Q25oNytWR2FBbmIxM2J2TXIwb1dkSHg2dTV2TGcxbThVa29CekFDWVZqdDdt?=
 =?utf-8?B?cTdINERwM01QSi9EdC9FM3F1TjA5TzJUTXdUOXFneU51RWRmQnBndlRidDZ3?=
 =?utf-8?B?YThDL3JHc2dIRmNPQXJ1bFV3WXFQK21tRWJpdVJKUUttYUNjUURPMkZCZDRp?=
 =?utf-8?Q?cqqU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1440b34e-6084-4ed3-4619-08d9f2b2e6ff
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 07:47:24.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwF15z3nMqNIqwe+FTXFpTREg02zy8CWSOmwB1NZ130EslL7nFJqcHQ/HbKhLlaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Felix need to comment as well, but I don't think that this will work 
that easily.

By changing the entry from 1 to 0 your are also changing the size of the 
structure.

Regards,
Christian.

Am 18.02.22 um 04:09 schrieb cgel.zte@gmail.com:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members" for these cases. The older
> style of one-element or zero-length arrays should no longer be used.
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
> index 482ba84a728d..d7c38fbc533e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
> @@ -310,7 +310,7 @@ struct cdit_header {
>   	uint32_t	creator_revision;
>   	uint32_t	total_entries;
>   	uint16_t	num_domains;
> -	uint8_t		entry[1];
> +	uint8_t		entry[];
>   };
>   
>   #pragma pack()

