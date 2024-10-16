Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA879A15C9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 00:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A8310E281;
	Wed, 16 Oct 2024 22:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o5kcccrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318D310E1C3;
 Wed, 16 Oct 2024 22:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dof8osSrj+q7miEkFQMzeSa+c7hVHJl+xtq11Rn0W2jZIbkh6cwlaGZX69RFVcNtHfYWryJpBD5hz+wGCco8LImyHRrQiTg65XiXbgU60aUDrp4VIMPhG5bebnxaSpSY8/6z9sSCyPZNI8dpq14//iuUFWZPCYD0g/Bmi3dyb3x1GKAPJ+bEmN0VjTN4uRBmdBZpPm+LS4oguoepre9P+N8zk8q0RNBV9DGxV7cpB6IpD4cGYmziYyj5Hi6g3DzJRYJo0VvtpFR+T06JZ82KSwFd7TnslZm+idK1h1Q31+yu4Ld/Hp2CcKyVnoc6f6JdK8p4J1bW6yH0QyZ4qHTVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaZba5JK6rHhx/YTHBEdS2QhUft+F3IbNvnDh9NckIo=;
 b=Rqhs666tS134HnAKf3OufvtRVhfFOcE2r2IiXTpWteIwNgh7RBaTys8ZbeEOLkwcMF20nbg406YxIPlKs/zZ8CD7Ckew/bWxolZfWbEchnm5u6YYsL8SV2unt4xUd6MRrr/HgiXRGnV+5t4OGoEapc3HRmit55tx6avqxYBOfpnJA8MhRSoO+OOLAw6GAxY5n05V8JTDsUsU9g5dBI0GgTGCJ4MBGNHpXzVVZVUW8zDDCgdr11BXqAaf+iPwGYiuphQtyXdM4LEtB+kC+h24bl0Dl1mDqe96z/1DLCOcGYOhJp/EWe269od7V7j+vVtSdr1ussouymkIq/TXycIlXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaZba5JK6rHhx/YTHBEdS2QhUft+F3IbNvnDh9NckIo=;
 b=o5kcccrUt0yixLYLZeBrfxhMcx6DpN5+ByGBoYCcDfQsDQ6E8LR6EJdf8C/Lgh+w7kwDbkfwyM8HijEcVh+pGhfrVodyDNqesy1IEUyp4rGEA7KPkXyeEOxp/mGYkNoZBCCowTSGbX+sPBmFIDVeutBBGX2xOsWRnNG7nSPlCvTF3MrQIwsVl0/Tt1+/CtEw3457XFJZanLP9LszT9+Z7ZG4/UQoEvSt7IEKiM6u/FPeZL8x+cmyxIR9DH9sYrTe4xt07a28VpFiZGuSi+uyBhCSw9na0m19BFXrTOJq9PtVh6sQa+kB1zVsSLQ346RJPUyWrUBEEFS8KsrgJC4slQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA1PR12MB7128.namprd12.prod.outlook.com (2603:10b6:806:29c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.26; Wed, 16 Oct 2024 22:26:34 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 22:26:34 +0000
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <Zw8_x0Tvux9IMbly@infradead.org>
 <1a667504-72bd-445b-8bf8-a6604b7beb2b@nvidia.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, jgg@ziepe.ca, leon@kernel.org,
 jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, bskeggs@nvidia.com
Subject: Re: [PATCH v1 0/4] GPU Direct RDMA (P2P DMA) for Device Private Pages
Date: Thu, 17 Oct 2024 09:22:19 +1100
In-reply-to: <1a667504-72bd-445b-8bf8-a6604b7beb2b@nvidia.com>
Message-ID: <87plnzofah.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY5P300CA0060.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA1PR12MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dce6734-b671-4cfc-c5aa-08dcee31978d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG5kN0V5UFd1N2haY2VTN2kyeEJQdk1paDkzMGZRMmJuY040Q3JIV2JseWpi?=
 =?utf-8?B?eno4TTkzNXVEc0ZQNHhaRUJOZDRZdlVTRkhYOHo3TU1uVElHL0FNakFTKzI0?=
 =?utf-8?B?NnpRak8yTWlid1dtYU11a05UWXpNcW1xbFQ1QTE4YTFBZFBiY3AzRnZBSWVw?=
 =?utf-8?B?OFpWQzBOV3ByOHJEeTRvSHdlamUyQ21VcytTTHdFSjJ5eHRGTXJhU3JxSDUw?=
 =?utf-8?B?Q21kL0F3U2V5aXNCKzhJOEhza1p4MlZuUzljT29lTlJPUlhtZm1TMmtUSTdR?=
 =?utf-8?B?S1htL2ZSZGN3Y0RlQm5tVjBiTkV1MkVwS3gyek5qYndISnYyYWZ4a1I0bXpI?=
 =?utf-8?B?Nk1ML2FKUXcyeXJRbW9WQWVBbW9nRWJ0eFFEQ0JXdFUzTGt2QUpNd2dvb1gw?=
 =?utf-8?B?WitSVjVDdnRIMGlENnFUSENvNkFVTGZNeDFOdFFFWm9yYmo2UzFDYkZqQjll?=
 =?utf-8?B?bjlnRVNNemFqamxDY3U2VFVKUGdJTDdqRDNaMmVUMzJIK3NJN1d3d2lSbERH?=
 =?utf-8?B?bU02SjhjeStLbVBiT0hQV2h4dDhlNnB0T3F4RTlYYk1zUGJEdTIzTW85cm5l?=
 =?utf-8?B?TExvMXdDOWd3QUUxdlQwemZqSk8rWktBVVpwN3JEMUtyaW44eHdrQkVhRUlM?=
 =?utf-8?B?UzhTbVhWTnNMWHkxVUpOTHRCektwa0VkSkJTd3NhNGdwNWZxOVFkNVN3aXA4?=
 =?utf-8?B?WGpJQnQ3OTk1R3JWQm9QVG8zQ1V2dEdPMnJ5THNRRkJJNzIvYXB3NWlQL1ZF?=
 =?utf-8?B?c1FRZnp0UllaVTI1amRiQWdaM1VYbnRGdEdWOGRZK0lEaGEzR0NBdk5PRURD?=
 =?utf-8?B?Wkk2THo3V2F1NDE3b29GUkJnRXlyRlU3NjVPZ1p1R0xFOEh0RW8vSHdzV0tY?=
 =?utf-8?B?eDVXWlg0YTMrV24wcGtrTktWdnI5S0E2bnhjdytINWtObzdVR0NzaWR3TFND?=
 =?utf-8?B?TDdoZThmcmgrd0NPQWo2NWpSOHNrZ0dSdXE0c1F5SUh4SnBzSTlLcEl2RDc2?=
 =?utf-8?B?eDFZdkVIdWhVMHhXeUNQN3dzdFgrY0NUcGJhZlVDYnhZM09KdGIzcGFldURj?=
 =?utf-8?B?ZmhEVExOMk1NQ2N4c21sbnFWTFBpdi9pYkNrdzZTVU51eG5PemUwS29CeHFD?=
 =?utf-8?B?eGd3SmV0a2F0aUsxMUlXNnhBUXg4aWE4aHQwVTNzWTNtTTcrdklrZkNBaDlt?=
 =?utf-8?B?YUQ3QTJyUHZneG9HWWE3b2t1dG1SeVJiaXpwY0l3ZXZIeVc2M0FiN0dpVEQ1?=
 =?utf-8?B?dXhXOUt4VnE1WGRjTFJ6TnI2L0hMVDVWNU80c25nNURNY2ZUSnVwdU16NU1H?=
 =?utf-8?B?VWZ1QXZ6a3RZZGRBL1RNbmRFVGhMR2dreWdpL09yOVJnSFIveVh5aXFaN2VG?=
 =?utf-8?B?aDBTblpwaWtRZUdNLzQrTmdCazZYWlZIQThCbG92UVRVWThSVUZORFVOblhP?=
 =?utf-8?B?VU1hR0w1QS9vZTVScWtTek1NTTBraExGcjhTNWdXNmQ4RWpVSUFBZWR3VzAz?=
 =?utf-8?B?blFudk8yN1JxSWk1Y2p1WGlNcy85cStOSVNEN25xSE5SS0JMbXBKMEt0WUJ4?=
 =?utf-8?B?YTBIMHVIcm1Xdytkb3pMdkMxeTBvczhpSjZKWjIvR3hSeUM4WUhhL3IwMkxN?=
 =?utf-8?B?MW84Z29BOGZRZ3ROeVF2RmFlT3NsNGcxMUp2eTl0RUpUZWM2ZW82RnBEUlhP?=
 =?utf-8?B?OUZBVlU2dUt3d2tSOXZwS29sMkxRWitwdy9wMlJyMXJQVy91WkRYcW9xMFEy?=
 =?utf-8?Q?ZdAuXQmPK4fVz7gLQ3JDPeMmd8/K96nWRGyRZJ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGcrKzJvTjIzNTFNZ2drd3cwTzg4bm9mZHc5Y0JqbVcxMnlqVC9xa0lXZkJy?=
 =?utf-8?B?S0hwdEx2VVdyVDY5cVllR0hIQy9RWFUzR0QvYXZ2Smt4dTFpb1pXRHZ4VnFm?=
 =?utf-8?B?SHA5VlR1OFFrU09tVE16Qi9GYWpORUlML3JmbjNnVjhnTU9LcGs0azZDTXdx?=
 =?utf-8?B?RnNWQ3VXMXFSQlU1OW1yaVpwR1JvdVpsZVVOZkM1dXhoZzdpV2ZFamFrNnZE?=
 =?utf-8?B?R1JpQVBVOVNKTStVTk9UQVJURzIxckVsK25LRjRrbjY4WVBzdlljQTV6Wktn?=
 =?utf-8?B?RExBMTNXRjNpRUo0WG5scUVFemJqSXpwa0xkVVRWSHFITHdWTXhPUmpQZHdp?=
 =?utf-8?B?U1l2UnFmY29VcTJ6R25wWmxtTlZSa1A3UUlKNkpwb3d0ZytaVWxOTUNvZ2Mr?=
 =?utf-8?B?NjdBbXg2R24vMWFlYnF2Rmg4a3hzQ0t4SVBLUkNPWUxoTys1SS9ZcnUxeE8y?=
 =?utf-8?B?Q1VNTG9Yako5dlc0RWxMK09SSGV0dFMvRC9pWldXUE9rRTFYUXhqd1NVN0RR?=
 =?utf-8?B?UWJldzc2Rmc1alQzVjg1dlQyS3NhaHlyclo1ZHdxR1Fpa1RnUjFJSkxBYlpN?=
 =?utf-8?B?YVZSYmxlZFJSQ2xXMVc1UXlKc3FtMmdhcVp0a3I2MlJvTXpHQXp1RmdFa2VI?=
 =?utf-8?B?bGZLUFAyNzVDV2dEbmNzVWQwZHpzb1lwMld2eTZBTUpWNTJqWktIZThsM3pB?=
 =?utf-8?B?UlFEeDdEcE5BeXBadTdRUi92K25EMllEcTc1cFBLejVJbTR5MmxoNVJCZkEr?=
 =?utf-8?B?S0ZUZm4zYkdlbFpMWDBDM2JLVnZKcjVGN2RYV1Iwb3BCaXlSVjcvWkxsWVlJ?=
 =?utf-8?B?TGRCN1ZwQXNQNk1GZzl4NkNZY0lreWJSVUJPUXl5ZThHWWVKMlRzNHBac1l2?=
 =?utf-8?B?aHlBZEF5Y2hUeUdwMEY1M3VBR0FvcWNWL3VzMU55RHZ2TnhUVWx4ZytodU9O?=
 =?utf-8?B?UjZmc0hHdHNmSzNsQUowK0VVb1dEdlhhRDB2SWNNRm51OTl2ZE16V1ZSR0pT?=
 =?utf-8?B?SGNYbFdSTDNYV0hWLzc3MjhrNUpLd0FXRW9tRkc2ejNlaHJGZEV3K3pBei9m?=
 =?utf-8?B?ZTZXQTErbWIvUXBMaXI1N1dOMGozSzJvVklJcUtqV3ZEVXd2MUFCd1VISWUx?=
 =?utf-8?B?VFBqa1ZSSko3M3EyZVNwa2hEWjFhN3RsQkUrVklxQ2ZLRE50L0Y2VWp0Z3Fz?=
 =?utf-8?B?VkR0NXVoZWUvU2dVMGpGWUllR1Q5MmtmYnRWb245RW5QVGpxaTVxTUxYMzNU?=
 =?utf-8?B?UDJVVXZ0eVIzNlFDY1o1UURMeVZtazZKRnRrNVBnS25nWUlTWGJjUzFlSnVn?=
 =?utf-8?B?M1FDRGFLMU8rTUhuTVlmY2cramw1YnZFMFJ5cTBEWVNNMEV5Vkx0bkdRRFZI?=
 =?utf-8?B?SnJjbWNSdjkzbHpXY0NJMElFK04wdklZaXFIVTlOVkZVU1BQMk92WGh3Zmgr?=
 =?utf-8?B?TnVrdlo4VVZ1K04rYS9rYjk3azZtRlA1OCtrbStVZXB5dkZoUjB6REtDbytZ?=
 =?utf-8?B?aitEbThuaThBS01GNmxXNFc5dUZWZDc4SWFiS1pocTA0amI3TDVKVGRLWk4x?=
 =?utf-8?B?N0MxNVpkQXU4NFJYK2Fsalp0Sm9zS0pqRFI4Y1c1aFVBMGp0Z0h5bFI2UmJh?=
 =?utf-8?B?WnJ2Nkp3UWpDa3NUL1drbnRFVDJvNXJvbzJRRkl3anBFSTVoS0xMbWFJek1N?=
 =?utf-8?B?QjQzRG1aTjIvSHFqcVl6dGJ6TkZhRWs5bmdpTW9uTjdQSWVKM3lNSmV2NjJP?=
 =?utf-8?B?UkRpNVdjZWNSay9ERzdYV1NybHg5QmRLdldlcWFCQVUrL1hFdFV5bnAvRWdB?=
 =?utf-8?B?YW8rSTIzZzdia2pjYmQxN1lGMkk0L0RyUm1ZMUxRcjZHQWhJQUxPVTJpTndx?=
 =?utf-8?B?UHVEMmVWY05vRXpvVlNMT2hqSllzK3NsM3VrQUhmZU1MNC96UXpVZHd4N1No?=
 =?utf-8?B?eStsNTNleWFKQStkMEJKakt4czh2bVZ2SkJub3FsaXozTGZhY1FLa0czWmI4?=
 =?utf-8?B?bktWa2RhZDVZUmMxSlNhQXB4WFZCemY4WGlLYUhNQzBvMHhnSjVodTltUG9x?=
 =?utf-8?B?c1E1aUEyY2lHTEY1Sy95bWNTY2MvNlpTUDlKMm1LMXJTcnVtZVJ1THRMWTBy?=
 =?utf-8?Q?wZvtn64/rJVOIPYOIqX3O1M1m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dce6734-b671-4cfc-c5aa-08dcee31978d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 22:26:34.4393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0sPSraRjpTYOkXnuqxJuEHVy4RSa1abWGC+AGxOxZp6LMpACdbBcEb4aYL/K76ynvl+MgoBmgwOYY0jw2ayOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7128
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


Yonatan Maman <ymaman@nvidia.com> writes:

> On 16/10/2024 7:23, Christoph Hellwig wrote:
>> On Tue, Oct 15, 2024 at 06:23:44PM +0300, Yonatan Maman wrote:
>>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>>
>>> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
>>> GPU-centric applications that utilize RDMA and private device pages. Th=
is
>>> enhancement is crucial for minimizing data transfer overhead by allowin=
g
>>> the GPU to directly expose device private page data to devices such as
>>> NICs, eliminating the need to traverse system RAM, which is the native
>>> method for exposing device private page data.
>> Please tone down your marketing language and explain your factual
>> changes.  If you make performance claims back them by numbers.
>>=20
>
> Got it, thanks! I'll fix that. Regarding performance, we=E2=80=99re achie=
ving
> over 10x higher bandwidth and 10x lower latency using perftest-rdma,
> especially (with a high rate of GPU memory access).

The performance claims still sound a bit vague. Please make sure you
include actual perftest-rdma performance numbers from before and after
applying this series when you repost.
