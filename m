Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FLuNHRsoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:05:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBA1B5BF6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5A10EAE7;
	Fri, 27 Feb 2026 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bA/BA7HU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582110EAE7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:05:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqcMN/ivMj1km2uuThlSyfuoDmP84juJqbOrcaZUzQ8+YK4iHYYQnJva1Lhe4QDv0BEg95ffGtwViNB+sBzRLqmhidKCxvQFT5x1+KonOnc9BXD2fT+IsIs5GxsaMxpJyV6C3ejUY+8fkp5jV4eNuREnaP3SP9ihex42miudKm9UaFGkwaOzLXgeShsIT/D7TDRxmVhZmXlTfvp8EUIYqjtZyvlM9rRy8ddOSwzqjECgJYlmMbe6yVX2YhXo/nq7lSCsmIdqO39ndVQwpCOrYKgEhGKZfa0SKw3kWJyFjjPn7XiK492aUWxVc/4sxqL3LrObpvMlxGNdxvnZkPwy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlxmKmuDeIDjHL9kwblbR4uINzVEeovOWU4h1/4ROaA=;
 b=SfNr3zSSHb2HamFcSSZ/HDp42OliTeSpE/o4cAJKHMBK3uT7yW0IPiaCW9XvHTWdBQzUGTx540j5XeZklIyFLMeQVWgBQze8pxLMIz1Jal0wyCEbccWdUmkc6YnGMjfPsQ/30gkZABw2haaWJ11MGkf8O4gmTtE+mh5C8cnEVqZXI671q94XBtlwhDR+/9FwlwZ3bbam/RT7AAQke63bJKdStNUjeXKwUckRLoVOv6n4EGQf2qpOo0pahbQV7q2SDLxDaN2UqMkkqZN4zFf0a3ZRbMTJgXn/HeqnD70q89CU+5i43T6XjY/lexB+nz7Z5UATV71trlapyShw+STiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlxmKmuDeIDjHL9kwblbR4uINzVEeovOWU4h1/4ROaA=;
 b=bA/BA7HUQoR23zTx1Oj0e4S1UeLgsJSd86zKB4tnJsJygD+cI1rv+ASIsAYFfFYxyksBp7nCr8L29wkka7h2I8z70Sjc+LdblaTNSoBIB8fwnTwpz5ZmS/pmtn3VI9C+Qecry/so4IngMUPhKzoxo+g04Dt1Qy/I5Hw2JGpvwB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 10:05:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 10:05:33 +0000
