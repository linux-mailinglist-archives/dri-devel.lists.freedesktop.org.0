Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMMnKiuscGkgZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:36:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D555505
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B8F10E747;
	Wed, 21 Jan 2026 10:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CFgiWak3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011056.outbound.protection.outlook.com
 [40.93.194.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BFB10E747
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XW9LXCPgOyQkJEA/Th0P/mugGQhx3Ef6GQaRPdp9Xo9rpyptjfD6OqW+J13V7omCOsx3GUNbLY82qd6sttEXE9c2g+alnx4KIEgE50cAYxFr0glGR/Knabfl6TS3kqyje8au1mWx8PQSF4ymo2ZWBZtkBHVzBsvk7MPBuPS2OvsX8tDWQvyYEHl5yLnNE2+XPvudp1w7mDlvWWIrSPMF0A/QvbL3KpCaZo4h6BdX8pChj0oHyMZBwxXPIIwu+rlR2P2nQw2zRzts8iBCSg+kyQDDkbXXbqqxN7G0fuBPFDIKTMDng0hB9MlIcN9yUIBs+Yzm6zeODjCAVNjpzJ19yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHJB4NX34lugtQemqAY9rjl2T8vnN05RybzSGIJPogU=;
 b=l4R8JXAw0mZuXn2s+pmYU4OBXeMePADKBOIwRZaYCJCBr+21FiqQotsVjDdmQZDPaliKGTzj0V+Gr2LqSBiPrXx4VkVy0SYAd4jr4WzVuvHmjf+KqrJN8xxkuraAGbByLKwdyXFoXuA4nIzm04PcJ6cyLXsfxmj6axUhQFDeaDI3dUTGhyD4VC3Fzu9R/X2L5k5cNvsgtnvbWTTQBl9XnqnIN2zXAstlRcC2/qYfV40leXC6H1eVGbK/OqydaG2SWXMMeCweGEuzqHWsfyLW+9mO1iHfv+SP6e0d/jZTbJJaQZ0jLiqVRa3PZduT1irJHbGI4DjmvYoDSja2jTM+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHJB4NX34lugtQemqAY9rjl2T8vnN05RybzSGIJPogU=;
 b=CFgiWak3ad6ztF2hxxzDfKe3LRj1c/rFCelAMjFrfhouGwTpffrt7+75nQ1qG+9/XQnU29fo/zlHerx+RkImm05W+73+hoz0b4muqTMC6ALaI0e9RfP/mJuyhzyoCnQIJFsoLpTpd6RU30wcwwujuiZENotGNdYDhhXuJw8IMi6WXh5/TgQKK9jEJQ3JCZYSEKG7VP5ZijTUm8RjVTHUsIQIfUEt0UP5k2iigY3Hc7p/6nTWMjmHySRy9pYP6mA8zspd6rGhDksD4vQDya3lU6YwxDADgH1rRKyWmMM+PmwDyUbaTKtvXsD5Gr+xfnKv1QWbXIFZ5OTln+qkZeoWWA==
Received: from DM6PR04CA0018.namprd04.prod.outlook.com (2603:10b6:5:334::23)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 10:36:18 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::6b) by DM6PR04CA0018.outlook.office365.com
 (2603:10b6:5:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 10:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:36:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:36:01 -0800
Received: from [10.221.199.162] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:35:58 -0800
Message-ID: <6a18009f-c9ea-4026-ac68-8cb753f4b001@nvidia.com>
Date: Wed, 21 Jan 2026 12:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rdma-next 2/2] RDMA/mlx5: Implement DMABUF export ops
To: Jason Gunthorpe <jgg@ziepe.ca>, Edward Srouji <edwards@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-2-6d47d46580d3@nvidia.com>
 <20260120181819.GT961572@ziepe.ca>
