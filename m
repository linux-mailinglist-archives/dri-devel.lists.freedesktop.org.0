Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM5eAhMfpWnd3wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 06:24:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486DC1D3101
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 06:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4110E42F;
	Mon,  2 Mar 2026 05:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CatvXnbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25710E42F;
 Mon,  2 Mar 2026 05:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYufZfDZnve4Z0gUgxH0av4gO8e1zd6n1mHm5Qhzf8F8kaH+G2LTi0YMS5/mJuuPyp9PuwIt9TA0wlXjMIHreKVEzcYNwABiLbCG2qdVU7iF5FYcUn8SXa/K+FCxlkyto74rrsY0iGHi4MdpYNOrnev6b/crWFaMA3Vq4XGR6Gf/9TcAZpX3CipV94TTWQLUnOjNSde6ld1T6a1NtGFNcjPeSzpmmpuz2KTSk2vTvKjvo9iLkqrC5hmkSyw/RfL/Ld/vD324Vg8mn5GJ7VCNzN3vPf0UN9NHD4xtjgjqtJpKgETqk1lndI3/Avbh9VQRNQ8zRTWiYgZxXZkSvrp9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4doh4TrOHgsD35lRWlEEKxK3e3yO7lPkTxGGzLd4nTQ=;
 b=OaFBm2+epz7fyiXaixXA198CkqicdVqXbqWJESSeBVbONC/pPCa0YUeh56hptBjOLjAL0tSRhzhpAEwVxlpgwu+/nKBVnvjzBDW9EGi5OPjxnWJUnNr1NMETTEcgOI6o0Z1WjD7h/69kH9T39AfxEvIIDaRaYWvi8EKV19nIvcFRM7kygZ+i9jmyr9OAUP220DbIFKh5x9Yk/kLsvxbhrwj1JF1YMLNnQwXtlZQDNW2ty1eEJagtebVfFcS4ahf2DxkSb8iy6SBTJ80mUjArIpqIwjmAHXhmwIAFq+7Vdc0veZ/CnPvUsPdXDs9gCAgJUvUxlR9c1nxVUJgOn+YGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4doh4TrOHgsD35lRWlEEKxK3e3yO7lPkTxGGzLd4nTQ=;
 b=CatvXnbAXhlEE0lsTKNzy2lNdUfnCS/vUsI+ZeCKbYI/MnG8fo/SQU8PRJVF6YEDWfAOuR1Yz/exhSsz+89WarGFSkDKN4pMzfKXz7SkVRoT5K23m9gK4ZtlHFqmFNRqIjUlY7Rho8NBwSgHh6bw9JDtquhyoSpYouaxKpq2lPgVoJG9fphPgGQd2VcCjDhkn9IGjN52m/MQCE/jiYR3el5SdtUic0g8K0Knej8J1iuYgwfVQAuMG0ty7RkPzoln9VL0Smcl/Ow8wVGqsY4nNdqD4H4l1Q+Cy7sYqt49Vqg1xToPMAXCh3RYtbjGyndpI/pcuBGWUn+50eAlQPwTqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 05:24:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 05:24:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:24:21 +0900
Message-Id: <DGS1NYABTZC1.1ALYUOU60NIWN@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 03/10] gpu: nova-core: falcon: rename load
 parameters to reflect DMA dependency
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-3-dde5ee437c60@nvidia.com>
 <DGS10W70UDA6.V6T2GNR20Q2X@nvidia.com>