Message-ID: <f75088c6-5795-49cc-8932-ea46c2223d74@amd.com>
Date: Fri, 27 Feb 2026 11:05:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] dma-buf: uapi: Mechanism to revoke DMABUFs via
 ioctl()
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
 <20260226202211.929005-5-mattev@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260226202211.929005-5-mattev@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0291.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: f874b616-714c-46c9-7f12-08de75e7be79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: buk4rNddqrtQSpIqSVI4x0wPIR/a1qezMGO5SQayFZZLt4CCRvbRdEKIxRvHube9leP9esMMLApYEpclXfNtq9Ths2JAjdahcxS++A6lcIShK5sdhOHSU4CTWMjh2y8Y32X4/1NlIO6LPxKCyeQZuGGHBgyJfnazT2jh2AwWET1nqU3Avf81KYwH5vYr3d5fkJdgfe/rnDYH5C3iGG7L20lFCrBnCEEf/q3SMhuux1KzjmTJ0GaXNNuhKY5I0/RAxqLXS0u1UI2ZuIOlV1qKBgsPb62USbG/FCiPLLTLGtfZARSo5bSsgEqcGxmhyvAPCZ8oOWrg96f3T3tu0HXKeHXijGbjw/rPIE0Mcc7rMvYraQcZ+YbPbXkNpPy+dyGGEeZeV4r8j1mO3ROI7M/CiTKjM/+6VOsiA2cabAZClCOi/X4flckdvlJBYvySNYHO6FVCTSMsWRflMWWOzFSGj2Q2X23a6TRaZQgT4H3FBymU6+ZWK67XcHijynTpAN527da44YTIHb2ON1J7kPYajNadDhCcl2bCO/SU4cLoV+qwiRrOVEOF6DSH7GDf0y1dM1aTTPCnkrdt9rGOw6BwmxuzfsB1aDQLgUZ36bRmYtoj3+uG5Os/0cRHT1z6XLCa+zHF4pwGQpOBD5S8tvFGdb0IIVq+k1y0CEoXaOWhRbAlP9QgN508D5EKC5p+t9+yyuiArGZzfl3O8NPc1nWHeDEMqUWfV/UKDm2oZUguhOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkI3YmVqaUYxdks2eUtFMWppSFNuUlhSZ2h0cXBYczhzWHhERWZJNHVUb1Jj?=
 =?utf-8?B?ZTRtcG5oemQ3djJJdlg4N2toNTN6bkZTTTJrbFYzOVNXYlRPSXVQRitURTRR?=
 =?utf-8?B?WXNjTHJwQk1KcjhOZkZ1RnZOcHpOckQ2QnhXajAreGZrdHQ1eWwwaGpmdGZo?=
 =?utf-8?B?ODl4aURGMldxcHUzeTl5aUVkZ2hsVENLcmJqOFhMSDJ5U1EzczBqazg1bXNZ?=
 =?utf-8?B?NGlSYkUxM0RaSXE0ejgzaUNXVkVCWkszQ3FSUWdmQ1B2cFdRdGd3QUdmSWsv?=
 =?utf-8?B?S25mSUJIUDNnYUpodVdpYXNyeEoxOW95TElFQnJsNGVtRU1VaDZGVXZncFY4?=
 =?utf-8?B?bWpYa1diMnkzcXBmOEhjdmQxTzNkQWVrRmtVaTl6dC9OTmNuOU84UTNOYU1u?=
 =?utf-8?B?d0NZR2VLZDJ1R0xtaDFmcklabDY0a1BVaU5FbWorOEVtdDRSNDB5UVd1S21m?=
 =?utf-8?B?UG5rL0ZRQ0Rpa3BsTVhZRGw4aWwrejBMOG5LdUZoSmhOQWduUHB2Zks4YXlQ?=
 =?utf-8?B?WElCSUp6RVYyWTRwU211RWdTa0g0cHJUUHV4dy9vT092ZFNBNGdjdU9TUEly?=
 =?utf-8?B?YUtrZjllbGdJQmIyeU5MMVNtUkRZR2JBQ3BnTDArbXRldEsyei92d2N6d2p0?=
 =?utf-8?B?K3kyY21BQlhvVWFEQ0djZ0VOcHlEREpvWm0zeXZVMXNqOG9uUE1MTmtBY3Ex?=
 =?utf-8?B?TEd4Q2U3V21YU3ZORXh2UWxBc2FnS2NFb1AzVDlwekZzeWJmd0xrTElrVVBl?=
 =?utf-8?B?c0U1SStvUlZiRlhISlpsYVZvTFUxdGVabEtVWks5UkxSdTFpYzQyNEprczRm?=
 =?utf-8?B?WnhrTVE0UHVML0xaRDlpdFRXY1FKa2VRUFJIM0pVNGpyNTFpNEVBYUtWY1Y3?=
 =?utf-8?B?bVZCUUExVFlqQnRhSm00SjJYMEZVZXhSUmdXUWROQ1hselFkdlM2aHpHL2Vz?=
 =?utf-8?B?bGNJWUxyaXJGalZFdG5VdndzRHR0bVVrQm9QUHFvM0JSYVE3U0NRMUFqN2V3?=
 =?utf-8?B?WW1DLzM3VW51dmU2cGQ5eFlsVEp2WGFaYW4xN2RXRDFucHd0Q3RuYUVRNFlR?=
 =?utf-8?B?L3NsWG42Y0ZEUHFWc1R3UGxsWmg4OEZHdlFaVUtnYzZoMzJwQytUT2JIMXZJ?=
 =?utf-8?B?WVBLSW91MFUySlFBTk9HeHpwdHY4WTRXN2dJMHRyTU4vY3Vwa0hSMHQzZ2JU?=
 =?utf-8?B?aUVDcmJjNTVrZUgyVnRBNUZKYktuNGprUndLbW5QckRYUUVJNFdsN2o2ZXRU?=
 =?utf-8?B?N0dRZWlaWUVCcE5lWC84eHdVblVGMFVmaEREMTJXL29MaGcyd1NaVXNsVkhK?=
 =?utf-8?B?OS9nb00ySDBzdjhiVm9zRGtRTXcvZnBaSHNKamhGUHBCY3lFRnFWQy80dmFD?=
 =?utf-8?B?dzRxdS92eGhqeWpMY1dSUHBhblBRYXhmK1VJKzVFdkdiMGFQamNncW15MHha?=
 =?utf-8?B?VUUrUmVSd3hzQlhRS1hhOHY1dEhmZDZJNzVVQ0c1QkNtbXlDTjVMTmZrR2FK?=
 =?utf-8?B?VWU1MFFrOFNOd1Q2d3FXOStndm9vY0swN2M1dFJURUlFVW5nMlZTbGtrTHEz?=
 =?utf-8?B?STRESElhbkU3S2pOdVhsMmRIaXZ6QnplTkxzbk5mM29FMjAyTDdVOS9YSjhP?=
 =?utf-8?B?MXU2VXF2MXhTMWhENXY2cDNFQWZ0VHVmdDFiTkJrSE5UOXFXekJtNVJwT3lz?=
 =?utf-8?B?TllGVDNTL3hSQWR2a2NOZ0FRNW1oMXlCZVF6LzJIaUpGT3NpQlFIZjFYQ3Rq?=
 =?utf-8?B?a0dMTmtOR2hLN1NUTWRpWWhqQzg1MDhoUVhkam1jUDhqM004VVhKVE41djNv?=
 =?utf-8?B?VXF3TGNwZU5xVXNjNTdnOUsyZllpVExpMlY4RDNrRDduVHhyTDJSaUI0VjhL?=
 =?utf-8?B?UWR4QXpLdHl5dHhUSkY2em5qaHdVSEtMYjVTMUlXelBtT2Q0V0J1cGxyZUV6?=
 =?utf-8?B?UmhCTHFHOEVKektHTE1aVDh6QVRpTGpnSGpYQlZ4RHVEV0QrU0Z1U0QwNTNX?=
 =?utf-8?B?TDJlOGR1SXA4K2xtWHF2aGxncHBJV1BDVDJPVGR3WkVvSURlWHFwNWZZbGxn?=
 =?utf-8?B?NDRHaGVCQ2owTDRGSjZCbElKTDA5MTBueDQzTGI0UlhCb3lRMFh6Um5ONUdL?=
 =?utf-8?B?LzZhc2JNK3lxQm9iOHdMaFJwK01vQk11OFIvTkh0dW5CYXBibGljQzNtbzhC?=
 =?utf-8?B?MDBFTXI5UDNaOE1lRVZaeVA0ZzRPQjM2SjZpWE5QSUk4TmZoeFhHN3IwWmI0?=
 =?utf-8?B?RU02NDFaUW56UUtLMGMrc29UVFdldWpSYTRvRGtQdDNrOWxKU2V1QXJ6S0hB?=
 =?utf-8?Q?cmUXtQZGRD600YRkEr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f874b616-714c-46c9-7f12-08de75e7be79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:05:33.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5pIozMZIUIGUR2ZxLVc9Gdc6arNylA+fwGXwVAJ86ZVsE2Hr44w1+bRp3xhrOKb
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 63BBA1B5BF6
X-Rspamd-Action: no action