Content-Language: en-US
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <20260120181819.GT961572@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: f78cd707-a648-420b-667c-08de58d8e8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym1CNS9OZjB0eit1VFpNK2VOR3ptTWdENURnN25pbHAwY0VHNnUwQXRNQWha?=
 =?utf-8?B?ZEt0MVBORW5NSmtMNlZZMlVCdTNuemhZdEwxa29rN2NNdjJ6bUZhUWFISE91?=
 =?utf-8?B?a3NrYXYxTGVSdkpyaG1Qc0E2R0hCSG9YMmNqSU8vKzkzYko0WnI2VmlWMUd0?=
 =?utf-8?B?blFZUTRGUFZoRjJZR01ya1R0WHEyNGhwTzQ5Tit5OWk4Qk0vMEs4bWJnd1A1?=
 =?utf-8?B?SWZVR3k2TXcydEh6U0M4NzJBVTY3UmJHZ094M3V6VGptZjYzZGhsMURlZis2?=
 =?utf-8?B?aWpiTEpsTXlHRTM0T2VtVTd5NURyKzhSY0UyYnpZNGdhKzFyRTBCSnExR09Z?=
 =?utf-8?B?WW5vdC9wSHh1VGxpbytBbmdWT1E3MXBPQVJmQ0lEZWxGWS93eWI0dmhXZlJx?=
 =?utf-8?B?QUx3bkJJVUFBQWxZUi9NTjRIUEdXeEdnLzUxWVhyaEg3bGg2NnBxdVA2ektZ?=
 =?utf-8?B?VkxodWcxeHNFQnFNckFaUmhOUXREU3hkVXVaWEk1SkZNM0tEcUFRdVNKOWpF?=
 =?utf-8?B?dUQ0TitRbjR0NEdXbTRvRHV3S1J4bkJYbGhNanZFRUFycWh6NkxZMksya3hj?=
 =?utf-8?B?bVEzbjhqMC9rZ2QxUWNHRW5tejVHM3FCNVUrQm9WYk03dFM3eVZwamxRL0FN?=
 =?utf-8?B?c1JFNXNOR3ZjaUxNOHpGQXpmQjRsQjEwNjVBME9GODY2U0xWVGQ2eFlKWERE?=
 =?utf-8?B?K09QOUhmY243ZTFHUXk4TDJwQnFRRkJIRHB0MjRyZE9VQmVwQlJkdmhja2Fv?=
 =?utf-8?B?L25ySzN0c0ZPSWl4TVo3SjhUUDlzSFowSGQ4VU1vWXZPc0FFSjVJZjdYb0pj?=
 =?utf-8?B?dnFMOTdHQ1N5TENKSW8vamQwRGZBT2daWG4ySkFiWXVPdFJybzF3ZVFrY0kr?=
 =?utf-8?B?cXBxNXpoZDNQQ282czB1cy9na3ViVloyc29WZ1FtYWJxY2J1eTgySW02MkNM?=
 =?utf-8?B?dEV0NUVXNjJKNmd2c3QzMjd3TE0vemR6RktXS1FWRWZWMkhNZjZxZUJaZlAy?=
 =?utf-8?B?TitrZnNURkdhNzFJVGt3Z2JxVW84ZE1RVGJoem54RnByU0lSR202OEprN0Jq?=
 =?utf-8?B?cTNlR000NEZYYjVKQ2hNYmFadDlPNHVPbmNaK3E4aTk1SkVJU3BvQnNFZVFB?=
 =?utf-8?B?ZnpwMVQ4Z3MvVkwvOHlOaVBnb0QzLzZ3d2pTMDhKbFV3aVEyTExKZEdPaG9N?=
 =?utf-8?B?NmdCNVpQUUF0b3hGcUIwaS9tWmF5QkZqUGxYR1kvY01jQ2NzSTNod09WUzN2?=
 =?utf-8?B?NTVGS1E3M2pYQlR4SEFaeHdObWFJKzlOZnFzSzM1UURFRTJnQjJvTWFvc3Rs?=
 =?utf-8?B?SlUxdEg4aUVnQXJ0S0laQlhCWEQxSmt0alFYeXhVY25GZmxYak5Td0lNVExS?=
 =?utf-8?B?MXhWcjRBVEpVNHN5NElwdkVFMGVrL2lzTFZSLzJncFVaRlFZc3dJbVJlMUor?=
 =?utf-8?B?RGU1TWFtTFhpbTVYN2p4TnFTWlp5L3pQNEtNdzFTT3ppUXVqV05TbjkzTTVT?=
 =?utf-8?B?ejhYQjB6cFF3TllISktsODlQWVIwMkl4dm9IcGRXN2Y0elNybUhVbjBVeTZ2?=
 =?utf-8?B?UEVScDRlOERHa1R1MVdLbHRVTW9Vd0dMVS83cW04K01RZkRoNndONjJkYnIr?=
 =?utf-8?B?SmhxbFpPTVVFSW93bndqMkhCVTFXTnBDU1ZwVGl1U3VVcFhYNnZDUFlNVlhK?=
 =?utf-8?B?VFVUdWEvd2VxYUZpNTRYMG00YVZBdk9iT2dlelFQajJOT2RtZk8rcVpocjNa?=
 =?utf-8?B?Q250S096U2tuT0FrVXlLS1NJaytnQkhoeEVZZUJ6RWFEeW5QeEg1UG5NVk5U?=
 =?utf-8?B?TDJzMElCY21WcVBXN0hIWEU1Mi9TMW92Z1p0bDVrR3pQMjZDQW0yT1krbzFv?=
 =?utf-8?B?WkN6Z1JCbGVld0hVNGRkV1dOdjZzQy9GekxJelhLdTlsd1RPTzVVblBlbU9W?=
 =?utf-8?B?T1ZZNVFJd0dxVzBNK2V4S1RZM2ZYZFVjRlBGaVpSUVdxTU1WT2lHZjdsaG5L?=
 =?utf-8?B?TThKaHg4QkQ2YmMwWDRaekFGUWQycUJpUUZHUlpFS01iNzZ5OTVKNEE3Wmx2?=
 =?utf-8?B?cHpUdWQ5TjQ1NXkzb1I2TXdIOGFBbWp6TjJhcnllNW9Xd1hhZFpWcnNoeDdJ?=
 =?utf-8?B?b1JybWtKL3psRVJGY0NrV1hHMUprMjVxVmxGMmgrSXBmUW43TjVURXJmeE4w?=
 =?utf-8?B?S1pLS2xBK0VDSUZ6V0dMRmNxRVYyQU9DdGJ6WTRDM1ZBVFg4Z3JxREVzU25B?=
 =?utf-8?B?WkR6Wk1mbDhWaVB5UTA0dFRLd1NnPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:36:17.4180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78cd707-a648-420b-667c-08de58d8e8d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[yishaih@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:edwards@nvidia.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yishaih@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155D555505
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 20:18, Jason Gunthorpe wrote:
> On Thu, Jan 08, 2026 at 01:11:15PM +0200, Edward Srouji wrote:
>> +static int phys_addr_to_bar(struct pci_dev *pdev, phys_addr_t pa)
>> +{
>> +	resource_size_t start, end;
>> +	int bar;
>> +
>> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
>> +		/* Skip BARs not present or not memory-mapped */
>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>> +			continue;
>> +
>> +		start = pci_resource_start(pdev, bar);
>> +		end = pci_resource_end(pdev, bar);
>> +
>> +		if (!start || !end)
>> +			continue;
>> +
>> +		if (pa >= start && pa <= end)
>> +			return bar;
>> +	}
> 
> Don't we know which of the two BARs the mmap entry came from based on
> its type? This seems like overkill..
> 

Actually no.

Currently, a given type can reside on different BARs based on function 
type (i.e. PF/SF).

As we don't have any cap/knowledge for the above mapping, we would 
prefer the above code which finds the correct bar (for now 0 or 2) 
dynamically.

Yishai
