Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBbCMCF3qGkLuwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:17:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E12061C7
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4ED10EA91;
	Wed,  4 Mar 2026 18:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVgbH4of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09910EA91
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 18:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXpwzueYCDg8+JP6iMMXimHoJiGRKf+WlxMqLt401APqn6rvyoHvNjIZ5QCeTNQ9Sp0Ty3lgh78sXN8SFRN8BVfZqyv3A7eu8MWKXa+n8z8iES1EMN7UKy64hFik1CbbZBEJMB8v9SBCZjybMpACp/mf50nCIqA0LE9BngsO0U5pI4jyV0nKR/XVNhJ8mCktbZImjseorP9zONJ32hJYNhsKjFC/gwyrVSrnYn0PKms40QKoKvE0ZZXCLvq1aqmXXfjgmOZ0C7PSgF1fj9gfXEH45Vh3NeOMCRSnDAqE+vfQrbSVUONAU5E51VqdGDNtG4H3i/AUkb+s6STFywi+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq/RP7iSmvhLPlujBjVb9gnTXO0OivWzmEc63CK+6Rc=;
 b=u8iTLQTWuNLHmgRg0AnneHxdBBo5ZT+dJrMvpfY6DozYcKh6pgj3NL4/mOFc6M9OA+0PKUJMpem97UQ7YCyj0n1uexQbwd/dufIrPthDJ+xvklvU4/YFy6bKnfq9nn7rhdKkatCdAp4pZFvP+FvTeo7/HMMySkgRXVlPMmp4QJ+82bDjQceSoCWW5QpLbHcbu+XNvj91CBKeCaqFzELYe0agLFBI8jk5ltDc/IQIMJfDfOEt7vOxOmQ2Ggyo8MfkbO4PPhGbQiyGc+dGnp5V+Bb5Zb3cirIr8WSyysEAi0Yw1AAhgGyQaTH7LWqmEmO0TjH+RG/Egcef+ONg2UKhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq/RP7iSmvhLPlujBjVb9gnTXO0OivWzmEc63CK+6Rc=;
 b=PVgbH4of6bYP67ny99wsmW9HdILnqRxsSm0ajFAYTtoufHKc/ESDY6SjkI0l8JPjlyokhmHV/fm+boYpSHFoePSUoyCEQL9KiJ5XQJS9UIhPvg5U3VpwlF9DP8AyBz3ssWXPwX18tM34kH+kM4ezhSZtzpYnrohdLysNvH2iwxl1N/qnMCGlxqpEib+wpJbhDtAYFmzMJwy1PLDqBLiInyvUlrZHmfR1/rxQJyKyc8PUYWrp9TQHkv9bmqrjfC8H+00aFbMn4+irEjP8KFeDt8DmRq8fkTlxOXg5zeMiTCcyZ6mnPmYznxluDTWeSnw645ynBsUfq6bmFJ5vKKiCaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 18:16:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:16:54 +0000
