Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEczOc+gqGmZwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:14:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E672207D9C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D8510EAB9;
	Wed,  4 Mar 2026 21:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iMDEf2cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FC410EAB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eor21zOxDcDEi1dGJSL8uoQpKgrXS9tYc7ko3oLkXu1g8QyYD1KuGvMwFjpkyzLK1MCNu2ugWwRmUxU3HyUEa2QB+ojsLJIBnPfDEKnwx52gbFTBezGz8nndnVgg/ANcQ+j/8PzvUzOP0KD0XamyQKC6XEQoChszOOJTrI/z8CY9r4s0AyX1l/PnHT4/qoYl/ad1QprWojWcmhC0WdtqaTb3y+HX/3JK7NoDpHf98O14DKfl+YXnrRKLKuW3zTqWnjm50I37/QvFmEb7vvx1GNHPSPBs15kqvwF6WKfHZiYzGhjc7iVy7UTJsNujY7AyY3YqogjGol81xleVHBNSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNiyC9pAUNIqjlSkX4yRyKAqcRIUP03nmke/sh1/yvs=;
 b=xicwEM4+17XcNXcZhKI1zKyEqF+Lfjfc1HOEM+Ub3L/u9iZpyrzaE4h2i0VjHcKL/IHONvW6aq3EZmnGvVlea0OQaAa+lQaFxflagFQjLTigOzNpuXbd8eImnNfCHjBqyK7ewA2F5p+MD3QJ1L2SdrGrGAjQqBhuNL3SFrBlMivjdHMALwwZMm1I2sUpuUsV8O0dIf1xhxwFnyf12GqAqT0FNumkOHa7c3eE5PDJLHzwoSiCYSIhMN0BAoRgQhQYmU8waYt8muAgReKp3rVbtO8nLs2c8SnloL1bqpbENiGjS/KrS0r9HmxkROoSOtFMDPhLI+G6eTm2u7Lguksf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNiyC9pAUNIqjlSkX4yRyKAqcRIUP03nmke/sh1/yvs=;
 b=iMDEf2cqsD1JDvzkIyOEEVB2kC/o4ewzWHSA2SM0WmQX45hwKrFoEnF4VkhF3BBKcQzJT91DdVqfqeE/5E2CSjBaLZm6Hx2qBiE/JvaMpsWjYTAKs6894C0wx7bhXZQ6m5ZGL84HHeTIAaPIGfIdLP0Z3r3ueHyxvm2hw+Eu2Vs8IxuG72Zz7fE8G+bfOPYIPBwBdZVDqs/xeaBCwOrL0j1piCffdx4Sni+PQ+oIU11T+6Ur8qbzdnAIXGuRIGfVFmeYUgRZcLTS9MAaBzsv4rSPwsVsWnnB2o5QWh1YgK0V0G5vlx223GtxWYPE5sAR7oJIZ2GORmlfBDzyigJ8mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Wed, 4 Mar
 2026 21:14:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:14:48 +0000
