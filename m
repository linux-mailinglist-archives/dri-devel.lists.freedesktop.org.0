Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFEHJ7JdqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5E21B891
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919410E359;
	Fri,  6 Mar 2026 04:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jJrEtgID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19C10E37A;
 Fri,  6 Mar 2026 04:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udAfRvLDm0MK+HUfZ2sKbI1l5NCTFf+wg/JxTeSZ31m67noYVOH8OZpNLoUyHYBQXpdEW1xnjX6dxRlE3M2uEP3eczBQSv+oNSLM6K4s3pa+o0S0sIkDToeWg/O6pmnTw8Svb3n+se4pxsJikdoLn0FPnZfoipAZB/F+Q9C8chjIEAtWH0EKJTNMZExHFO1hEIkJbZjEskUBneGYy5wR2u1NZxfBDvqY3wiwIdB2CH0O6lLDDxDwQyikXHuQNwyhVVPDWFvCafbmDGkLMP0wge6yUjas4fpBPxN/FiJmTf+EyuiLLNuS2HxaujHv8hW1W+vKVZRsOGwGYX+UhJCOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJHNqvj+vHIFOj+nbKza1C9BCWGxq0Yuhe0jCOsEXSw=;
 b=ffu8FKDGa8nKwAmGiIAVTH2/oflYL0l/ImrQDo495tuVDIxmFCI7DstYhz6Ku8g9S+qeemVyqxYL9dkjoQh3Ol2ojP/nEFFPwtMaozpgmewJr9jJVURdUM+H3dwAWFIQGzxH/wixgQPRbDWB9sLEqUJtI/DSbBx22DWIhKYG6NAk8EOlOLCpB8KyZvYY1nASjOgm4iYv+KT6k/SDlVMw36MRRCaTQOCa0KPplErgHPyI7SrUsVcy+07EnS/JxgDDE9QQOgdOjIpTjxxQ5NEneGmM+KH/6An7LZFF3HZGjY6P6NWuEWQ34pVjvCd5vTk4tJucbAUvFXxacDZcK8cDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJHNqvj+vHIFOj+nbKza1C9BCWGxq0Yuhe0jCOsEXSw=;
 b=jJrEtgIDJQ0L47GtxxQsdBJQP3elSLfkb5oh4GfS2IFgbh+63xY5tgcDAV+KajlnFpt1WI5aeAmLXYguZSiriULYAzXEayzCCQnlg0RDwrRvk2jct7esNt7drCAzNgLygjyZSheRv6tIJOptSdGUy7fUP09tHlvymSHrUR0lGbblH/oiKNivw6aKPqAV9M7W/PQWSQhPxAVRlXViBGHLbM7ZBZo38N0TuFLpjZ2gxzd+uZHg13DBxEFHrL1jMDizm6Q2tJOv/zkG80SJa+JojuqqggmpuXOYhkAlo46pYt5qZyNS81HvnpXNRh2k+EFYnHGQk5KFNiQd0TzrgHpi8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:52:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:52:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:40 +0900
