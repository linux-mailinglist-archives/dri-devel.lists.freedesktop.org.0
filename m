Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO6HNmttoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:09:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9691B5D4F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350710EAE2;
	Fri, 27 Feb 2026 10:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="knsPf/M7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012030.outbound.protection.outlook.com
 [40.107.200.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE2510EAE2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcbZMuxvShHE0YtGWiU6xNKM0gy64xXFEh+FWf20Ty+21JKkqpZwnErhC6rzohkHwmL8JwgDYjkgKQ43VK2EqtYt/VSSxHTuADpnFqy6Hkj7eG3Z40CisOWS+o2vq8AqMjYdgW8NezqjQ4gVzlBLfL854RQVLRBIBBvqlkIjti1lKubUYiajSxkRjKd5ng0UAaHKAjxEra9teMew4yGHpKNEVf7bN5pd0gAIwS6J1jFo2BxVe0s0rAmLOlGXoFVDRcCUUCQUTexgaHbqjWPuUUjTAx7TBSJUhqU2f7wVrrY6c3dpy58h9K8j62YU1c+mF8HkNkA0J8jKPESJh0xnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO0nk2qeix7x9SiH3FMMtxKxqLkx562bztrsPlIU84U=;
 b=txh3hWUqp73IgHWIS2yxY0ze5tDdpC9hao18yQKV0Sqo6vZeAAsUqkrshKUJK9IGbd532o0U5BXvoBzLz9Evk8BNPhMBTz8FX2SHtJeg4urwlCT475lHn1/NU0cLb6IdbBbSqvXfFlQat1ZkkT+XhXYfL4EHhQOY7u36DbC91O3gCOx9KXPxa9ChrMP9BEzsPAt5INd1RxT1/GNPfGuJdPEVxyCYe0xXfpEWEdfzDuXIJgGbtYr8AS47EzqSk+yDGJ8MFzpW3PwdSFjAJRd+IyjpULcTAEZnAPyulZbxo1O9469L4rrqLySO4X2LXeD3zcNeb/xCY/L0q9yQs8b4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO0nk2qeix7x9SiH3FMMtxKxqLkx562bztrsPlIU84U=;
 b=knsPf/M7HB8e4kEnusNtRA/aPyUUKSQIZaEHqVksPpjNKJRaqPc+1YIs99gXvABbkQMygy66ukNgivLfheDTANugIxisFxGN3sEnrJYXo5eOIp/4mMF0UzkmJDfxDbyBUeeyxsEJLHh8FkEFOz4jkZrdCzy9YztWd9LxY9X9Yng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 10:09:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 10:09:40 +0000
Message-ID: <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
Date: Fri, 27 Feb 2026 11:09:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
To: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260226202211.929005-4-mattev@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 446a5cca-dc2e-4a7c-9bb1-08de75e851ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: Pg2vvtpoSMgH75bcls5Ds5PYUN1PoewR2NHOEQsmijnyI4lxJ/AAj8+oIcnv5iQS1EjydP+SbZYwHtQu3MAmdZF83vAUStb1W7Nf69SAa8wLzrsHJ+WfxUQj5g6Jr9Uy5CHOUuduwsxGMQAc9vIY0TRWuKatodxNa3TWi9/mZbAOeQalOOhDV+8rtaZh3TNM/KxtKsE/GWQ3Wj04sgOgIC/lpeIr2771pAvg2l4UffmgOpW/wWyVd3LlgbG+oUHQjiAyXtxBpCIe0Ekm1310UlONJ5Z+zNt26yD5pMWkOq147Qv9n/vdeP4iBGdT/28BA3Aml2TMPCDscD4fRNqkXwXnQFxQ6CQ403Io8DkD5On2tlhP7nUKVHY20Y3KMvHmz9m04Z35EKOZKFXw7di8zL8U8YFW1EPjXxrmad8+FEkqt3F8CU6CCNgalLl+w4FnZF91b8unaKwc1zwnod/+1xes6VWfo9dFRAy+rt0Z0OI3oFgvISlT9ns0uUTTLuhBbIoSRu4vh2T/tpOSFUMKn+WqADFVUIY82KmkKa32zPf7oCc0S4byRLkY7u7kelKW9n/87Udb5fsEkzgkNlFI2yP/BIvAjq+ebCsKqJpE5KVLzqb6pTLFMn/4xWm2M8rzNq4uIYse2VE6YKctsFs2HHog851dXvwwYaXMqTaH1H2HRJlKHJrGkS8PFjc8P34NYd4AJxZUKmABnmRKAzodC3sMTKY9HSXJZFgv6OjB0p4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGgvWTIreE9aOEp5NW5KV3FwaTZxL1MvRDhrTFhkVUJBUnVRREQySEVIUWVs?=
 =?utf-8?B?RzZ5TXVsaUtUZEpMT1hQanVPTUJuMVVFUzdaT1NJV0VLUS9Wa09kVEw3QUY5?=
 =?utf-8?B?aWEybDlNZHQ4Uk1GeFBzWTdiOUVkRGdzTnBxSmIvamt5TWlmMytUNG1DdVlH?=
 =?utf-8?B?aXNiM1NTYm5OSHMvTUgxSFZWdXljM3g4VWhNVEZ3VlAzMU9JSStpYWVtNnBw?=
 =?utf-8?B?RlFvbmgrMW13T0Fmd09oZmxqYndOeHRaT2l5Tm96V2FObmtTSU5sSnJ6Qm9L?=
 =?utf-8?B?UWgva21uOTMyVU5GSmlNMmdpQW51T21jVVVoSXlhSTBLeWQ0TnlhMkR4R25V?=
 =?utf-8?B?dWphVEtkd0JETWpqQmp4UjZXNzVVSnZiNDFQYXBoSjFNMzlNWWN4cERlME9o?=
 =?utf-8?B?M1BFb0VrWlZCYWhQb0hyNU1LSlBJOUdKbEhGR01BVzJ0UGhaRm1aVG01Nm9z?=
 =?utf-8?B?ZlVMQ0psb1NRTFVYV0hUREQyUnBWTjlaWUhLVVRuTnBUOEN3VWFHbFVQTEln?=
 =?utf-8?B?T3oxK29jQ2NDUnYyU000OU9DQ3F3YUhDdDVvWUFKS25JOFBVWWNpKzRwNDBl?=
 =?utf-8?B?TlhUTmRiajlZaGxEeEVUT0drTnIyNzZUUTVSVlJOc1ZMMEl0ak9XVXQ4N1pE?=
 =?utf-8?B?SlVKd21aeFFSdk53YWRLbDhOZkJMcWIzZG1UbklpUENudTAzQW40YVowbXZM?=
 =?utf-8?B?NEZya1dnWkdpYXRoVUkwc2JhNk0vQUFqYTZDNXRnaFBUaUx6aDkzSHR2RCtF?=
 =?utf-8?B?Y1diRXlYeml0U1NHZVUwcy9nN0FYTlhtWmIyemh4dlRFcVQ4YkU4ZHR2WUtr?=
 =?utf-8?B?cUt4c0VPQktDYVVwVk5FUk95M0pVOTE5cGhCZmdwZEF6aXgwZW9LVmhYWXpi?=
 =?utf-8?B?L1lvNkxBQ2FrQU5EZUdpMmJoRDJOKzNSQTZ5Y3hLVGFPMVVjZTUvdDVYeDJk?=
 =?utf-8?B?amtOYmZSRnNpeHZUWWNRRGZkYTRNQ1VTNTFkRTlmL1RYemZxNTFXaG1yZzNH?=
 =?utf-8?B?U2UxdUZoNjNKQ3Z0Ukd4TlZTYUo0YjN5WmFsaGhVUjNHaWpzV3IvT0NNdGhm?=
 =?utf-8?B?elg1dEh1MlpPZXpDTlJheXJlK0pBS0hwK0xmVno1aFlqV0VIY2dIcEtscTF6?=
 =?utf-8?B?MkFNY1h3NVo2aGgzUTdGWWJVcTRrSUpDN2NRQ2xHeUwxSGl2bTNGVXI5SkFP?=
 =?utf-8?B?MEhTMTJkbkk0dWxNKzVDQTV1WllBYklnNDZwa2pWK2o0ZXAwZTl6bW94WVRC?=
 =?utf-8?B?M2pjbmpOSTRqSjl5ZkhvTTArbWxSbmFPd2ZFbWtCcDdESnowQ3E1ZHRDVDFQ?=
 =?utf-8?B?ZGVNS1VZTzJKWVU2UURIWTVzdnlNM2NkQStseG5ZZ1Btc0hGQVdDNVpQUUhJ?=
 =?utf-8?B?ZXZUemkrVCsvZmFrVnFaMUhoTlVHTEl4V2VQbGttbUpxb0NLVzVEc3QxcVgw?=
 =?utf-8?B?MW95RTBGQmtLdVBzcVF5alNmV2loZ1ZtaHRBYW1vT3pCWHF3ZVVreGdlUmM0?=
 =?utf-8?B?ODFuMFZnT05aQlF1U1F1c01lRGwyNGg5eEszaUN2dnhPL0c2bEMzZEw0ZU1P?=
 =?utf-8?B?ay9WMFJ0VStabzhzbWZVYVFNV09OaUhkNWg3UUFxWnRoNmZleVJ2WU1LY3lS?=
 =?utf-8?B?MnpiSEhQTHhZb1UxL3F5QlZScEdaWTZBREZONElabmU2Y3lkeitzQ1VvL1BF?=
 =?utf-8?B?WEZSQk5RM3dMbVRaQ0lsaFVsZVVjUVhQNmsvMFZpdHFuVVpRa0VPUnhBNWJm?=
 =?utf-8?B?amVjOEpnSkpYRDVxeWIxQm1XL1FuRlUrMmhmb2hrbzQ3UXlieWN6TnVoOXhJ?=
 =?utf-8?B?RWJ6R09kbGU1VVh1Q0FtWk5EUXBGcEVwSTRpS05zQWI0b0lZSGtwODF6Z0tw?=
 =?utf-8?B?d24yazJYUlA1UmVLbHoyK3lEKzVTaFJDZWNvMmJSYzBDeS96TUpJRk4wY1Jy?=
 =?utf-8?B?KzJ1b3dwMFRqQjhDMzNQNEpBWGZtODNPQUYwSVhYYW51YjFFNG9NWm1jS1kw?=
 =?utf-8?B?dk02S0cxTHlVUTJoSFNzV0NTWjB6Zm1PRWc0c2N5TC9zZGRpT2I2aUVQY09C?=
 =?utf-8?B?bER1SWhWT1RWWUdtV2plOWd2c1V1OVRsZ0pJTS9VQXpYMHhsSEttMFlrdlYr?=
 =?utf-8?B?SGJ2Q1J3c3hVQVE1TXBsaTJ0UGl4YUYzRElGaFNRdmdrbWk1RDQ5ZVAwMDF5?=
 =?utf-8?B?bFh5UlpldWVhT0ovbXp4VFM3ckwyN0lNV3hVVnFzU3cyTEVIZVVrR0k3cFB2?=
 =?utf-8?B?enJRMExvWklDZDFSdCtaelRzQ2FmMU1jQUVPL3hwVVdKMThYaCtnTzRsK3Rv?=
 =?utf-8?Q?HHWlWk4Eb/JdrLsT62?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446a5cca-dc2e-4a7c-9bb1-08de75e851ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:09:40.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYHPsmhhCvtJC4kFOoPHF/5Xjf0eZJQx7qcHgnHOANsqa2hyXpYhj9A9HWbGsr3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mattev@meta.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 5C9691B5D4F
X-Rspamd-Action: no action

On 2/26/26 21:21, Matt Evans wrote:
> A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
> support for mmap() of this fd.  This provides another route for a
> process to map BARs, except one where the process can only map a specific
> subset of a BAR represented by the exported DMABUF.
> 
> mmap() support enables userspace driver designs that safely delegate
> access to BAR sub-ranges to other client processes by sharing a DMABUF
> fd, without having to share the (omnipotent) VFIO device fd with them.
> 
> The mmap callback installs vm_ops callbacks for .fault and .huge_fault;
> they find a PFN by searching the DMABUF's physical ranges.  That is,
> DMABUFs with multiple ranges are supported for mmap().

In general sounds like a good idea but this approach here doesn't looks good at all.

Especially how you call unmap_mapping_range() from your DMA-buf cleanup path looks extremely questionable.

...

> +/*
> + * Similar to vfio_pci_core_mmap() for a regular VFIO device fd, but
> + * differs by pre-checks performed and ultimately the vm_ops installed.
> + */
> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +       struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +       u64 req_len, req_start;
> +
> +       if (!vfio_pci_dma_buf_is_mappable(dmabuf))
> +               return -ENODEV;
> +       if ((vma->vm_flags & VM_SHARED) == 0)
> +               return -EINVAL;
> +
> +       req_len = vma->vm_end - vma->vm_start;
> +       req_start = vma->vm_pgoff << PAGE_SHIFT;
> +
> +       if (req_start + req_len > priv->size)
> +               return -EINVAL;
> +
> +       vma->vm_private_data = priv;
> +       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +       vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +
> +       /*
> +        * See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED.
> +        *
> +        * FIXME: get mapping attributes from dmabuf?
> +        */
> +       vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
> +                    VM_DONTEXPAND | VM_DONTDUMP);
> +       vma->vm_ops = &vfio_pci_dma_buf_mmap_ops;
> +
> +       return 0;

Let's start with this here, it just looks horrible over complicated.

When a DMA-buf just represents a linear piece of BAR which is map-able through the VFIO FD anyway then the right approach is to just re-direct the mapping to this VFIO FD.

Roughly something like this here should do it:

	vma->vm_pgoff += offset_which_your_dma_buf_represents;
	vma_set_file(vma, core_dev->file);
	vfio_pci_core_mmap(core_dev, vma);

It can be that you want additional checks (e.g. if the DMA-buf is revoked) in which case you would need to override the vma->vm_ops, but then just do the access checks and call the vfio_pci_mmap_ops to get the actually page fault handling done.


>+               unmap_mapping_range(priv->dmabuf->file->f_mapping,
>+                                   0, priv->size, 1);

When you need to use unmap_mapping_range() then you usually share the address space object between the file descriptor exporting the DMA-buf and the DMA-buf fd itself.

Otherwise functions like vfio_pci_zap_bars() doesn't work correctly any more and that usually creates a huge bunch of problems.

Regards,
Christian.
