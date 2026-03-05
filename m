Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKzmEcPhqGnzyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:52:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5620A022
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD3710E1C3;
	Thu,  5 Mar 2026 01:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NAhPV39H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010065.outbound.protection.outlook.com
 [52.101.193.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7C10E1C3;
 Thu,  5 Mar 2026 01:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMIV7TarwrpSJXhmt/KVwNjAw2CUPC2tHkgBr597wuIPrOO6WXaPTgSSg20hTnUqdn95x1+egVO6BLKuKr4sac7mAomywNIPvwT1y6Yksm1XFqYD2m0ZdyrqLUNRRuGVoZsXCXBOeKCrSgNhFtGI/ObRJSFIa6n4jkvTKYeV4mCFaueOReoS6J6aHSlkU7bV86TQoJMHCa8B83/fpG8ZedunmTWHcs0kVjmuz/78AEjwDOX0IdcRViEr5ZR6Pv87aLRRneU5AQLzQ6SQKxZbrKynHNIve4oy3pBv6ks+7DnyY8ZwhCdaQyFx16WPd+VR4R/1emuZDD+plNLR7bIHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj1wRG0ILBeTzoHXjd180ksDlHVy7S2GynLSV++vPhI=;
 b=ODB6yrhSVBxOi2Id8OY4+egmtOKQhIXvWiU1iukZxv89RN9qEuHYU4/cORumeMYRvoqar6sQQnP8UyiHDACcxgWyE41OdthTKMjvgwRhxCc0m5LYaA6RgPCVnfh7ctyHbMMlzHe2oh5P5uKj6hQHIEh+1pE5s2UhM/wZBMatPFicS7IgvS6KzrVudhWECEbz2Mzsoq+UYZiz6/KU+/0UUZhOXVMcRI5q+ctAo+nbaGugP6jr3n6of+x8zGcPTDKKTk5I8eRZ3y1XZsO8zxsPnjV46nQ4g10Gh7b9k/MYJs91Dz1ukSlQ7A4cCa/mPAdHj1uEXaigjfmgtPbeauszng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj1wRG0ILBeTzoHXjd180ksDlHVy7S2GynLSV++vPhI=;
 b=NAhPV39HXI5xKbXAUjYzc5JcBxPXnjlWo+iS4nfzpbWfDRlp/6EU7yfSaIkh9ZjcDKbTcW/v+tM77q011e7yb7xXzjan7wIUhhR6STJe0A+dazAWlJxwzlxC64DIwf7irdfvqvQEcGIjnFxh4RtBJAJH2w+H3wIHcPl+YrZZMj/CK6+P/OxGd+sxFZHovHcMq2PNp1xFRp++fQLHInxfsS2h1MNnmvWbmrRf7iaeXzVI1vqKlwpPZr/bvogURx8IjuEaZGlvyL8nIxYFavxCb5Mwjis3p9kkeJarWz00YSNt96CRcORr86Pr8KfvmteBQaGYm+Ms3L5KicVO3wy7tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:51:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:51:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:51:47 +0900
Message-Id: <DGUH0U0Y7UPS.2CKG9N68XZYH1@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
 <DGTZ9SNDPDMB.1MGVRZEY29WKY@nvidia.com>
 <DGUGOZL05DFW.1KFP9742934H7@nvidia.com>
In-Reply-To: <DGUGOZL05DFW.1KFP9742934H7@nvidia.com>
X-ClientProxiedBy: OS3P286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:201::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 98844f6f-f483-491a-61f0-08de7a59c536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7416014; 
X-Microsoft-Antispam-Message-Info: /grAQJEGERe8vSgJ8N7BKw4gD1Jvxfltg45Re961MRM1apvmvl4myvU7BwqRBegY43+DYKXq+R1AMaL7nlbqIXXUG717RnutokKxhn7G9UQjc0hJfa/0XNq3TQEGpyQdZER2AI1YaSqZGj/G1emsb0OD99JM2h75dc3UaHJytEUqUxsB2ivU34RjPCsfshUro6O7Mfrn89oZX0nYMR1abvkuYKIV6bRQLxtzX9V/OO8Eb8T4qrKz4KS0bnf38EQT4SRBmh0sXkWYg+alvCRAfgAwz/sOVTLavfkZHxk/JWkAgT6CGm+STdLwwGqT8sIXbaxiis5LbVktGKRQAWWXRyMMBl2Rcia76dGX8ypuyf+CT31jPmQ0m3eA2BqMq3kL4MKrvzAEwe8xg0ifY+owwsfiVd1xSg3g2wPNZDf6XQWE66SQSJjWnx4R2hwXmppWRwyMB5rrTFf6c7DbIfUn4O4IH/RhMRLyEqjTeuZSCxXpnHHnORDOntCUTJEG2O9q6Era2FvQzBegnCkAqkCCDrfzeHwidyGFXbNTUAOFASO/oH1fIfuOJQSXMHBqhjwmA2L3dV9g05u6FadH0nGXCAAwA1aoe0sdWUwU25PJg7XL9EJjAJg/cH0SfE3jf7x6ETV1aHgQuYXcJaUEiuQv/prIYbsb3qP9HZxVuaPoXojdDsCHLu2enu1smPSwWK1/FyUQHRz5lcqYkcgTAa/I9O/gNlqCFN7bOttHIlARKBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVEwYWVQcHVRR3N4L0FSb2tFL0ZzZWhVazYxOVNNQUFTWHU5YmxEa1JBZEFS?=
 =?utf-8?B?bXp5aStkT3FxUno0K2lpdkdwd3g4SGxQTjdwUkJCS3dWY2Fza0FVRUNJaFIx?=
 =?utf-8?B?Z2Z0UlJuR3FKZjRBR2ZRZHJnYW5YaHduejBmU3Bzc004TklYKzRUeXdTSzY5?=
 =?utf-8?B?TVphTlloalBJbXp2Mllnb3RUcFdNUE0zMzFVUWM4QVNmTFZUNGorY1lqMG50?=
 =?utf-8?B?RXpYcXdmUndXcnlvRzFEYnJmc0FjckNWdC9jSlVpZjJVZElMeEI4Q0x2NHdP?=
 =?utf-8?B?R2t1V2VqaWQ2WTVYM3RhK1BWS081cklNOGJSbFNGWTJPTXZpSFl3NkZyM0hQ?=
 =?utf-8?B?ZkNhK0YrdmlUMTA1dFMyWjZiRGlZWHBKVW9sckNTc2tlQi9QTzZLb3ZNWW5H?=
 =?utf-8?B?V3hqWGFvZEtobDhZN1JLQW9SU3Q3Yld3TDF3bG5iS1dxcmNoQjZQRHhITUdr?=
 =?utf-8?B?WElLZ3JtS2lNbE1XTnFkNmRTZ1h1Z3dMV25pZEpVSFFiUWhqbWNvb3JrZXJu?=
 =?utf-8?B?VTNiUlFzbkZ3ZjlING52SzRlRHVzdXROaEF6OCtsQ3g2SytCNnV5MGkrb1Iz?=
 =?utf-8?B?QnZ0TEVXL1lrUjhGeDlBa1FmODVYRCtqdk0zWS9la01XajM5TS9qaUp0VjdR?=
 =?utf-8?B?UGM1T3FOZnBEeWY1cGpIdnlBNVlKdGI4ZTZheGpibnBpQTduL2ovcGJ5d2dj?=
 =?utf-8?B?RlpJcDJlcTdZY1EwS1RMbjN2M0JhR0x3N0hZQllManoxem5qUjNHMDFTVlNH?=
 =?utf-8?B?RndQZWw3YVYybVV3N1VwWlRzcGxDZllzaHk4K3RzSDg3TEc1SXFqcmtMemtr?=
 =?utf-8?B?d1VTSXFxdzZMNWJIeWJzN3NlVU1jSm1LRUJpUFZ6M1RhQ0JFVXNldWJFVkVo?=
 =?utf-8?B?dkVhbzZXRkIxemlNaTV1QVhyM0Z2YlFvRE9EdEJhQTM5WExjaVFlOXVGT0RL?=
 =?utf-8?B?M3luVWs0VTJNT3lGL29tSk16SXVmRW5OQ1hrQ3ExZ0dXY0o3MXh1d2MxQWdN?=
 =?utf-8?B?ZWVGR0RsZkNQVmRsaTFxS1RFb1FUSWxOelB5OGZNNUlVdDdrbUdVQUxDeUR1?=
 =?utf-8?B?MHlmL0lUTlpUQXFiTEVkSEMvVTVvL1JGcTdRSEZZdndkV3BjemxWajFSb1pR?=
 =?utf-8?B?aTg0Z1Z6WXZGNmZFUFJ5NzBYN2lWWlIzN0xJNlhHaEI3YytONnhVOWsxNlF3?=
 =?utf-8?B?SFJUeTdyT21nK3BXRlNka1lJTGI4QlRXTDhDN3hwS3JUY2tvZWR4NUlUL2Zr?=
 =?utf-8?B?cy9nRmx3cVMrOFZZZTd4ZWRta0JFeEovWkhucXJ3MExtVWFSa25xb3Z6K2lW?=
 =?utf-8?B?YWpTdG1ONG9mZm5mMnZ0bXFyeGZUM2J2cUtXRkNvMnpFcXVrUmdUaWNpMDNm?=
 =?utf-8?B?YkJORXJxRG9EZ3hlcEdMS1RiK0wvUWZtdlVqU3hqdmhKdVFQVHZXSFBGZndW?=
 =?utf-8?B?NVA4NGYyUVZEZTRua2NCZk5MOVJ4ZTkxb2xWRHllQ3BOMVdMOFlwdStJK2xq?=
 =?utf-8?B?ZHdrcTRLRW9pWHFpM1Z4MnFUR0xsNGZrOVVXaXVBZHhlZkViZFpGSHhLL1BO?=
 =?utf-8?B?OVJOWnMyd1VScFBhOWErcCswV2hIemZxK3V0Mzl6NVR6eERjdFhHTXBEQVVB?=
 =?utf-8?B?Rk9ZSDNUckdXTllsaEc3bGxVdlNOU0VWQmxoMWlvNFVjNTNqZ2xON1RkdlZs?=
 =?utf-8?B?cTdUYVVjcXpaRmhYQ0MwY2t5bHpyKzEzSk9mRmFjZ1c0dlNySW16Y3pOaEw1?=
 =?utf-8?B?azRadzZXWHUzdmtabWZRWVpxMW1KcG5GNGxlTndQRE1QOFhtNFRFSVc5REtT?=
 =?utf-8?B?OWg1Ym5KT25uS1FKS0x1ekRVU3FFRk5qYmJkUEtzSE1VVzd0T3A2OGJ3aG93?=
 =?utf-8?B?bXNpbm5ldzNjNlM2cDRLejcrSTZobjZkUDZsQXhuaWtoWHVZTWZBbktkQjNU?=
 =?utf-8?B?UTl0TWlxdDZndjduYVIwaDkzVU9oV1huV0I4WU40T3llejNpUmtKSXlDYXdX?=
 =?utf-8?B?T1VMcytGYUIrWDR3bEJncVdJekE3V3MyOG5OanJTbit4NG5VUzNUQnJWekxj?=
 =?utf-8?B?RXdjejZGZy9lT1hwVXhaNlNObHRQMTFIdTlod3dFalczSmFIanFzbFZrNUFv?=
 =?utf-8?B?eHl2OFNEZkp3bE90U0xFd3hyN1laYStCbFZTSElETkFiNVJJZ2doOWNLTFdF?=
 =?utf-8?B?cS9mWXFhMUlsZm0xRy95SXdCNlhBdmJTOWsvZytKaHMzcm9HOVc5MVdHNkx0?=
 =?utf-8?B?OStZOWwvallnVDNFVmRSUkRMODJFMlJrWWJGU01DdytJNHFJdDFoa2F5L2Ew?=
 =?utf-8?B?RURheVk4VnAveXN3RU9WbUx2cHNWTWtEUHA4L1lhUVRhaGlMTlFTblRsOXUv?=
 =?utf-8?Q?RikqmD2iRO6S9MDDHtN9LwNd+zUOMtjUUv6MSXCVALU0r?=
X-MS-Exchange-AntiSpam-MessageData-1: 9zhYH1A8Xp8GEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98844f6f-f483-491a-61f0-08de7a59c536
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:51:51.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuQOaMvxbMjB7hk9oJVK2iij82wObJArVXp/cnm4kGFGNzJHrRbMJyanocAMZPb334QbV260mP1mXMRj6XTxSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
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
X-Rspamd-Queue-Id: 8FE5620A022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 10:36 AM JST, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:57 PM JST, Alexandre Courbot wrote:
>> On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
>>> Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that i=
n
>>> a Mutex. This lets `Cmdq` methods take &self instead of &mut self, whic=
h
>>> lets required commands be sent e.g. while unloading the driver.
>>>
>>> The mutex is held over both send and receive in `send_command` to make
>>> sure that it doesn't get the reply of some other command that could hav=
e
>>> been sent just beforehand.
>>>
>>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
>>>  drivers/gpu/nova-core/gsp/cmdq.rs      | 247 +++++++++++++++++++------=
--------
>>>  drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
>>>  drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
>>>  4 files changed, 146 insertions(+), 115 deletions(-)
>>
>> Most of the diff is code moving around. I've been able to reduce it to
>> +107 -76 by moving `CmdqInner` *after* `Cmdq` - this makes this patch
>> easier to review imho.
>
> Thanks, will move this then since I think the ordering here is probably
> not too important to readability.

Yes, actually one could even argue in favor of having the public struct
before its inner private counterpart for readability purposes.