In-Reply-To: <DGS10W70UDA6.V6T2GNR20Q2X@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:378::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 131c6847-3696-4e56-0bb4-08de781bf7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: al5YKJlzEecaYTWQ+hhyflmSn4CZZVcMGNJfQWfyIP3qKatAMUYCP249Jdaxx5SeUmeeDNG71Gz53+Yvr955w+G2UYICY12gw0B0O5O1NFhIn7uaGgAXYT9RGg/sheyNh4zkNnU+yQyqHbQQHFN7NvzdJTTXUy3un6Gu0aCUZRGPEtaRYGqx+YaD7sC1C8T56HXJs6h7T0rnnPwwi0ApOoW2apvhIHWXH7BVjEfw1e2cf6ACdwj4VgU2LerEq3UKEuVxKekthzLqRqo1TVDfLHw6PyvOxQmM/O5d5OKXb0jtyJZlweKztfHVUi9N0VwFKsQqwVdDktz/GfdChijUWmwXbfxT2uY3uAH5MISNJLQBEXDHr4DXKw06bodGMJBOYK4lQRyvi4SO96e9VXARVI14DrWLYNg0AosAUPGvR4+Z3TjlTk5JIzFeibJmVnB7ZvIwJVPScP1oxr5XTliLRtcpg4tRKcdCvLYfLIyyqfdBBDQsXb1NZK+kGeIy9tDmjmgR4T/moflLLNVj0jTyCU3n1c/VRY21CpY3SuGFVBJ8Uo2YVUpkc/wAzWjlY5o2c7xUFJ4h+1PsBv9o/XyRoJH3yON5fIQ8ZFhBAhlv+TsE15C146XM07WFeIp62WQFMXj23g4FBDzlVIiU/BDC3Aav3eW6cHcWukCKunSspDiv9E9WCkHr6+spx5sEFZgU6FH+jb3wE1DhvCowCBPL5/1t3v0p8XcZyMGZOLsIvtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDduU3B5SGdOS1dnMGhEVFcxTmF3eGVqMkJWMjh0ZjdxcE0zK20xU3JsUktT?=
 =?utf-8?B?cGV2clZRK3lxZGhFeXhUUkZmNWtCUENZMldnSUVvbVJrQ1dleEowanQvMXox?=
 =?utf-8?B?bFZhdkVBL3d3VWpObGp4TUgva21Fd2JZNythcVo3VHR6RTZ0TG5NbzNTQjBh?=
 =?utf-8?B?RXU2bHlDY1R0TE9NMEU5Zm43UURBYnFacHVJNnpGMTVpNzlrWnZSME1LNktZ?=
 =?utf-8?B?cFZ2bDVtanhGNGt2ZTlxdXdoTWxvdGFsLy91cDlXYmtVWFVOSFJ5Rllzbnpz?=
 =?utf-8?B?TDIyZzJ2a3RvVTdacVhLQk1GMmNWelh0UkhCNmVwVzc3UGsyb2M3TWdna3h4?=
 =?utf-8?B?a2JRTTBtUmdzN0NHMWJIQ0V2SE9nZ3JtNUd3ZjVPRGRhdUs5azd5ckVrY09V?=
 =?utf-8?B?ZGw5eVlLalNWNE55d01EWnVXWTdIUUkvUjNyVWNiazlVdkxWTnVmUS9IWjB0?=
 =?utf-8?B?bmtsRlB5Y1IzUU9EUFFITFhqck1YSnE4cVFiUnNjc1NhZlg5T2JJN2pZTks2?=
 =?utf-8?B?VnhTWXlwVkI4Z1F0QmhacGludCtmQlNxcExtWDNoSmdkbmZZT3FWQXdxWnNu?=
 =?utf-8?B?cHBSeHQ2WmVTQ0RYZ3NUVktyc0o5K1RjWU1XSlhBaUo3Vm82ZENjU1p5VlpX?=
 =?utf-8?B?UWZmc2thdW42TXdEaXZtaUF0VS83TS94YW1ueC9va2x0M1hKU2dxSndEMDlM?=
 =?utf-8?B?eHhhaWhzekFkSEo1Qjh0R0tmWUJGcWV0ZU9GMldJRG14Ym1CTjl4WVllWXdJ?=
 =?utf-8?B?Y01mN0phbml2YzNZNXNidFBMOWV5S2tVbTMrQS9BNUZjdE44ck9MRTNvbkRk?=
 =?utf-8?B?NnVlQnY4S1kwaEVUY0NudFgyOU1vejhYdG8vNmt2TkZqdThuY1pEeU5iSURa?=
 =?utf-8?B?QzhXQkpOWlVEYW9FdmhORStFUUlObWltZVJBTmwwL29vRXR5OFNQTkhxL1VN?=
 =?utf-8?B?VlAwdE92Q2NUZjdmYUdIQy9pUThiRFkyQVV0RExaK0U0L0FvNVcxVjRJL1R5?=
 =?utf-8?B?VDRBY2RwVkxxby9RenRjcEVnTWRnWGNXclhheXJRWk1tdzY4NE56VEpsZzZM?=
 =?utf-8?B?VXA0ZWkybEFpaUlHMjJOM2MwbXEzTVI2VFZpR290REsra0Irb0ZLdHIzN2wy?=
 =?utf-8?B?OERXdVpONG5PQmZOa1k5YTVRR2RrblErVG5qVkx1bEV2aGloMzVvZlhjMTBN?=
 =?utf-8?B?K05KUlUraTVFdEIwVEczMkNUZ0ZTVFlwNlZzRllZZHNJY3lqOXhNaUxKazFO?=
 =?utf-8?B?VmthdjBpbUpKSVlWbWk3Q3djVHd1LzVYczFQM04wRW5LeXdrWmxPWExBMmkv?=
 =?utf-8?B?SlM3K0ZScmdkRzhhSEI3OE8rR2RzcjNWdHo4cEhjNE11WUlwM3VBRy9LanA1?=
 =?utf-8?B?TFJCb2hoNzk5S0VNM2lYRmUwU2JLdFpvNmE1b3pVTkVUeUJnbHFsWVp5bWRM?=
 =?utf-8?B?MkhGcFBWK3M5RzZjbGhLWmtPYnBpZlBXZDJ2RW4wYk14T0JCblI1S1JObHB0?=
 =?utf-8?B?US9uWEgxWjFYMzRqS1dFR3F1RDVaSUFvd2lCY1NoQVljMmhpSGtKOW9jY2Rw?=
 =?utf-8?B?a3B6T1l6VUdmMDFjbmhlRjc5V1gvOHJNaHlJdEUva3F6SXpiS0FRY1d3YkRo?=
 =?utf-8?B?SEJYeWJsSEdrMDNnaEJGY1Nsa1VXdS9RK3ptWUhSdVd1RE5IVXF0bFpzc2NI?=
 =?utf-8?B?bDJpKzFVNEtWenB5MjI4Q3FqMzJsSG0zaWJtZFBqQjA2QkE0TWlOVGlUVjcw?=
 =?utf-8?B?SWVBcHpzVFhGMlFWcWx3R04yanhCcUx4bVBlVnFScGZLVWdxL3gwNmFDMEJy?=
 =?utf-8?B?NFJWajhkb0M3ZGtKZjhHdXpmaXhhanJONE00eTc1TEVJc05zcGV3Nm1BZ2ZN?=
 =?utf-8?B?dFBQbmdYTjJqWVFtN2RkMVFOa1o1cXcyaHFMaUI4UnEwa2t3dnRuMjFmSzBG?=
 =?utf-8?B?Nk1qNkh5S1VzSk1XQ1Z1c2dUYXdMSUhFWis5MTROSHhiQXVzamFSc1M0SnNw?=
 =?utf-8?B?MWxXM3QvOHdBOEhPL2ZYeW9UaXovdG1pOTVoMFdWZUZpRzBXdVpJS3RmSG9G?=
 =?utf-8?B?WS9iTUhQRC9HK1VJQnZZVFFlVUdwME15Z1NLSWR2UWRLNkFwZE5YOTd6ajlB?=
 =?utf-8?B?eExlQnYydXU3eTJmeDZBRGhWeUJ6WlErZXYrR1ppQzV3SkdLRjIrQXJUZzFx?=
 =?utf-8?B?RTlOdHRWMHlMaHl4MThyNk9LRXhvZjFlMXJTMmMzTFQyWFp0MWtuaW1KeVBT?=
 =?utf-8?B?NklGeHRxRGJzRVJ2M0JLVGw0aUFBQmlhalV5Ny92aWE1akc4S0pyQzkyMlVj?=
 =?utf-8?B?MFZ5bi9CcTBsMWR1SDNpZ2ZxYUQyWFcyQjVrd1VGTzNJb2VERzBmRXNxdG9M?=
 =?utf-8?Q?TNYCuz30ZteZ7aWnHXVeq2W8iSzIi8EuYESZ4F/kgUViI?=