Message-ID: <82438c6d-6737-4416-96bb-6c81294371af@nvidia.com>
Date: Wed, 4 Mar 2026 13:14:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
 <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ded4ea-550e-4b5b-eca5-08de7a3310d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: sGpckgTr3XLGt3Ixx84sCnDi6WOy3aLnYt1qnXAFSw6EW2OQpTv8k0MH84C1hMDgLr5tX9ni9Zbygpozv8QkynvBdT/LHdzFAhGxhq7HlYEIlbgdlTiIWxsMu1xUbmFPygGUceNy0DQTd7NJQ8sUs5MuqlBQ4o+KiRO5scttUMGbnwZ7uLkz7GhGzbBE/AbNhkJoXp6s/dZC8TlTNh6nF5W6AL4SJYEg5TkiZfDBM2EXqjBtNQQDy+qeYfwYtS0blL3gJsyciCE5bT40WLfwqsGhp0ik3xIVeBomEXM2zBGnbguZz86oA2x4DlRYCMvOhim9PkNBySlL07agJcQzy3v+K3tGwed2oeVMKCyhq0K4RPqTD8St1JG916nE7EJKEi8s4iN8UBUsnTSnEvISagj8mlGR0K+eFwoMuST9GKU7seBjZRQySXcwqaj3dLVen3b15XecZ4du0BhW82UKdiK7ovCmgmn6tqqXqzJ5/bpXpBpR4/cnyj1lIe6pBjvEDf1g31UTiOjPrZ1LeBVRLrz9vUZ6ger2nfnPg7teLAGaXawXJoSM8K2hsannEoNbzg0jId+nr4/GJzCu2RulbiAUqSGY1YpIRUuSHAteUCXRiujSXi8nIgMI7MWtWy6RkYcXTQYKQF8nnVXrIA6t3ilXZ+GdqDFYIOuvdhnJxxaruTr7ongk0YNUovsd3iIGThYx1SawLF7FsCb7KftTe/f/b3GxHUjyJSZrZDyh5bCxwZcW2OP3JFHEDdtvY5gy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnQ0ampPTE5PZldRbnRCbXJqN011MG00SzJGWkZyZDNlQTc5ZncrcU5pNUsz?=
 =?utf-8?B?dWxJcXAwSzNZYlJMN2p2NXhNMURzaHROb1hjckpzd0czKzNVcmdzQXpFOCtS?=
 =?utf-8?B?c05UNlNWT1lGb3dNTTcxeE5xSytXeVBpcXFmV1Q0QVgyQ21Ed3pWM3hheFZq?=
 =?utf-8?B?dkZROWkvSXB5TFE1R2c1R0hhTDkvcm5GQWhqLzFXMGY0OVZHeE5nSTJ2S0lE?=
 =?utf-8?B?UXNUWmY4REdZcnY4ZnBXbGVYdDVXM3hoMmpCZUJHSDY2RUs0Y01tNm9QUkRC?=
 =?utf-8?B?SVJneDBVZGlHN1l2Z0JmYjVEU2FhcVI4V0FJYXZLakZVRGJxdktWS2VpYVpM?=
 =?utf-8?B?WEdrK3hZTmlqMDJQVG84VStCVUppdkQrSXM5bmMwQUJTVkhVY3QvWVk4ZmlO?=
 =?utf-8?B?dWNlLyt0N0hVWkplWlgrYXdwa0J0dFNLVnBYNVlCU0VZSFBuanVaUkVZSWZK?=
 =?utf-8?B?Wm0vUjBzZDExUStHZ2xGOHYwcWljWmtSb2lhaHBuN1RQanNQOFM5aXMyVUJB?=
 =?utf-8?B?RnZ4VHh3ZHhuOVBQM3hrUzRZRlNaU1Nub0ZGSmtjRTlkMTI1V0NwN3B3Vk9a?=
 =?utf-8?B?cU1seUlmdjZYbXJNNTI5NEN2RldQYlhIaXdZUFdkZE1MWHAyYXV0dkU4NHdh?=
 =?utf-8?B?Z1JPMVoya2ZDUk5mYTQyOXJVTWZyZWlHcmowajExZEZqQmJGWHF1Y1lZb280?=
 =?utf-8?B?V29XTU81ajJSYnZydFlyRTlSemZPbkxQNzZuZVJmdEJTYkRWa3FzRkdHbjJx?=
 =?utf-8?B?a0hBbWxjaDhtNEFRY0VVN1lxS2VabVpiUTNUelc4RUJuc00wWTdaUkIxWXFR?=
 =?utf-8?B?R21VR2ZGekNKbm44VWE3QStVRDlNQmxGVjBKeGxGbkVrK3VoMXlEWEZGRDRM?=
 =?utf-8?B?QU05dkFqYXluTVRvUlo5VHkzM0hxTVg1OTQvWnQ5V01Ta3J0cXBHSy90RTNG?=
 =?utf-8?B?Q3I4TkxSZjM3S3BlZ2VTdmRZT08zWnR0WnV5dXhlQ0hHem12WmtIL3AwSGE4?=
 =?utf-8?B?UnU2bjdOUjIwZHpUSlhsY1NmQ3hJL0RHWklyYkZMcHNLYUw5emN1ZHdFYyty?=
 =?utf-8?B?M3FydEFvREFlL0luS3haTWFta1cvdXNkSVdBL29EMEh6WG4wU1JJejJmbWZp?=
 =?utf-8?B?SmVrR2wydW4yalVSbTNDdnc1aW9WNitLT2dpWHd6SG1jNVJlMkVDK2tWQWpP?=
 =?utf-8?B?MHFhdFpqN0hJUVBaNForWE1FazZyMVltdmQ3ZG9FVkRhVlVobm9EVWlUK0Ix?=
 =?utf-8?B?MENHVkQrMjdsQTVGdFFRME9DWWJkUndRRUl2WmdxTTZHTFYybFZ0dExWMXd4?=
 =?utf-8?B?d3lGZjFBYWEzWk5reWdLMmRPdTE1NzVtYlNTa1M4TS9nRDEyaG80dVEzWVh1?=
 =?utf-8?B?eWNqNU5DSkQwNWZacjFzT0VXQTE1QlV6SDlSVUpSVmVuS0d2WTE4VFZabWZH?=
 =?utf-8?B?VUY1VEtEeS9GTXdVb3BxK0FTYUlPRnJtUEI4S051bkJHcTk3VS9ZUE5pRnkz?=
 =?utf-8?B?SFlHWXYxUHo3amd1bHQzT0NRbUp4RWg4QXkzdS8wc2tzYzR2M0dRVW8vZ2N4?=
 =?utf-8?B?TlB4eUZVMHZHMi9RaUsyVFZLQUdTMmtHcWxwdWpEeWF0M1FPRlo5blFpbXFG?=
 =?utf-8?B?MUF4SytoSHU5bjI0RHpEUHZsMUw1ZUMwQkdMWk11VHV1cGdIcUVGN2E0b0pW?=
 =?utf-8?B?MjlacXRxdnB3bFJudXFPWFNNREZhVUpxOEUzaHZ0dkFhZXgwSWRLSWpJZk5U?=
 =?utf-8?B?WmtpRW5pS0NMa2Y0WmZSYndQd0dsSWpXWHhCcnFwenFNaFMxVnFla1BUWlRV?=
 =?utf-8?B?dHUwRW1vTEphdzV1STFqUitkRFc0R2R2RmNTdFpENUNoQnl1aGYwQU1vR0Fm?=
 =?utf-8?B?LzdCVllDTFNVRjB5TmZvS05PZldsM04rc0dYUjByNnplU3VGVXl2SFVWNy9Z?=
 =?utf-8?B?TENRdWIyTFhoOUROc3pBSENPaWdRamxjYXRZcUpqNUwxTWVUaDFKQW1JaWgx?=
 =?utf-8?B?NjU4OXJNcTZqVURta3hIR2MrNTZuNm4wOCs4dldUY0I2VUp6MDA5K2x2VE1p?=
 =?utf-8?B?aEU1eE9VTWxrb0dhTFZ3WklxYVR1YTF1dGh2MGRCaXZLQ2dXZE5idjNqNURq?=
 =?utf-8?B?aDEzSzhDdnNzYUJvNHp4ZTZjckZYUUF6TnQ4UzY1aGpLQ1dhcytkRkVSR2ox?=
 =?utf-8?B?YVlSaFAzc0twQmhWaTVxWGZNNDRGMmpiQXFFQ0dFZUhQMzg5Z3ZLNzZta2ox?=
 =?utf-8?B?M2NWZlFNZElTKzRKMFM1Y1h1QXJrNEZNRkp0YmtOYWhPaFBnY0plektITWtp?=
 =?utf-8?B?MHpKMkFENHdIdWZCYmExRi83bnZhdWhlaytMTmlrelVPblpxT01Kdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ded4ea-550e-4b5b-eca5-08de7a3310d8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:14:47.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iApFdYiG/SFkRhnx6mdmjNRO7hemUZrpe2fEubksevbAIiyzImOK8SpGecICJMSD4WWeUJPwLYDpqk3FjEFK9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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
