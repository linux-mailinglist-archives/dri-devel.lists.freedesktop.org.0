Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A342A073
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521286E804;
	Tue, 12 Oct 2021 08:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED86E7F5;
 Tue, 12 Oct 2021 08:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9QWfGm8v3GY/muctg7KbNi4S3CaVpMfHWFkRuiDURPxSbPy6UrXlx5w6RzKi4DTQeAHkUkEiX3Uci72jTJcgJ90j/aj3lHXV8/8woZXJIYXDdwAE/nVMTqE8UIKUxAUHBN6IuYF/N+F4QbgKoLJgz7gEaYvQjZHlYgohrDXyXA+E5e8R8+1J1DbZBof5Nvkd+WBDj9NEaEmJl9ULnC+qfyJw9b25IH2tuuVXIcj1ltY4wtZI5yv7d35rp5JkZhFhPDzoVLdF4JYNOGAOUiCmK0TmDsDGGSIV9YYOXNPbMcYT2jwXSACwvXzR8TMCEFJJdu7TIkWaYCLzqo15nJHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGyXvPk+HMEOHC4d3hgIwvtxoXSPeTHEGb0AC/m0w64=;
 b=nGdngr9/4lEHYlzR0swkqFcug/1jUYDassGzLKXHR4rL2Y0zOoi1nGFsZv5erFSxZW/lwbLLIF7PvxuVZCh/vu43Rxw7/I5f9VGcN/m1nwp7xiTdb88sRkKjVkHR2OLi0koSN4TRNxbG4Mr9QMWIzXz40KLIoessZpw5QJuzKB22nF8rpJWlAv3AKr6418VKrq73KpK7NHuovje3BsHlDh40fkLNOKCX8iu+gXJ0JQVIF7vlWiL2B+MOV4jwG+okmMf0Ijpm8IPBjQkf1Fl2JjzB+Y/PPqS+imxiA9KQi2hRJ+g7UuH7b3ffyiTRCZ3/1QZ2ml8aWgmXqRhzYa1f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGyXvPk+HMEOHC4d3hgIwvtxoXSPeTHEGb0AC/m0w64=;
 b=YuSpvQglLs4Xhw6utedwtB0r4Vg5/k9W86TJs/lHnNQRkB3zoQbdI0fkQXzoMK3xxCRBRY6qD5QSdoOh04KXMesjvrscyR8CNwaH3HfJ1SJ3vu77p9gXw2KO9cOXq3m18fyDjtuxn5C12rJ252wNEXqa0aZcNG19LS3/4vBTyqE=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5496.namprd12.prod.outlook.com (2603:10b6:8:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 08:58:00 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:58:00 +0000
Subject: Re: [PATCH 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
To: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
 <20211011190607.104618-4-nirmoy.das@amd.com>
 <20211011202429.GC14357@wunner.de> <20211012064845.GA10480@wunner.de>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <8dded0e4-43f6-4983-f030-5875cec51a78@amd.com>
Date: Tue, 12 Oct 2021 10:57:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211012064845.GA10480@wunner.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::34) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (217.86.110.202) by
 AM6P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 08:57:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df9c202d-704a-479f-049e-08d98d5e6446
X-MS-TrafficTypeDiagnostic: DM8PR12MB5496:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5496B9057A804377AC21BB4D8BB69@DM8PR12MB5496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hapEOh+tEnEDxYeL0A1BxhE5PmshqC3JDl9D8yhfMoJ5+wtQCF4ZKkKhhj6u5XMF5oPjrEGsCOst1rRc3gCJgO/V6dK7PVXwM6GqjfgPL8mqjUBy1q60Vq95/6+glIgt8ccZlFg+3K0LBSOe1ta1aD9HQ5DvYEIPDPncI2Xx+623WXfUj7aVuGcpYrzTQTpQ4y7tFWq3xok77488i+80wTu8xCqMsmXzvhj6u1Jj9FbjYT18X1g/CPmyzLkVZ3tUems9D/B2mY6cPCGbx4eUL+C+ucVbGA5vhu+zc3vA91j1RfHCHrJytByza9zYB4qIK7fhhc4LyERBWdIo668cF3ntQDWl2HuNQR/OvxUySwUkv2RNCDoZx3vhuBwY/nmp49LSi/1TF18DPvRb/YYnRPldWV9bq6wuAzxL+qzC5bUy6DWQXQ8GKKw4imtTjt+lkWyW2YgenRlQOJ55G+Yh2J2NfPzdt/gSeiMNYOGgHq3U60MV+V5hNlkeVREm1CM6iZEEHyIpl6pxnaP66rfb3MMUFOfaIJC8r+9yqBSjBmtNRPf51c3w2KAoMMnvCdf/IHrU7TYEqyeoO1h2m4ze2Sf5VGVtw5IHWNYcVSSMz8fR6CtZyZIiSk/ClBMMlhx4Tf8Q8XVb+OrNRP8Y+SnKlA311t5CZfSQ5LVAHUBpxCIl7ywJcIbyNwGogM7l+kYmTAjt06TXkO4fokxv7isJlK7DW5LndaKSK2d8nHQ+G+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(2616005)(83380400001)(31696002)(6916009)(956004)(16576012)(86362001)(38100700002)(6486002)(4326008)(508600001)(66946007)(36756003)(53546011)(6666004)(186003)(26005)(8936002)(5660300002)(54906003)(8676002)(316002)(66556008)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFJUngxOUV4bFpOODdtWDBHTm4xejVXSnRDK3cwUWFESjhVbGhJYWJIcEo3?=
 =?utf-8?B?d1l2NExlUW5FRWd4VnB3VXpveFlSdDIrSUJJZFdod2NLckRIWXhraW95TmZa?=
 =?utf-8?B?NFJpbkUrRTY0aVRVa1Rodk9nSEFBMXpvc0x3clE3cmVHR2UvclJrU0o5MWhi?=
 =?utf-8?B?N1VMRHhnYjlQWkJLOVdaUGswbVlWRUxiNC9FeGpKN01Wc1BzeFJ3K0xzMFln?=
 =?utf-8?B?YU9YTHR5U0c5MUhuaUJibjBsa3Rha1g0MjZUS0M1SmFEeGxEVnd6S0o1dnVE?=
 =?utf-8?B?Q29MdWFtWUw2b1JYaWs4WHZ3UUFNN3F1c3hvRzkxZWltUzhzMWlGR1lrUWJB?=
 =?utf-8?B?eVlpejFXNzdEd0g4eTRSRmlkc3BaYm5haS83SUVaSU9sOTFxZUx5R0p5RkRK?=
 =?utf-8?B?VVdkM2VoRndjZFBmN3c1VWRQRGNNZUE5OU95UXJNUlFVemovUlk1NzFtZXV3?=
 =?utf-8?B?RW1hVjQ5WmVKeEtnaFZTZ09PQ2ZobjQwZGVRVkJMa3BWczlsTzJKWVo1Y0JH?=
 =?utf-8?B?TnZ4Qlpra2ZNald6RnF3LzhvbFMyR2I5TjI5WmVmc0tsK2tlVXZ6NHJMZ0Js?=
 =?utf-8?B?OWFwRTJzSGVZd0wxR1NtajdoTkVVKzhMMWhSb2NSajAzY2xiOU1JMmYxenFB?=
 =?utf-8?B?cDVPRGR4ZmhYY1h5TS81WTlvSlpVN3VUd0VibUR4Ym82N1BRM2owZForZG1F?=
 =?utf-8?B?NnE1VmRDZ1p1TkhXYmJQYVVMR2dGZU5MWWNEZHN3Z2hMMnp4R2ZWN0MrWlJ6?=
 =?utf-8?B?WHRjOTM5a1BLNnZYaDJtTEREYzFUanNMOU1hVnNVWEpQSGdSOGNkSjlZQ2cw?=
 =?utf-8?B?cDZwcGloaFYyeDdXNytuRXVnd2RFemI0UGd0R3BxZWdwRnFGWVJOQUpxc0p4?=
 =?utf-8?B?YkxCTUpuM1pOelFKMzE5UkVhcHVUYTNzSmJPSExBUnBBd0wvV1hpYTdzdFVj?=
 =?utf-8?B?cVN6WlhWZTdyRmtoenFJYk82Zy9OUkloMnVDd2plc05oK0xZMDFKc2FRVGhv?=
 =?utf-8?B?YVgreEZUckdQR0FSWUIzNXI5TGxCaXNTNndxK0duOVJXajVTYUh3YjNyNFBa?=
 =?utf-8?B?SGtld0x1MXBQTVJsT0JnYUtwQVREcU1NMzNROFlseEFxVnhWNTMvZjJVbEE3?=
 =?utf-8?B?bE84cjZIeEpyakVyMnhnVTluUjZQSUNpeVZ6ZkNreVRGQW9lVmE3RU9sSmd3?=
 =?utf-8?B?MVI0M3V6eFM3RE5pUElnU1JvRXQyRDQyUElXdWl1OVp4ZEhJY3VTak0xdTk1?=
 =?utf-8?B?cHQ2RmFwT045TVpVOXlGeFRZUHkxdUF4TXY2V0ZNcXVhdi9tTHV2aW9iV001?=
 =?utf-8?B?UURmcWtneUh5d3hjODlnbm9Uc0QyWVVpaTlobmhFQXVxamxLS25QSUR6WmJT?=
 =?utf-8?B?bEEvMU1xTkppdWtqOFBuQkNwOUFSMDJ4NGd0VVVNaEFncjBab2NIdXo1Zzd3?=
 =?utf-8?B?SVdpY3BHY0tPWHp5SG1PUWpqcUlRM2oyQ3h1OU4raHRrMCtWeG13TUNHdjNG?=
 =?utf-8?B?L09lVHIyUDRpQ3FIZXhTb0RldHhXb1JPeFYxMHpwZm9xaHlpVUxHRE9qazJo?=
 =?utf-8?B?M0pTbDhXUnl1RHIySGErVEJhUXVWcjkwNzV1djIvOHdsUmJrK1p6NDNKQkM4?=
 =?utf-8?B?aG9EdDFQeUdYSGlhL1A2YVdaNTZvYU82SHhucm5KY1Y2eXNXeTJTZ1h2d1N1?=
 =?utf-8?B?U1FGbHA1RVVsSmsyYU5ESWVFQlFnVGNhcTZyTVkxMzlocWczVEpac3hIYnRK?=
 =?utf-8?Q?2hzRaEaB0gov/JkeFTstyR5B4bFxstnA7T9N1cA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9c202d-704a-479f-049e-08d98d5e6446
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:57:59.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgbvqQORgHGqd9Y/u/QdDx7fmgUEYEZ8JmEcA5ZUatbKSvdNdMnkVPZCTPgcQJKsbVAM6C/svcZXHdBGlJrYpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5496
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


On 10/12/2021 8:48 AM, Lukas Wunner wrote:
> On Mon, Oct 11, 2021 at 10:24:29PM +0200, Lukas Wunner wrote:
>> On Mon, Oct 11, 2021 at 09:06:07PM +0200, Nirmoy Das wrote:
>>> Debugfs APIs returns encoded error on failure so use
>>> debugfs_lookup() instead of checking for NULL.
>> [...]
>>> --- a/drivers/gpu/vga/vga_switcheroo.c
>>> +++ b/drivers/gpu/vga/vga_switcheroo.c
>>> @@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
>>>   static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>>>   {
>>>   	/* already initialised */
>>> -	if (priv->debugfs_root)
>>> +	if (debugfs_lookup("vgaswitcheroo", NULL))
>>>   		return;
>>>
>>>   	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
>> If debugfs_create_dir() returns an error code, it does make sense to
>> retry the call when another vga_switcheroo client registers later.
>> I like that.
>>
>> However I'd prefer simply changing this to explicitly check for NULL, i.e.:
>>
>> -	if (priv->debugfs_root)
>> +	if (priv->debugfs_root == NULL)
> Apologies, I meant:
>
> -	if (priv->debugfs_root)
> +	if (priv->debugfs_root && !IS_ERR(priv->debugfs_root))


Thanks for the suggestion, Lukas. I will update that and resend.


Nirmoy


> Thanks,
>
> Lukas
>
>> It's just as clear as calling debugfs_lookup() and it has way less
>> overhead.  Granted, this isn't a hot path, but it's called on boot,
>> and the less code we execute, the faster the machine boots.