X-MS-Exchange-AntiSpam-MessageData-1: Q/1m6H5nmTy7vg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131c6847-3696-4e56-0bb4-08de781bf7cb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 05:24:25.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ+0fWJOX9C1yr0hvPGL7lyU+IwkuAe7GQsOGwun5rMLrRLKXqiyKRg0Z+Gd36S9ciyFUm0Go5PkVj7XGZmOtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 486DC1D3101
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 1:54 PM JST, Eliot Courtney wrote:
> On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
>> The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
>> DMA loading, but not so much for PIO loading which will require its own
>> types. Start by renaming them to something that indicates that they are
>> indeed DMA-related.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova=
-core/firmware/booter.rs
>> index 2b7166eaf283..d569151982d1 100644
>> --- a/drivers/gpu/nova-core/firmware/booter.rs
>> +++ b/drivers/gpu/nova-core/firmware/booter.rs
>> @@ -19,8 +19,8 @@
>>          Falcon,
>>          FalconBromParams,
>>          FalconFirmware,
>> -        FalconLoadParams,
>> -        FalconLoadTarget, //
>> +        FalconDmaLoadable,
>> +        FalconDmaLoadTarget, //
>>      },
>
> I think here but also other files in this patch are not rustfmt'd (e.g.
> import ordering here).

Oopsie, you're right. Sorry about that, that's what happens when I don't
run my checklist script.

And it's even worse, the build breaks in the middle of the series. I'll
respin and think of some penance to atone for my carelessness.