On 2/26/26 21:22, Matt Evans wrote:
> Add a new dma-buf ioctl() op, DMA_BUF_IOCTL_REVOKE, connected to a new
> (optional) dma_buf_ops callback, revoke().  An exporter receiving this
> will _permanently_ revoke the DMABUF, meaning it can no longer be
> mapped/attached/mmap()ed.  It also guarantees that existing
> importers have been detached (e.g. via move_notify) and all mappings
> made inaccessible.
> 
> This is useful for lifecycle management in scenarios where a process
> has created a DMABUF representing a resource, then delegated it to
> a client process; access to the resource is revoked when the client is
> deemed "done", and the resource can be safely re-used elsewhere.

Well that means revoking from the importer side. That absolutely doesn't make sense to me.

Why would you do that?

Regards,
Christian.

> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/dma-buf/dma-buf.c    |  5 +++++
>  include/linux/dma-buf.h      | 22 ++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h |  1 +
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..b9b315317f2d 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -561,6 +561,11 @@ static long dma_buf_ioctl(struct file *file,
>         case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
>                 return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
> +       case DMA_BUF_IOCTL_REVOKE:
> +               if (dmabuf->ops->revoke)
> +                       return dmabuf->ops->revoke(dmabuf);
> +               else
> +                       return -EINVAL;
> 
>         default:
>                 return -ENOTTY;
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 0bc492090237..a68c9ad7aebd 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -277,6 +277,28 @@ struct dma_buf_ops {
> 
>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> +
> +       /**
> +        * @revoke:
> +        *
> +        * This callback is invoked from a userspace
> +        * DMA_BUF_IOCTL_REVOKE operation, and requests that access to
> +        * the buffer is immediately and permanently revoked.  On
> +        * successful return, the buffer is not accessible through any
> +        * mmap() or dma-buf import.  The request fails if the buffer
> +        * is pinned; otherwise, the exporter marks the buffer as
> +        * inaccessible and uses the move_notify callback to inform
> +        * importers of the change.  The buffer is permanently
> +        * disabled, and the exporter must refuse all map, mmap,
> +        * attach, etc. requests.
> +        *
> +        * Returns:
> +        *
> +        * 0 on success, or a negative error code on failure:
> +        * -ENODEV if the associated device no longer exists/is closed.
> +        * -EBADFD if the buffer has already been revoked.
> +        */
> +       int (*revoke)(struct dma_buf *dmabuf);
>  };
> 
>  /**
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 5a6fda66d9ad..84bf2dd2d0f3 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, __u64)
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
> +#define DMA_BUF_IOCTL_REVOKE   _IO(DMA_BUF_BASE, 4)
> 
>  #endif
> --
> 2.47.3
> 

