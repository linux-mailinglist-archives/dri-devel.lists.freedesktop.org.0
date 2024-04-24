Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197458B0849
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B44D10F1E0;
	Wed, 24 Apr 2024 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aUraB8ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E097610F1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 11:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E06A7sk+kQUN2tTDq5cUVaicMbJldeYTUs7WTLiksc3rdEmKp0M2URGwzXLE93n6gQx64JHhsn7uKDhxYPRj+NtlcygekCb2Rkrd9q3jcQFEodEiSnJbu7UgipRAse1KQI1Skh1cjIUP1rBwuAX4nDQmLbvuUf1ZZd77C61JZSeQzhPamch+1tTzxl3vP7I2mnPtUOCe+1swm4ojL4ehYXmLOHz+vTL4JtT+5GLCIFrQTr4w5VRjzZvYpV1PwFybeV1T/kBNVwQDonEfyEFcbOPYO0aroPEGL5LStIx/Vm/dfM8Jo+qNwnLf+1RJmTm7k/VOkAZwz8fUKaUCTW1l+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBw6+ntN2rfz+x2uKkQOE8Te2XoN/bfylndvQCt4NLE=;
 b=JiWLztsadzw8MberbNb/QI3TCp1Aundn8Ph2DkW2hSg3u/jgtgIPTmndMb5RQcuRR5yuEqD2J02Wh0/C9MCtWOsUMHGEugg0x8kjoYQSln3BKGuB9oYrkb7e/gSOhFWNEvTXe5QgupCwF7/Ck7gCSncExZXZhzc8MoyPWRCuEIgS3E22r4iHrTs0/rbKcdkgCV+1uHyvf8jXE10x8yI4dOZHigDiXSgcizUGPbdZRQUkaPSe1UmFmQDBeQtAl1ykv1W4g+dwCZ1XB0mcVZg1jJhX3OsGVqL4nUU4/G4Cd8K2m1CGzOcGb3q9JrO3GuHhjsskX9nAywCt0Cs5wu95xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBw6+ntN2rfz+x2uKkQOE8Te2XoN/bfylndvQCt4NLE=;
 b=aUraB8yeB1ksxtildMH5iy6nAJoyIJJyrc2AveMK5Crg7dL1Yn0lerICfS4sfvb247VWfx9TWYPNolfJS0ALb54wPhnN0RG2yYLa3VN2FxF3fkAd6H5nNRadxIYg/8doAWCeyyFcjhh1++ciVtnoTgtr8oUT9xP7UC650GHYt2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 11:28:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 11:28:12 +0000