Message-ID: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
Date: Wed, 4 Mar 2026 10:16:53 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Subject: nouveau mailing list is stripping Cc headers from relayed messages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 972b258f-249f-4317-d5f5-08de7a1a3707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 3F6gJxFDDi4uv+L1moG0MzmQ78xHa79eCn5YmfNIPFNNh3bGZOGJd3W6XaIudzynckcjK4Hb38ncFrOvX1uxqZPERJZZ1sZsD62DYrRPxdiyzi5vkwoJCTFylvg4OQrKyperIfhyoO6llR8P/yR5NLmTkjIzz4/9vOo/wXkUTxOQaqi3DUOgTu2m+pt3rO4jk7O5RQwIiLFcx4Ld/9YX/igKm5UizHqsQc487PQFUKHsn2eUqE1rY4rKwas1ZRj+CTg9ICWnK3q/OTQ7udtZD6nKRWBxOBXNKBSs8EQlOwX1G+D4bkUp8Um77OEH/us5vEN7tvTBhqpB8i9VvPioqRQgyxGaVUGrmCYeA0PuzoNuxljX0rVU50blyXp06NVQl7RmzjoOh6JgWC1fPVTaI7FCXx+OKgfj5AspSlmim3y8qp+bJHnVu5f6pSDHJ/BFkf1x1NnBI+Eds0fyQlziyj9rT7RNfmRKbvRHZAW6UoCgtMYPKOIkc8lkZzaB4GJXcHHNvJ8xTUqrjJ9Wxvr7hyJn+igYIUV9nwTxVsm3dab3hZT5LB5ulIwp0Itgb1suJQ5/WEYabuVyfQnhYKLhZT91etsvQ9MUSOvo/CjhzB8OMJMyJvXcB+ecKEd7lEI4ZQPiBy/53VezvaSdhXBS+rPMCUV0QTOnzREBv/e2ZVuSl3hqq7BUl5F4e3BFKfM2E8dxSoj5RSfoCcUALRwLwY5wFnZai/BtImOzuSdlS0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTA3ekVFSUxxZjFOT0UxMHRHQ0JZb0ZzaWZEVUtPL1dVY1lXNmVMZnlPN1JL?=
 =?utf-8?B?Sy8vSkR1cGpTUFhHb3BXRlQ2MWIzQWVRNjVraFhEbHB2T24vY0xEa2hQenk5?=
 =?utf-8?B?bkMybzI5MGo1Z1JqKzBIV0tPS0VVL2lRV0tvV1lNODNzVDdTMm9tL2xWSmFo?=
 =?utf-8?B?N2xQMXhVSm0rM21WeDBkYXFKMVNteUJlcFZJc1Z6Uk9URlRXK0JDdExYNGJY?=
 =?utf-8?B?aEVrWFYzWmxtTzBvSGJkcGpVVG5HVVQzc2I3UnNxWnFsOVRxNnlpblc5L2c5?=
 =?utf-8?B?R0RVMml4WGltbnVFY1h5TWtLalY3REhCQ3B3MkxRc1dEWVZrUkFIZlJ3NnFt?=
 =?utf-8?B?b0dSMStvZnlqbGtubFBMTEF0NllJNEkrUE1mU29YSEs5VTg3MG4yMWorTzk2?=
 =?utf-8?B?aVlmRjB6YVhPTFhTckVNVFZBMnNFeFcraWVHS0diaXVhbGpvY1NCenhnSEpI?=
 =?utf-8?B?cEI4dlh2UnVDak1BMmpQdDh4STN1bCtzeXM2N2cyWVBPc2xsTGlIc3lZeGRl?=
 =?utf-8?B?S3QwUFFHWEhLTWh3N2JGR2pnczl2bXlUbzk2amNkekhWRkVkdHBPcUFyMk5Q?=
 =?utf-8?B?amFwdFNtREFiSk5jd0VpVjRHSUtYUFJtT0hCWGZEWGtTSDFxR1hqeUQ1ZUxF?=
 =?utf-8?B?WnFoZHlyakFhSCtWNXNxK0lvSWdMKzl3MEMvWnN2ekNmOExUbnpGbWpKMnNP?=
 =?utf-8?B?dGtqL2Rxd3ZiZUZoVndKOXJyZ1BQMWpkcmg1QUd5OHdjaUxBSU1TQVFBd3JI?=
 =?utf-8?B?ejdxaXU3TXJ5WWlmZTJ4d0ltU3lLMXUxV2Y5SURaNW5ZUSswY0JnS1JqeFpN?=
 =?utf-8?B?RmpyNi9mMEVEdWhlT01jTk5sUzZEYUU0eDBNbEhoUWY5M1p1MWFjcmdxL0Ja?=
 =?utf-8?B?dVZubEtCS0lGaEJPRm5ZMzh1RDlsVDNTTHdEdEpGT2ZST2htTmFvanhzcS9u?=
 =?utf-8?B?Tzh3R0dIMExpSzdZNm9BTDZXTXp3OS9DVWxqcVdRUXpGMGJhNHZBYmxtUDdn?=
 =?utf-8?B?ZVh5RUdHSDZhNGw1TW1vTXdEbGxycnpSM3kraEtBYzcwUE54Q3NxdFp2aDc5?=
 =?utf-8?B?RlFRYW1VVEFLN3pVQ0ljMjRjTmdMVm52R21RVG9Sa3Z2aXpRRW5IR1FwMDFE?=
 =?utf-8?B?SGErM09MRWZTVXBDTm80UThuOFBSSVo2Rk5kYXJOWUo5VVc0elpQbTVBOWJX?=
 =?utf-8?B?SkU1RkV5ZVRUU3FJbEh1Z3d3cTFlUHRZMEEyTUlZekhvQzJLT0c5ZzRleFBa?=
 =?utf-8?B?ZkNvcEFRME9Jd3VyYXQyeGxrTm5EakhDbzBCZVpkN2QzdjRFRXdsWTEzSUND?=
 =?utf-8?B?MUpwTmsrK0UwTEx6MUV1R3NrSHBucjlBcEwrTG4zdVRMOGNLeGxzN3ZZUFVC?=
 =?utf-8?B?ZG4yZE5hdFF5SGRHSnViMjB1djFMZ3BZQzN4VnZ4SU1MQlIzdUZIeUhwbEZU?=
 =?utf-8?B?aHBvK3Q2QmVCcDIxMy9UNHhjY3NINEVRenNWUjlzblJwNVpxSXVZQnJJN3l3?=
 =?utf-8?B?RkVtM2duLzdFMmNsNVB6ZFo4MzhkbThLSnhJdDJqa05mSFlrNTRaOHI1Q2Iy?=
 =?utf-8?B?UDY0SlpoQWNGL0dQSzNvQ2pqaDJSSG5Cd3h4OEd5VENpMmU3eDh2VG1NY0V5?=
 =?utf-8?B?RzZ0TTJXbE5zaHFGYTBpdmhaWmppQmZlL2g1VUxZUTN2cms2bThRUUFEbjJD?=
 =?utf-8?B?RGhXS21zOUtUT1grc0tzSVhLQUk0NWxlU2x3RnVGZTdjWG9tcjV4ZXJQR0Vx?=
 =?utf-8?B?Z3NiamVuZzhtdk9reXA2VnI3YmRnZHhMUDNmcmJZSEY5bnNFcG5jRktETFpS?=
 =?utf-8?B?eVpGOWpnWHU1VUkxSk9kcUlQOXRLY01lRTRaekZMZkU4VXJqdFJXa0ltWGRM?=
 =?utf-8?B?czl6V01UMFBaSFBxc2p6OXdVclErRzJ3VHVFdzBFbDdWR0lxK3Z6cnRHWjdZ?=
 =?utf-8?B?Z3A0eFhJajVnVXNqd1lhV1dZR2lNZEFrbWcwYy9aWFF4TTJPbGNlSW1Yam10?=
 =?utf-8?B?NG1IRjVnaXZXSnN4MkFoUHVYT3hiWWVxbG5WOW5TbGJGM21FbUhEZ2FnZnZN?=
 =?utf-8?B?Wlg2Y0hxOEcwd0piYy8xYXV3QWFTTERSaHdXUkhUWGJQaWdvMkpwVll3ZGY1?=
 =?utf-8?B?Z3VEclY3a1lQWEhwZ3EzcHgzUWszTmMweEZCNzhBZUh1YW9DYWFVWC9mbEZ4?=
 =?utf-8?B?cjJHODF2OG5XbktkY0ZZREFpaE95WXg0RGxBVEpucXlmUURLajU5THV0OVJy?=
 =?utf-8?B?R0hBZGN0MlRqMUJQam04R2srd3ZvMFJ2RGtwUGRaZTNkTm5sZ1pGRTk5bDVn?=
 =?utf-8?B?bVpWSERMeldWWFluTVRPb2hWcHo1WnRteEJnUXh1bzdmZmRhbnJvZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972b258f-249f-4317-d5f5-08de7a1a3707
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:16:54.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c51aEYJh9bvA77GmEA5fabg/UL+uFwX0UTBfQweS0fB+tMx221WXsfMeIjxV24W0XZxBW/eyRHUqYu0qPmL/7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
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
X-Rspamd-Queue-Id: 1F7E12061C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

Hi,

I'm worried about this because eventually Nova will have to use this
mailing list, at least according to the current plan.

The nouveau@lists.freedesktop.org mailing list is stripping Cc recipients
from message headers when relaying posts. Recipients who are Cc'd on the
original message but are not subscribed to the list get silently removed
from the Cc header in the copy the list delivers.

This breaks "reply all" workflows: anyone whose mail client picks up the
Nouveau-delivered copy ends up replying without the original Cc recipients,
dropping them from the thread.

Here is a concrete example. This message on lore shows me (jhubbard@nvidia.com)
in Cc:

    https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com

But the copy delivered through the Nouveau list has my address stripped from
Cc. The rust-for-linux copy of the same message (same Message-Id) preserves
the full Cc list correctly.

Could the Mailman settings for the nouveau list be checked? The list appears
to be munging or filtering Cc headers on outgoing posts. Vger-hosted lists
(like rust-for-linux and linux-kernel) do not do this.

thanks,
-- 
John Hubbard