X-Rspamd-Queue-Id: 8E672207D9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kherbst@redhat.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Action: no action

On 3/4/26 1:10 PM, Karol Herbst wrote:
> On Wed, Mar 4, 2026 at 7:18 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Hi,
>>
>> I'm worried about this because eventually Nova will have to use this
>> mailing list, at least according to the current plan.
>>
>> The nouveau@lists.freedesktop.org mailing list is stripping Cc recipients
>> from message headers when relaying posts. Recipients who are Cc'd on the
>> original message but are not subscribed to the list get silently removed
>> from the Cc header in the copy the list delivers.
>>
>> This breaks "reply all" workflows: anyone whose mail client picks up the
>> Nouveau-delivered copy ends up replying without the original Cc recipients,
>> dropping them from the thread.
>>
>> Here is a concrete example. This message on lore shows me (jhubbard@nvidia.com)
>> in Cc:
>>
>>     https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com
>>
> 
> uhm.. I took a second look and your email address
> "jhubbard@nvidia.com" doesn't seem to appear there either? Do you have
> a link where it does?

Yes, in the parent message, here:

https://lore.kernel.org/all/20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com/



thanks,
John Hubbard

> 
>> But the copy delivered through the Nouveau list has my address stripped from
>> Cc. The rust-for-linux copy of the same message (same Message-Id) preserves
>> the full Cc list correctly.
>>
>> Could the Mailman settings for the nouveau list be checked? The list appears
>> to be munging or filtering Cc headers on outgoing posts. Vger-hosted lists
>> (like rust-for-linux and linux-kernel) do not do this.
>>
>> thanks,
>> --
>> John Hubbard
>>
> 