Message-ID: <72f5f1b8-ca5b-4207-9ac9-95b60c607f3a@amd.com>
Date: Wed, 24 Apr 2024 13:28:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] dma-buf: fix race condition between poll and close
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
References: <20240423191310.19437-1-dmantipov@yandex.ru>
 <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
 <3a7d0f38-13b9-4e98-a5fa-9a0d775bcf81@yandex.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3a7d0f38-13b9-4e98-a5fa-9a0d775bcf81@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: f69a25cd-36a3-4e1b-bec5-08dc64519fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzN6cUx6TjBpSW1FbTlyTGlHREdLelNacGpLVDN6a2pKbm9YSWNZcTVKT0Vk?=
 =?utf-8?B?TFFjQ3prcXJvSHhJdWs2SGRYN0xxQ0JuazlqY1IrQlN1R3JVbXEzMzJxc05x?=
 =?utf-8?B?VlRqazJQL2kvSUdCNU4rb0NnUnlWQVFwOUp2VjdQWmpBcHcxakFnM3NlejZT?=
 =?utf-8?B?MHYycGcxS2w0Nk1oMG5ZYURCZEFQK0s4K3ZTMjdHend3eGdjS2V5SGxPYlpu?=
 =?utf-8?B?NHZPK0p3ODBzdlhvQkkvaHF5UUNpWm1YUGdhbjF6NUdnSlZJZnRQeU9wR2RH?=
 =?utf-8?B?SGczUlhHUGRQTHk5RVV6OXlLeW02TTlRYldEUUZERXRmVG5WTHl5d3Zsd1hN?=
 =?utf-8?B?OWZXT0dHZVVGY3RRT2lvdURHT0RIdW9mdG1aOFByTldCQUdIWWZtN3p4OFVK?=
 =?utf-8?B?L0NyalhPWjFlT0JjeExhanBXWlJnN01QSlI3RWJvK0pYdzF1alJPYUN3UDVO?=
 =?utf-8?B?TkdJbU9MU2cxYjBBVEpQb1NtQ3V6anFKa3RrQ2tlUDRpUjZwSzNydlRpOHFa?=
 =?utf-8?B?ekF3KzlvU2VxOXBBVnhZdmlqdEd6djhEZUtOajVOOGE1aFhaaTluQndKQzBU?=
 =?utf-8?B?bExmYWxBemRqbndiSkowdkZkT1I5VjJzMVoyY0VpRmwrcFJVN09CUFNzQzFy?=
 =?utf-8?B?RGVPcCt4UDNMNFVaMzlUdmRVeUl1WGd1OXk5c0FOQktZNWt6eWZQazFZQU5C?=
 =?utf-8?B?VEd6R0NQVC9jS2kzMkp6ek9CNnNTU0V3Zm9GMUVmN0Q5ajN2MVQvMCtuaU1q?=
 =?utf-8?B?RkFIc1Y0NU1SaDM3NjdyMVkzanY0cVpBeDFMVjdGN2x1VHdYdlQ1UjZrazdl?=
 =?utf-8?B?cVRLdzhMVjI5V1BXcExUSHlvcVM3eVdZWklDcm4zMlZPZXFyVFdlYUt3c2JU?=
 =?utf-8?B?TW1qeWM1c014dUMwOSs5OFVDZWtxNnNyNGhxMXFpaFg5QjlxYmEvNkNJZ0k4?=
 =?utf-8?B?YkNEcmZTV2RLa0VTRk42cTNEZXlYMFhXeEtsQU45Vm5sY1Z2ZXFFRXI4SnEz?=
 =?utf-8?B?dnQ0M1pYeHhCMi8wTGI3ZzRBQVAzbnpaMnUxRkVXc2dvQmNDbEZ2WWNzTjZ5?=
 =?utf-8?B?R1VSbmlvQlpkU2J4SGxMUUUwMWNHd2JXWHU5VEN1Yy8ybURkSDVhUGVpeFlP?=
 =?utf-8?B?cXhrK1Jmb2xabUp4WnpnWmxQWHVNS0thTG1qVGdudy92THNJRitOeFZHVmlq?=
 =?utf-8?B?bEFDWHFsakwyNkhmR0FjNGtEZmNrTEFZb2VJMk9kU0o1cmJjdTg3QmNGcTU4?=
 =?utf-8?B?eEZmUTJOWFJZQU5JbGE5a2JTaXlTRnp0eFFIdlRqdGllTnp4bjI4NWNRRktD?=
 =?utf-8?B?WklLOXlNb3NrcUdSb2R2b3Jic2hwYUR2ek9KRk8zbUFHcTFLaTd0bTlEVklP?=
 =?utf-8?B?L2gyVlJOSHBMTGMzeGdYenFHaVN0QkdMaEdsUG1CWnA3a21wWUk4ZEE4Znc1?=
 =?utf-8?B?RWJSb3J6cHR3NWNXVE45dmViZU1zbXJYcFJaRHVwTlRmcnVFdExHbEVabFUw?=
 =?utf-8?B?d2pmMlpnU0hpUHNZbmFobVFiUWU2aDFKRWt5NjVodjkxMVQ2NnF0dGJyOG9G?=
 =?utf-8?B?bm5OVmdxYlNNNkVKZUZkNzMyOFRBYWVncnRXendmVFVoODQvWVFmc2JFVlla?=
 =?utf-8?B?R09iOXhTOWNwYlZoRUd2VURUL2lVT3lIU3RPam0wcG9NV0RHeGtiTkRaRWJh?=
 =?utf-8?B?ZXVBd1dRamhPTTJFVGFrVUhLU0llRlNvcTdqdk1LaTJQd21nMGNUcStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHF2QWNMZDRNSjBkdGpFSzd6NXIwQ3Q5V01qLzJXZGJXdDVlNzk2MGRGUWZT?=
 =?utf-8?B?WUwrT0YrY01UVkxrcWtYRFFRYXArVWRZL0lJZEFzMWNVZzM4SUtTazJXNEw1?=
 =?utf-8?B?Q010ZkFRMlJOVy9ubW9xT1I4ZmFZRGdGRmkybnJSc3VaUmZhVitMdWlBZEto?=
 =?utf-8?B?NEIvS2ltZm5oZmxvNHN6L1BTN2JDNFVoaExrenZ3WUFXUFZ1emNFaXFTVmI2?=
 =?utf-8?B?SmFiem1JWXBrRkMrbkJlZjBaMVBDY1VFQmx4UW85bDAzV3BtSTJGVzR4Rit3?=
 =?utf-8?B?cmVLU1ByamdacGR5ODFwVHduai9Ra0J6UTNWSlZTMGlmYnBwOWNUbG4rVDgr?=
 =?utf-8?B?bksrNWw3Y2twa2hNcXBSZGhPeFdRNzJRZk9zWnhRQmZUbnIxZllUbXB5aUZK?=
 =?utf-8?B?L0F6N0hLeG9SMHFhRC9HdWZCOUV4c0ZNemRaNjhLbjZzSEV4NFF3aS96bUI5?=
 =?utf-8?B?WVJGZ1k1SHp2d29HT3hPVEVjVFBBc1JhdDY0MXRNem1vMUVnU0NlYzlNT1ZU?=
 =?utf-8?B?SXhpMjhORGYwT29ka0FneW93dHMxWG1DWTUzZ21GRXc5bGFSRWR1Q3hSakpL?=
 =?utf-8?B?TG9uWEN6MW5pdjY5NnYvbE9kVW5IblVyV0lidDZvWndrektWQzc1MG5NcEZ6?=
 =?utf-8?B?UkZ3eHMvbE9jUVF6S3hMUm1na0RzZ0t3TlM1U2tseHh1YngxTEJ5eE1YZzNO?=
 =?utf-8?B?OXBsdFhkcDhkWUNPUUI4Y0lGVjhxVVZ4cEZKV1VhZGMweFNnZDdXc0oyOTBM?=
 =?utf-8?B?bURuNndiWXovSVJ6bXUvVmlYdm1tVEpJbmhZOE5ham1PM2kxYWJYMERaNEE4?=
 =?utf-8?B?Mkxpa3RDSEZVS2ZCVXVNbWVMUnY0TUV3L1pJUTBxOG5vRVRDL0NmRkUxNFBU?=
 =?utf-8?B?RHhwNGxSTkt5WlNkNTI3emRPRlh0WmV4TmE3ZXFLVHYvVzk4K0lDV1pyOHpx?=
 =?utf-8?B?QlN6K2gwRnlQY2paUHhZMlN3VElHSllIMC9EOHBEL2dWTlRxNGhqTXkvSEgv?=
 =?utf-8?B?ckVPaHNsWFNiNU5VeFlDanFpMmk2cWhxMFNBNjJkb1dZN1diY1VvblliU2dx?=
 =?utf-8?B?WDFmWFFnNTV2T01oY2Fvb2xFNXl1TXRWUEtKZUtLYzlaRm1XVlloVEQ2c3pW?=
 =?utf-8?B?Y0lsREc1QVVhM1FGT0x2ZkJraGdvWEY2ZDVsSVlSaWNxU0hxM2xnUnJKSGNy?=
 =?utf-8?B?d2VBdnpaNkRSaTYrUFVnN2hwM2g4emdyVDJiRkM1VnltVjhDbEY2VGtYalhh?=
 =?utf-8?B?M0VHNlhMUXhiMVVRd21zS28wUDRORWZkaHpBNWN5emc4Wk01Z1VUM1FJZkY2?=
 =?utf-8?B?aUVGYWFuVmFNN0UyTElWMlFEUHFXWGx0MDlmVlhQY2pIVExXaklwSS8vTlhh?=
 =?utf-8?B?U1dHU3ZEUnZsYk9PZUVmMVRicEtmQ1dHcGFNeDlhQTYxc0tlZ1lWMzNIalhr?=
 =?utf-8?B?NzNjaCtEakljVWpEbU5qd1U3elhKNGd5UXUzd056SjB2Rk9NOFhtZU82Q3gy?=
 =?utf-8?B?L0h2WE5ZejFCTnpISTVQWEwxTTlqS0xmR21ZR1FTdG5IcktIMy96MG9LbTVN?=
 =?utf-8?B?TXhVK0Vjb1d3RHErMm5hVXduZit4MGVmelRrbFJNeE5keWFQQ0lvMC9icUcy?=
 =?utf-8?B?aUxkVkFFZzBTMkZjUzI3T3BxazR1QWxoVi9sN3ZrUFgrZGduNmwybzJxaExV?=
 =?utf-8?B?ZzhGUVVvWDZxN3F3SFN2T1F0NlRCTGRGNWU0U1JVTEJPWEt4cWJjZWl2QU9V?=
 =?utf-8?B?SkJpUUVxc2tVejJzRWJhTGhobnpzcVRNWXEwTzNyZnYrV1BIelRSY3YySFZl?=
 =?utf-8?B?ckxoR2M1S1R1Ujl5eHZ1dUlBZ01GRjRhLytrV29MTUJ3NVlNUUYyb3U2cTlW?=
 =?utf-8?B?OENXaGFhekFhZDRKQkJCMVlCTEJXRmV2SjJoSE1WUXdQUEx5U0JTZlpwZ001?=
 =?utf-8?B?eFFUMHR6c200YVQ3Sy95TUdqdWVTaTNJQ0FRZXhLVHVWdjFwbkwrZE44cHZE?=
 =?utf-8?B?NzZacnV6ME1yVXErZDFxUGlSVjFjalVKZDZHVC9wZU43RTMwV0FRQUtobzR5?=
 =?utf-8?B?U0IwVFJweG9ZSWxPWklGdng5Y2NKOTNud1BseWZSREM2Z1ZPa3BGZVQxSUxQ?=
 =?utf-8?Q?SNHNkfcHrPoPbkM1RccYHOYBj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69a25cd-36a3-4e1b-bec5-08dc64519fe5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 11:28:12.0509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlwlhtv/Od8B7TIGRe00BKc/gdhw1tHMAVsvOAfZoqV5AFe/VniaiSueHwjgXrN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667
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

Am 24.04.24 um 12:19 schrieb Dmitry Antipov:
> On 4/24/24 10:09, Christian König wrote:
>
>> To repeat what I already said on the other thread: Calling 
>> dma_buf_poll() while fput() is in progress is illegal in the first 
>> place.
>>
>> So there is nothing to fix in dma_buf_poll(), but rather to figure 
>> out who is incorrectly calling fput().
>
> Hm. OTOH it's legal if userspace app calls close([fd]) in one thread 
> when another
> thread sleeps in (e)poll({..., [fd], ...}) (IIUC this is close to what 
> the syzbot
> reproducer actually does). What behavior should be considered as valid 
> in this
> (yes, really weird) scenario?

That scenario is actually not weird at all, but just perfectly normal.

As far as I read up on it the EPOLL_FD implementation grabs a reference 
to the underlying file of added file descriptors.

So you can actually close the added file descriptor directly after the 
operation completes, that is perfectly valid behavior.

It's just that somehow the reference which is necessary to call 
dma_buf_poll() is dropped to early.

I don't fully understand how that happens either, it could be that there 
is some bug in the EPOLL_FD code. Maybe it's a race when the EPOLL file 
descriptor is closed or something like that.

Regards,
Christian.

>
> Dmitry
>

