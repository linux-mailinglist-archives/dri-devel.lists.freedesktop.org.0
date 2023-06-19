Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34320735350
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9C910E1E4;
	Mon, 19 Jun 2023 10:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B3710E1E2;
 Mon, 19 Jun 2023 10:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd7p67FsPfSPop8Gx9UrgGZtGb8CNTmg7UU8n00UU1pjKc/svwTd3vWdLbk852gJNnA+O6hUx5UYCVdiO4+XNvmtFp6lRlyurbz/CFkYqaz6qYcZrFD0mbzlcfZgVzxFGwNg2ufMdabNWO5wuY5ELA9OFoJ0nvP1/QCJhg4ITugQCpSKI0ce6LWpkKK5vSoNfxu5PWGMcKcM8n2BFz47uVbDvwvxvtzSaELgZopqPcohciid+R8QX2U5HAyY/iAxUFUfLMSYW/lcWILGz76xDYszaCv8ZrXhbSo63l6lNHQ1DqF5Z11rnet+PlcCQhBomoYC3jadGisMbwdZiHNqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SikwuSq5R7qBoiGS4c/HrkuZc8FWExy7ezQI4XoKyOY=;
 b=ixy22t8TDbFkDf5dLJjEx1ira5yHO7RGLmsnaCIcPyNOZt4hGXe0uZpe9qi3B9T5Bf+2BFOiRdNAucbtWXSPJMrRJOUjDrkAGxinFPFR+eDhvwbB90NV9Pwc7eiK6ja+CplSKifdFNyrmreyWFSbtGEsVmkldqXsOgEL28YAwn9uNrncoyFyoGKLpseVsbq2lRuhoRNzLIkaS+S2r5qlsb1LL6Tjc3DOlK02E2oCK7SCHEeekG/dlpEwP9+1/L/hHUr8KndPYePlYsO9UXx0+yPd6iqPoTPGsTc1WcK2qSmnNyebOsJnj7v6my99wdQAlRQoMC2YJ4urSwoZ/8rL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SikwuSq5R7qBoiGS4c/HrkuZc8FWExy7ezQI4XoKyOY=;
 b=HmZSrSPmQdrZi0yQsbqmqW9/+X8z0/gVP3a0Swcni6OoPpYqJ7uvx3geEXwZ/XAf+bQ5JNuQXbok9uSxbozrqNjO2bgjk/khp/4+LiDu77vL8s1hmvEvUCrUPMC60/hcb9b202JB5ejVYYhzrrk16pl+mxav1cGB7JtbwPqXei0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 19 Jun
 2023 10:44:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 10:44:11 +0000