Subject: [PATCH v11 03/12] gpu: nova-core: falcon: rename load parameters
 to reflect DMA dependency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-3-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: abab9dd2-5629-49e0-1399-08de7b3c3d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 4WUmug/Uq39B7qe1jKxYF9qUuQ1Qut1+wVJRRnzObvv4EyFMZr/gY2ULaRSMAHiKj3z9iFmXCccpCzbWCOKZay/jvr/RFEFodYzOgrfRxJLvEAsR8cA8dOWOD+m3SjXyL0OuQAa1zjOwgcvKZA1GgFbKz24f4ncsOzLTAzDnutqU4lRI5YFWKVhXdQW7MRMYH+iku9LVEwcbjniUb2Dl9bHkdnQFu+j8Ul+OZjgXSgdQ4utFrffePkmaKoNbw+lO3e1RFzhT3vxmiTuSXaUvBCCBf1gGhh/r19Wp+OFtPbh0IUa94Mhnad5iSkhd9iLsu3jUrrjzCx4/DWLQZk62uPVsTuc3WUEiHf94PtUzE7mm8vdu/l8QdXLj4LL3q97YJmvTYeGKShStbAoPKhKPtfWLXxSLEVjFizXy8Orel7o2YppOhIwLb/jZIbrTHYlMHZxbxv9B4bkZPYj/JloiTsQFGoX/la7Y6RiwOlh4xx2p3WA8YtUZ4TY2Y+hwOTxwxzD4sX3WpTA3teSESOpe13ytrIVUduo9G0GQ8sdsGYZGjFR8iM74IpbFqcPIznPjdKb5Czqk0jypZkTfI0wJ+6xlRu2rqVWN7vzuMcG59IX7ADClGUzzNimrCZ68nzLpt3NhvXbtekuoNOSQ+9MOTeoOsqpPAgDTrPI9jit/bBG1Z23rjFJGgMPESdex5wzbFE8AbPei7eY9gah81LNTDbJfe9NV7nFB1jFhsHjqwHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBNeGhhNUFpMjNlM0VLM1JxcTdmUTdwaXMzZTZmWXlwVnd5NnRIZG96Rm9H?=
 =?utf-8?B?TXNiYXo0RkVWdGtMdkhPelVwYUNxaXN6Myttand0eVFUdHc1a212dUhXd0Qw?=
 =?utf-8?B?WWJ3WHU0K1BPWUFOR1hSM3dreWV1WHhXbWxCc0RxaEdoczYwOGtnRFhqWWZ1?=
 =?utf-8?B?MFVHRncweFZ1Tm5FUEgzN005RDRrOTAzVlFEdVNIcHkxcmllZDdEVnBsdzVO?=
 =?utf-8?B?TXRxZ3J0cGxpVFFGUW1TaUh2ellNalhvNkk1UWdGUnF3QnlWRExOeHpZRjA2?=
 =?utf-8?B?VytLMGJJc1lucjZ1eHgzUmRUUkc2SXllV3FrVFRNc3h2R3pmQS9qT29qVmlu?=
 =?utf-8?B?L2hFa09MYUFQV2lQVkErN25WazFkcGJTalVJV2VLNkpmd1ZLK1hMdlhTTk9X?=
 =?utf-8?B?bVhXakprb3RYRjUwUURJeWQ2bXcreWVMalJjd2N3bTcwdE50MitwYzZsYmVJ?=
 =?utf-8?B?RmR4VVlzVlhrTzdBTlVkVlg3NEVzTGJORngxZHZGbHlGZFVhZnRRck1XaTYr?=
 =?utf-8?B?V1BHK3pYUWRMZlBVWDY3V1VzR2tKM1o5RThMMWZWc1V3TGVWWUNlamMrS0R0?=
 =?utf-8?B?ZDNuc1hmSDgrZEkzNVo1Tm00M25uZmwrZ0NzcFljQ3ZTU3hjREpOajlzSWhr?=
 =?utf-8?B?Mkc0eDlGUE1kdnF1REExRVJPbEM2YTNxYndza0hmNjJweTdqTC9ISUdsaHF3?=
 =?utf-8?B?K2J2SmJiblJTOVkzNFhRTTkxSDU1c2sxRmllcWEvZjFZc0lvQkdNV1ZNWXZD?=
 =?utf-8?B?ZlkvY3k0NFNNbTdTb0xqMjFySHNrckZGUEhIWXpmTkRvOFQzN2FuenJpTExz?=
 =?utf-8?B?VllNakJSN0s5cWhhdE1leWFOdjl5M0o0Q1pDWmc4UWFpV2NRZWJ3MjZHWkkr?=
 =?utf-8?B?alRlUExmeGFtNlVqaG9YMk0yVFZGK0J3bHdJMnB6eUR4UW43cTJEV0htNHlP?=
 =?utf-8?B?Y3dsWHdsaTdYdmZHZ01md2hpc1pubFlmbkd0VnZha2VWTU1KT1RNRmo4aUtN?=
 =?utf-8?B?ajlhb0p3bDhYaGxZSDNpNTRXcmVBVWVkM0dLbG82S1lxc2d2NEdmTUJkajFj?=
 =?utf-8?B?SldkNVZaWDhmWVRCYzBwdGtNVk8zQzdNelJFTXpkTkc4Zmd0TDJNL3lOYUpx?=
 =?utf-8?B?cy9Od0xleDJ3UWZJL2ppaU9MVzJrSTNEYmxoNWhncG1ESHN3cWNOcjBodysr?=
 =?utf-8?B?YXRqWUFxa1FCNzhYL205d0dvQ1g0YWMrcXNNMFArY3VCL2lzRVRNUmtHWGJn?=
 =?utf-8?B?aU5CZ3BvbDk0a1laMUVMTERtWTJKTHFJd2dmelZDODQwVmdOT0FrOGJMQmpH?=
 =?utf-8?B?N0VtZHdwV0lJbGRQKzlZSDBsU2dxTlRvRGtaRXdRSUw3cVNPM0loZmxGZkZO?=
 =?utf-8?B?UnBxZmxlVEVQNWYvejFkUVlTOU9CUHZ1RUY0eDYrZXB2aU40V2FLbHAyVDQ0?=
 =?utf-8?B?ODZjZFFtZUhKbmZ2QVJaRVlGMUhucDJmK0dmRXc3WmRCWnFVbGhFcndIQllr?=
 =?utf-8?B?SkNXU1UxR0tYR0hPTndreHRmR2FHTFhRQjdNOFpObDNaay9XNUp3dWZTbGlk?=
 =?utf-8?B?RTY0YjlZQm5yNndDVk55QnN6ZHdEWThDQWhwd3dwYWhaZlNWbXJ5dnRZVVNt?=
 =?utf-8?B?dXBUTStITGFGdndpenYvOTBrWVUrUEoreE5vTjJzdlNxL05VaHpLWmNjVHV4?=
 =?utf-8?B?RWhiWlBiemY3clRuSVdiWm5DNHRDWU5NWkpwc2hxY0svcytRN1liNml4akJm?=
 =?utf-8?B?SWtWUFdQSkxObjZiVWlIQ2YybXVzREhWakFUN0I5YllxOStUL3V0NzhRWDg4?=
 =?utf-8?B?bXRUMnJOa3RUSkR5MU5yTFFqb0cyWlpKTDMvOURjNW5heEVpYlNNWUJTMEp0?=
 =?utf-8?B?NytKVFNaVlRja3lCZm1SdnJ6T0pLTEExbnRHTTBZQ280NmdLM05GcXNCeXVD?=
 =?utf-8?B?K3kxdlo0NDZCczZpV3RnYjdhNStVWHh0akY5dFJ2bTRrSkRlRHRxUldkVUh5?=
 =?utf-8?B?ZjRhekJvTzRLRGw3Uko0TjFkSkRJbnpMMFdtbDNHbXhCd0JKNGFuZnVYcG51?=
 =?utf-8?B?Z1FkV1BqeXhjL2pFR09mYmJNeFlwcHQzWC9JNXdHM09NQ1pRYUZGS1ZRRVkv?=
 =?utf-8?B?Y05VLzNISE9yVEZCOFpKanRtZGpGRTNuZ3g0bDlQdU1Tc1hHbTEvZCtMOUtv?=
 =?utf-8?B?YVRTckhFemt0cGo2UmJFRkNqRTY1L01DSlY2ZzZKYWlGSzh0UURIUEhxY1hX?=
 =?utf-8?B?c29TYzZ0S1pKUEVPTDh0dzBxZFJmYmZDUGNNeXVxSUFGNUdOQ0x6MjlySUls?=
 =?utf-8?B?NnNuTUpqV3lvVm16VllGa3RnSDVYNlhQdkhhTnk4aXhDWWNEUkJzTFUvelhp?=
 =?utf-8?Q?Nwe1Ve/nUEolAYVxzaGwIYtyZkud45dWkTYOkeYYInoJ4?=