Message-ID: <26c94e6a-9458-7aeb-8e6f-85838bac43ca@amd.com>
Date: Mon, 19 Jun 2023 12:44:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <20230619121234.4a826f53@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230619121234.4a826f53@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1ab5ff-29d2-4af4-bc7b-08db70b21e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAF4amQt2hHSWNBcVdcHqDRAEXN9heXhbnTrRPDAVFN3XmQcDEqtar0wzHwZjcELiCghAXmHGKZvUKoHgT2FhTjKdIrD48f+tB72+M7y0H/+twOcueisQfmag8Lx0YJTkvNUFZa9mbpDyO/6vpa8un0rxZgAgQ2JYTRP5RtXrLO1ig59H1atVPR2iezD11HwCmRqiKRWI39ZOGhnbGikspZvFEmNQo5LuEcHmVP4hxpyiyk9Gk0VJ0AO4IxJfp+2yTtO0ZB/ac9fSxNQLcyhaZzK/ibqHinHGkpZPoLJN/hY1/QZmzRqNySJKlpxQ5ZXVdZ9ZSd2LDuUmctatBcRJFHj8tAMGgGAVOKOXzES7Y9zQ0c720m3AbtaApIGtb7F1hkxmN0N2B5pWyuIjnhg6fTzkyJZDoBg+a6zcNWApE2PrpaaWL9UOs1n/XIjiCoaTXpuS9LxH/VnPyIZiSkQH6uLV/1IsabWqTZl1E0XvA0E2hmHkmI7TNkg2Z3R5LPUTMLbDQlsfUISjtN9B6wHGWobuds2e50yA2UfhIg86Fb8vx/HRTsDRV3+sOReuAq9/hFB/JBM6n6pgZ+rxIWxlQ9ImfBvLd+5C2NWXBRKv3xAPksPbuZpLrySJ6p/8h+/ze40b/gbLidg4zKbLmEpFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199021)(478600001)(31686004)(66946007)(66556008)(66476007)(36756003)(8676002)(4326008)(41300700001)(2616005)(83380400001)(38100700002)(31696002)(6486002)(86362001)(2906002)(5660300002)(6666004)(110136005)(316002)(8936002)(6506007)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhQYjNpRGJUMTdjR0FzLytNOXdHSjZ1aTZYKy9qMUkza1AvZjNCaHRGQUhz?=
 =?utf-8?B?aWZxNW5LcHBreU1RaW5TTG9rbnpEMFlzVlVpWnQ2ZWhaMzJxM3c2NVRncUZI?=
 =?utf-8?B?RkNCWlVLeGY0cUU2Uk5MT0tUUW1jeGJPQkVWSFF5ZVB1NDFwbDRpWlpuU3I3?=
 =?utf-8?B?RlBqaTVFSVcxZzFEaVNpRjZoWG1NRzVTR25JSjlkTlNENGM2OS8ySzBiWm5Q?=
 =?utf-8?B?c2hXcFRacERDVTlDYm85Wm9CQ21RaG9GdjRjeTg4SlI0TWQzUGJMZEJSL2hU?=
 =?utf-8?B?REVCekxldWFLNEVsTWp0emwvdnJPYWg2UVVZdmZZSjJZRTUva0xCWXNtOXg5?=
 =?utf-8?B?ZDQvUkU2ZjBqY29pQ3l2T2NNRFZoeEI0cHpTZmlWcGx4YzFVSytRakdwSyts?=
 =?utf-8?B?Tk5KYzROYjh2eDlZQ0hsZkdrNFFRRXBGMU10Y0JDK0FMYUp6UHY5Z0R3R0hq?=
 =?utf-8?B?cC96SGlQUDhmdGtwWTF5dGo1bG1XUks3NHlNWE9Jb1JpVVV3Tk01ajBKR2k4?=
 =?utf-8?B?TE9QWVRDZDB6Si83VEhkZ2pJKzhmeGZpT3EramlJUFFRakNiQWNjZDdZRXZt?=
 =?utf-8?B?NnhiQ1hwK2t3WURrL3gxVkQ4M05ubDNzVEVGUFR2RHhXNDRzRThFR2V6S0d5?=
 =?utf-8?B?UURIMWtOMTVNVlF0RDM5bEpiY0o2Q2o2bmJENGZBRk1kOUhHM3R0b04xL1BF?=
 =?utf-8?B?QkdERm92Njh3OERVbGF1d1F0SmdHUXRlM2kyVWVFUlRIeEh2N3lTWGRuNHF1?=
 =?utf-8?B?SkNBZXg3STlDMHlNU1dZcXkwTkJUejR5bkUwTXRxY1A5ZmpQMUFmTkNZQTBW?=
 =?utf-8?B?ZU9FNUlyUCs0dHBBZ2RtSC9BSzVXL1NWMXFVbEJaVFlMWklBTG43Tmk3RENr?=
 =?utf-8?B?clYzWVVwcDRqa3oxa3NZbnF2UU9xWGJNVTZud0daOUlrbUtQLzRvZUlETXNQ?=
 =?utf-8?B?VzFIOWd3RnI2cGFOb1J6VkRhYmNlTkxXVWtOU3JzQXRhQnJ2anVtQ3hZdlhU?=
 =?utf-8?B?MDh3MTByNXExcW5KL0Y4TjhiTkNFWkl3dk1OZllqcmtpYzdyRkU0VkN5VGFp?=
 =?utf-8?B?dUVzQTMzN2pZK1JBTHF2SEFXYW5pMmFuVGRsUmZ2cjcrdFp6ditWQ2xTTUJ1?=
 =?utf-8?B?RnZrNDRiS1NBS21yWEsvZXRmQ0gwQXRaUHlQK3MvL1p2eEdSMWNrbTA5bkFu?=
 =?utf-8?B?L3V3L2x6eitmaGd3SitQSUpCVG5EYTlQTjErZG8xbW1kQzNWMU1wTjhQUk5o?=
 =?utf-8?B?Uks4OGlTSFhJNUJWTU8yLzVaNjBUbjdpSU43TjVCQjBJOTAwU1cvcWJMdWkx?=
 =?utf-8?B?anFBbTN6cGM0di9vemwyUUM4V2szT1ZLdWVuR1Y5bFM0bk1qUWJ3MXNFMWs3?=
 =?utf-8?B?amFSaVVnY1hIM0d2RjlTYjdjYktzUDgrT2JKUWFRL2JTbGo0VFkwNlh1NjBY?=
 =?utf-8?B?VU1zWTByc3d2WGo4QXJRdWp0alEzbGk1Ni9KZjF6Umh4N2dLNFh3dDIzZU9m?=
 =?utf-8?B?TDJPUVVCVnlyOUVaUkhGUTA5RjUyTmZON2I0WkFlRktHT2RpaU52RFpISHpC?=
 =?utf-8?B?NmFFK3MxSHY3ZHkwT1BDZlZ1MFV4QXNLeTBLNEcrSStQQzZWb3JQN0ZrdFls?=
 =?utf-8?B?bitmWGZ6czRQTXNBbmNpSU90dFEvanc0SStIeDJ5MmRZekROVDBvb0xFZ2Zo?=
 =?utf-8?B?K1RDZUJmeWwwSERaMnorWXpzQThlNWFLWFEzMnFuZjluQVh2bmVjOTNBYnFa?=
 =?utf-8?B?YTF4WVAzTTlFRk9TdEhrUmlYZ3h3dGNyRUFjamZWbGhQNVA1WTg1U0hsZndt?=
 =?utf-8?B?TWZVbDFhQUdSVzc0Ukp5L0FhSDhVRVZzbDZxOGhDbTRVK2lzb0t6bGtDTCtQ?=
 =?utf-8?B?Um10ZmtRWVBmVFBqSXlpNWc2TXlJU2tSUjZGaGpBU1Mzbm9qWm14Zzg1MnVC?=
 =?utf-8?B?dGpzTkFqdDFSSDYxTGVXTkNrRVBsdXJibitOelRyREpRSE15LytxYU9ncFNS?=
 =?utf-8?B?NWx2dVU5NVdCM1dxMk5aNVI5Uzc1MkgrYmVsZU5oVkhLWnl1MTQ3OVFmWE9T?=
 =?utf-8?B?NG5nUWJIOFA4ajJWUm9aeWR3NEp3Uis5OGc0YytFRzJ6YlBIdUMxMVl0Y2RM?=
 =?utf-8?B?SFVCTld1NGF6U2dPOWxFSTdmWFUzRkZxN0tOa3pETldrQzBTaXNxRGZ2bjI0?=
 =?utf-8?Q?LnbM740HB/dUb2io41mlw9B7oTyRUK5owl/2K8SAPFHu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1ab5ff-29d2-4af4-bc7b-08db70b21e18
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:44:11.6645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmE+FOjOHm2aMLa0aFEuExrPDjof/nnRlJM2Jb9GwK+MQdWYtM/RzKzqUMOV1rJe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.06.23 um 12:12 schrieb Boris Brezillon:
> [SNIP]
> Note that the drm_exec_until_all_locked() helper I introduced is taking
> an expression, so in theory, you don't have to define a separate
> function.
>
> 	drm_exec_until_all_locked(&exec, {
> 		/* inlined-code */
> 		int ret;
>
> 		ret = blabla()
> 		if (ret)
> 			goto error;
>
> 		...
>
> error:
> 		/* return value. */
> 		ret;
> 	});
>
> This being said, as soon as you have several failure paths,
> it makes things a lot easier/controllable if you make it a function,
> and I honestly don't think the readability would suffer from having a
> function defined just above the user. My main concern with the original
> approach was the risk of calling continue/break_if_contended() in the
> wrong place, and also the fact you can't really externalize things to
> a function if you're looking for a cleaner split. At least with
> drm_exec_until_all_locked() you can do both.

Yeah, but that means that you can't use return inside your code block 
and instead has to define an error label for handling "normal" 
contention which is what I'm trying to avoid here.

How about:

#define drm_exec_until_all_locked(exec)    \
         __drm_exec_retry: if (drm_exec_cleanup(exec))


#define drm_exec_retry_on_contention(exec)              \
         if (unlikely(drm_exec_is_contended(exec)))      \
                 goto __drm_exec_retry


And then use it like:

drm_exec_until_all_locked(exec)
{
     ret = drm_exec_prepare_obj(exec, obj);
     drm_exec_retry_on_contention(exec);
}

The only problem I can see with this is that the __drm_exec_retry label 
would be function local.

Regards,
Christian.

>
> Regards,
>
> Boris