X-MS-Exchange-AntiSpam-MessageData-1: RlE42s9Lc3WrOA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abab9dd2-5629-49e0-1399-08de7b3c3d10
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:52:58.9914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbJLuN1XjLlng2Qc87bz60I9o9p+acy9uldO66mOAMlE2T9Mll3HYFbhiojQ+I1VG1DtPC2HZtEim3fryz2i0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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
X-Rspamd-Queue-Id: 31A5E21B891
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
DMA loading, but not so much for PIO loading which will require its own
types. Start by renaming them to something that indicates that they are
indeed DMA-related.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 19 ++++++++++---------
 drivers/gpu/nova-core/firmware.rs        | 30 +++++++++++++++---------------
 drivers/gpu/nova-core/firmware/booter.rs | 24 ++++++++++++------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 12 ++++++------
 4 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 31217cd3a795..9eb827477e5e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -330,9 +330,10 @@ pub(crate) trait FalconEngine:
     const ID: Self;
 }
 
-/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM)
+/// using DMA.
 #[derive(Debug, Clone)]
-pub(crate) struct FalconLoadTarget {
+pub(crate) struct FalconDmaLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
     /// Offset from the start of the destination memory to copy into.
@@ -352,20 +353,20 @@ pub(crate) struct FalconBromParams {
     pub(crate) ucode_id: u8,
 }
 
-/// Trait for providing load parameters of falcon firmwares.
-pub(crate) trait FalconLoadParams {
+/// Trait implemented by falcon firmwares that can be loaded using DMA.
+pub(crate) trait FalconDmaLoadable {
     /// Returns the firmware data as a slice of bytes.
     fn as_slice(&self) -> &[u8];
 
     /// Returns the load parameters for Secure `IMEM`.
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the load parameters for Non-Secure `IMEM`,
     /// used only on Turing and GA100.
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
 
     /// Returns the load parameters for `DMEM`.
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the parameters to write into the BROM registers.
     fn brom_params(&self) -> FalconBromParams;
@@ -377,7 +378,7 @@ pub(crate) trait FalconLoadParams {
 /// Trait for a falcon firmware.
 ///
 /// A falcon firmware can be loaded on a given engine.
-pub(crate) trait FalconFirmware: FalconLoadParams {
+pub(crate) trait FalconFirmware: FalconDmaLoadable {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -425,7 +426,7 @@ fn dma_wr(
         bar: &Bar0,
         dma_obj: &DmaObject,
         target_mem: FalconMem,
-        load_offsets: FalconLoadTarget,
+        load_offsets: FalconDmaLoadTarget,
     ) -> Result {
         const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 09b12ad546c2..677e1dac6d9f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -16,8 +16,8 @@
 
 use crate::{
     falcon::{
+        FalconDmaLoadTarget, //
         FalconFirmware,
-        FalconLoadTarget, //
     },
     gpu,
     num::{
@@ -170,9 +170,9 @@ fn size(&self) -> usize {
         ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 }
 
 impl FalconUCodeDescriptor for FalconUCodeDescV2 {
@@ -204,24 +204,24 @@ fn signature_versions(&self) -> u16 {
         0
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_sec_base,
             len: self.imem_sec_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        Some(FalconLoadTarget {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
+        Some(FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
         })
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.dmem_offset,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
@@ -258,21 +258,21 @@ fn signature_versions(&self) -> u16 {
         self.signature_versions
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         // Not used on V3 platforms
         None
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.imem_load_size,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 2b7166eaf283..c5963f79a08e 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -18,9 +18,9 @@
         sec2::Sec2,
         Falcon,
         FalconBromParams,
+        FalconDmaLoadTarget, //
+        FalconDmaLoadable,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
     },
     firmware::{
         BinFirmware,
@@ -256,12 +256,12 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
-    imem_sec_load_target: FalconLoadTarget,
+    imem_sec_load_target: FalconDmaLoadTarget,
     // Load parameters for Non-Secure `IMEM` falcon memory,
     // used only on Turing and GA100
-    imem_ns_load_target: Option<FalconLoadTarget>,
+    imem_ns_load_target: Option<FalconDmaLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
-    dmem_load_target: FalconLoadTarget,
+    dmem_load_target: FalconDmaLoadTarget,
     // BROM falcon parameters.
     brom_params: FalconBromParams,
     // Device-mapped firmware image.
@@ -370,7 +370,7 @@ pub(crate) fn new(
         let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
             (
                 app0.offset,
-                Some(FalconLoadTarget {
+                Some(FalconDmaLoadTarget {
                     src_start: 0,
                     dst_start: load_hdr.os_code_offset,
                     len: load_hdr.os_code_size,
@@ -381,13 +381,13 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_sec_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconDmaLoadTarget {
                 src_start: app0.offset,
                 dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
             imem_ns_load_target,
-            dmem_load_target: FalconLoadTarget {
+            dmem_load_target: FalconDmaLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
                 len: load_hdr.os_data_size,
@@ -398,20 +398,20 @@ pub(crate) fn new(
     }
 }
 
-impl FalconLoadParams for BooterFirmware {
+impl FalconDmaLoadable for BooterFirmware {
     fn as_slice(&self) -> &[u8] {
         self.ucode.0.as_slice()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.imem_ns_load_target.clone()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 7fff3acdaa73..d5bb7d279fa7 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -30,9 +30,9 @@
         gsp::Gsp,
         Falcon,
         FalconBromParams,
+        FalconDmaLoadTarget, //
+        FalconDmaLoadable,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
     },
     firmware::{
         FalconUCodeDesc,
@@ -180,20 +180,20 @@ pub(crate) struct FwsecFirmware {
     ucode: FirmwareObject<Self, Signed>,
 }
 
-impl FalconLoadParams for FwsecFirmware {
+impl FalconDmaLoadable for FwsecFirmware {
     fn as_slice(&self) -> &[u8] {
         self.ucode.0.as_slice()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.imem_sec_load_params()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.desc.imem_ns_load_params()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
 

-- 
2.53.0

