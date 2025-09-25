Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFDBA07C0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DAE10E997;
	Thu, 25 Sep 2025 15:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nPhcsYZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8610E98C;
 Thu, 25 Sep 2025 15:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvlPDWk1BYbL4fXMD1TaFnbsSdKlfb3jGyUFaELcmtjlgAFbgA0Je3WZKNYmhLA3d4yUw8y7s7g/zJTm04CQw+t6yXU92qVonldznVmDN8Rs8SLuRlKgYNnMOSVf2553uYz6df7S7qz6xGEu6ECwdMHEA0IQig9lt9oH9o3K6b7MNRuGHnYi1qisPFH9gIcK12HkGfi4GkqW/qvi/diUaVsuiwJl/7VHmalnxU5Ds6eSD53X6xUhpMF6wxyfewHZyOW1YZXNtMk3dtCie42++i2y/Ozmj3N0XQ03EmyBLv4uQRWFshhw9bsgg4a6FGOkdR7m95Q+79nCvp5hCzLJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9UjwPvdVrcvvh+tmpBvno59vbHBIZ5pVuf9+Xf7gAM=;
 b=khlP4of1lzhGs7nEDU1HrGL2au/0ug9b/yCi+qkuanmHyzdUPfK5yWS0NEJtMdzEG+L5TrMuCFthqlQClOUOq2d2pVfPg/SPolij7iyRmxsHOweuMtI2G+AHQoLnASICSjvI28er/a3zOkDSvW7kzKylCxtMCqyWYrJ8FL2psH63uXU7MJronjXgsln68XJtnBIcoZck1t/juFe2Nn5RClncx+NAj1ZaLwEclL6vhcwNm2RPLe49DXW2tFVTLicRg6l1nqVaJJOBjrv9/UDFAIQwUzHFGFQAj9pe9TjB/IA8bP2PDSpA+ojICr2IDXdoLa6BpT3z6pSo6o4XPWRo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9UjwPvdVrcvvh+tmpBvno59vbHBIZ5pVuf9+Xf7gAM=;
 b=nPhcsYZMqEebWE+Mqaq4AaWvR6bAJl2wB3XV3m2/QV7h6gLnsnqiXu8zh5AGhWDm4tqr18t+pT8IylqGffgWlMIngjhZXQT+jgoms17BkTBDQ41Dvd3D+p0OOxoWBBRDprapObBZOdN3lJ+bw+aIG94azUmSPEJNullHpZyvHYvDhx0w+ee4zYqTifZLloRwm/Oc5tloKnrWRvDRSkbuItlm3Gs8UyNPGQQ4LJHgW80zq3xN8AztinD8jfrr0QzKezMXQzJcvTlkYW6wwdmdacAaf/7XsdvrMmgaFYxfY9g8Qu6738qxrHNtRyqOgqf+N/Mxn2o6kBXbJhR0ReCtrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) by
 PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Thu, 25 Sep
 2025 15:55:19 +0000
Received: from DM4PR12MB5769.namprd12.prod.outlook.com
 ([fe80::f5f:6beb:c64a:e1ff]) by DM4PR12MB5769.namprd12.prod.outlook.com
 ([fe80::f5f:6beb:c64a:e1ff%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 15:55:19 +0000
Date: Thu, 25 Sep 2025 12:55:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250925155517.GA2617119@nvidia.com>
References: <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
 <IA0PR11MB7185239DB2331A899561AA7DF81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ab09c09638c4482f99047672680c247b98c961c9.camel@linux.intel.com>
 <50c946f3-08c5-421e-80bf-61834a58eddf@amd.com>
 <f646f5e281e0f53656847ad4eddc3cc215c684f5.camel@linux.intel.com>
 <20250925133323.GZ2617119@nvidia.com>
 <62d722e45981fbf2e86f59aa3978be5b230b0a4a.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62d722e45981fbf2e86f59aa3978be5b230b0a4a.camel@linux.intel.com>
X-ClientProxiedBy: YT3PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::17) To DM4PR12MB5769.namprd12.prod.outlook.com
 (2603:10b6:8:60::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5769:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 766cff20-c109-49d8-afa9-08ddfc4bece8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtuNy90UEszbkhsb0FQV1R0WnZUSC9zcVI2RmZmdGRZN0hBQzdoZFRqTmJO?=
 =?utf-8?B?RmFqS2NTTVRHdWNEK2wrY2xIUVZKTEJHQTBmSDFZVFVsSmd6bElnb1F2d29E?=
 =?utf-8?B?RXhZY2hqZUhFdWpoNXM0QXVGaU1oQ3dGYWJBd3lUaDVZcGhZMzQ0dTVUdklp?=
 =?utf-8?B?Nlkrc1JGTFJIR2szdUpBd24yQk9vL00wWVJnU3YycmoxSEZNNzNhUVRZdEl5?=
 =?utf-8?B?djlocDVvaWp4aC9TZGxRMlp2ampkR0k5OWdxd0RZWGo1NWJSbEpISThidkRV?=
 =?utf-8?B?aERWcFV2MnFxaFhnRFdvS1BrTWN1VFFoTHVvRURlOVhhblRZa2JGeXUzcHBk?=
 =?utf-8?B?ZUpBaWdVRnc2TXpNSXlxbUhrSGc1QkJJZ3hBUDVpTDl0UkN6V2pldGRGSlRn?=
 =?utf-8?B?S0E1WlF2cjVLQ0hDcEordi9aK3VEQ2tmQ0tzckp6QlRjZTBUOFU4bHJIOU5K?=
 =?utf-8?B?ajN5NjhoMXVSRUd3bkxDYzcrdFJvZ0hiOHIycTJ6cWwyUFJMM3N1bU01Y01z?=
 =?utf-8?B?WHJiekxvREhweXM0SDJ4TGtKcUp6cGttM00rdUVNN3lRLzQxUGRCUCtldGhp?=
 =?utf-8?B?UjhndmYvdFhOaDVoUkQzVktqZjFIVURsSW5leHpUZmpHZWZaYWR6WmNQSVJO?=
 =?utf-8?B?ZEJVRVhYQkNGamxnUWZMY1VIbzJCWHErNFZtYmNxM0s3YlVKNTluaHJrQXNi?=
 =?utf-8?B?N1haMWdSa01qNEtqa0l4aCttMzlmSWZQUHdTbno2REl3OFZvb1FmZTUrRjZx?=
 =?utf-8?B?b2VweXd6UjdaRDc2MEZEMlU0WlBKNFJaRVFQS2FCWXZDaWNoVCsxVXJ6YVZL?=
 =?utf-8?B?Z3RvbXNPZ1BVc0NCYnhvak1JR3pjcWZpVGE1QjhPUUJSb2dyOUVySVRuWkFq?=
 =?utf-8?B?anpQVlByWS84b2orSDNkVk1xR0lVOUpESHp6RkZuTDBVZEZMSVBuRFpJSk0x?=
 =?utf-8?B?RUJJVEZtMUV0d0pSeWUyK0JxaU9YNmFxOEJwVkpCRkF5dlQrK1dKOHltK0o3?=
 =?utf-8?B?TUtPSWs0dG9HeGlpb24rVzN6cFhsOGI4YjlSejVGRGlWeWFTd3FDbzFONHFQ?=
 =?utf-8?B?NXVUeXYybUxQakFnOWZSbTBNQlZzMzdBWkRWb3hXUEpGYnl4SGZ1SVF3bTZJ?=
 =?utf-8?B?Rmt0NWVYa0haUmNLOCtSQng2VWlDQVRFY05Cb2N4Mm9BbWNla3FyTU9ENCsw?=
 =?utf-8?B?bWtCRkR0alRRZWo0NE5BRWtsdzB5WTRPcEt2bTRDNGlpTnZoVEdVZ3RDU1dv?=
 =?utf-8?B?TDVpRDdtNDRndW12czJwQk1sQXRZWlhLOHpRS3RDaDl5UHFPTXRoSm0raElW?=
 =?utf-8?B?Znl6ZjBtUURpSEdNaVhsWGdkL3ZvVnhnSjV5NlhYV04xU0JNS1BHbndVdmpZ?=
 =?utf-8?B?aUdkaThIZktrYi9GWkxabUVEUE9xKzZsK3A5WTZGWUMwTXhtZ2ZzQXByaFhF?=
 =?utf-8?B?UTdzVE9tVnUwbTRkR0dwbnU1N3BqQzNrR1NPZ0NOUHpFMVBjNnMrWE5kYThU?=
 =?utf-8?B?QzYxVVBMVzFVUndFaUV2U0paa3pYSHpBRHM3djFOUW1jUWJTM1hZSXRxQ0lL?=
 =?utf-8?B?N2ZEemJGaEtPQ2JMaDdIUkRRR0dDeDhvSWFJUk9BV0dPRTVjUWs3L0MxOE9K?=
 =?utf-8?B?YXJ2VFA3RzVkK0lmbkM3dVhDOGZGQUZqM3FPSWRuemZ2Tjc3dzE3NlYrOFBH?=
 =?utf-8?B?ZDBFQkg3U1B5bm1Nb1o3VHRjSXVEZVc3ZnIybWJUTVNFbjdQOHc3WDVvcDVI?=
 =?utf-8?B?VXZQUnVJMkxJVVZHNW8rME1UUTQ2RXl5OGZOUEpGT2pTN0ZuMTRQc2pMUWxa?=
 =?utf-8?B?aHo3OEczeDgza1hpOGNYNkxjcjFXeWh1L1dOTzRlUUwvaTRqWkpYNjAwRUNj?=
 =?utf-8?B?dzBLWG83cCtqMnNkK0RMTndmZlRsZm1oL2JZVkJpVmJCRU5FaDlIK0pFQkV1?=
 =?utf-8?Q?K4cn4X2DoeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhSUWcrQXRqandTMnppdVJnZ0NkUGVSLy84Q2V4UmtPY2NXR2UzL0dkWU41?=
 =?utf-8?B?ekZFR3BZSElaRVljbnhINXM5TTJaSXpSU09sT0NoN2VDR09ET3JnNXhVUmNG?=
 =?utf-8?B?cmhZV1pQc1A2TndxcjNrMldYVFozLzdsellKL29wNVJLQTV1eFJwRUdHZFdT?=
 =?utf-8?B?WS90QWhEVXN3WlVQNGdGQnZGZ1pwNWhsUkNIRTRKa2s1d0UwbFY1ZzBiTlov?=
 =?utf-8?B?a3RPZW5FdzYyOEpGeUEwSWVwaTlyelY5UnhrQ3Zjdm5XcXpkS0N4OXJhS1hn?=
 =?utf-8?B?Y2dPanJSdWVabUNlb1V4cHppb2VOWEtLdksvS2ZKZmd2MmdZY2YrWVhJWmJK?=
 =?utf-8?B?NkViSUhHVGNjaFpsSUhleXBuWTNIZEEwUVMwUEl2RlJoTGZ5NVJVcVduYk50?=
 =?utf-8?B?L1pMTmczWjFsc2ZnQVp6NGxHWUxhcXRGenkvdVZxTmRMQU51cU1sREN4N3ly?=
 =?utf-8?B?WDcxS1B0cndqVzVjT2o4bFQ0ZEduQ05iK3dLWkdIVXRJWG51N2RuNW95bThy?=
 =?utf-8?B?TmRObitudkhQa3ZZTmdVU0xrUSt3ZDM4WFVSWlhpZDg2eEhtd3ZiZmJPWDFw?=
 =?utf-8?B?Q0x1anBEWjV6T3FCVlAzbkd4U3RQVXpEQ0tERGt4dlFDYU9GZWtYN0hMd0FQ?=
 =?utf-8?B?eVNQRk4zMGZvcU5xazJYU2RZOHU1dkZHZm5pdVVjc3pGamZwV0RYNjY3YmxI?=
 =?utf-8?B?VFpOd09xN1dKbExSZUROTUxrQXJINVNPNC9HNWlQSkl0d01iZXRxL21Pd3pH?=
 =?utf-8?B?ZWtBMWRTR2YrbFNveGlXQ0krTDhaakkwZjExYnhHK2xqWmJ1U2hoWjFUSjBH?=
 =?utf-8?B?YkxtY0crNnB3SmU5R050R2pjYUxYbnptYWpFV1NkdVBhbnZXUXA4ajVza1lp?=
 =?utf-8?B?dmpBNTZXSVRjRW1xd0UvWTRuSnd0SDR0MjRyVGJpWXRKTVBKVkNtZ0dLUXNV?=
 =?utf-8?B?M2crRkF6ckdrREpXOHZYK1FVbk5iTFdacVFkNEJjL1ZsdE1lRlpQakpHV1ZQ?=
 =?utf-8?B?dEVtSHFnRzIySyt2ZjVESnpHL1g5dUx5aE9sdmM0SmVJZlVwdHBFajFhdW5E?=
 =?utf-8?B?M2swMEd4MlBCRFllOElidlNmL2Fmbk1qTndYU3hOU3Z3MU9zZ3hteTNienNT?=
 =?utf-8?B?Uk5BeEFwYVFLS3JnUGdzOGJDeFBFNDdwRS9iaXlSMW5SZHRsbzI0WjBKd1lL?=
 =?utf-8?B?UTR6UUJUciszeFVKUm5kSFhtM0Y2K3Jxa21DRGJuSElwenZJN0N5d3JCYlBl?=
 =?utf-8?B?aEpmTXltMWVJNzlsZ3hFcGh1cE1OVUVmWmN6dzdzd2lEWGNTakJRV3JMVkd2?=
 =?utf-8?B?Zkw5L3ZpOExucUJmTEpnMVJmVWRMSkJNeS9oQ3NQU3luUFZ1bFBwdFBqRGYy?=
 =?utf-8?B?OTFiQXJqcTNWUjFoQi9wWjZWaThad1ROWXA2TmROYXh3WjRDbmtSYWp1ZjNv?=
 =?utf-8?B?N0I1Z0FVTnBzSVBoWXBiMG0xRWhvWEF6K3ZiQWVIcWdyMmlkYU5BcHhVeU1h?=
 =?utf-8?B?QUMveTBnQnNwY2I5YmgzWXdjbUxobVN1Sisvdi9ZUWx4cE5aWGpadzZ5Rk1E?=
 =?utf-8?B?REJWakVrTmJYbjcrNnBzQStYeTA4SGRrMGkzZ3QyOFo3QnhPbDdpTWwwTlJO?=
 =?utf-8?B?ajIrVXg1K0R5L2xHb3NQY0doSkZJMTJtNnlaUDlEYTl2QzNXaVpOWU82RmlR?=
 =?utf-8?B?VERtdzBlZGhBWVppOFlaOHdWSU96Qk1oUkFib0Zkdm12TlNSMW1kQmgzN09q?=
 =?utf-8?B?ZE51Z3ZyaWJUck83T3NrN0ExOXFFaHU1RzFBOHU1S2xKN05XU0NSTVZtTkdD?=
 =?utf-8?B?UHFFNHpVeTVKb0I5ZmpXbWVTQ0x2RnBHMzN4aEVHSlY4YitVVktpS09Sb3Vy?=
 =?utf-8?B?RnFSUkhxSkVzdWZkZzAwUjJreE41eFhlOTlrRVVMck4xa3FpQUdsR2d3RUl1?=
 =?utf-8?B?ZzA1Smg2L2s1eE44eHFHQTU3ZHRFY3FXTnBVdnVXa05Da24ra0pzeFl4QnJQ?=
 =?utf-8?B?UXlDRUsxWWF5RlZFdnVOSTdBdW5kNlZoYmRaRnJSdWZ6TVdXMW81RkU1d2h2?=
 =?utf-8?B?UnYyUEZNQ1NLT1RuYWI4eUMvVFg5SWxCb2pXLzg0N2dHKzhXa0JwZW1yMW5t?=
 =?utf-8?Q?fPhE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766cff20-c109-49d8-afa9-08ddfc4bece8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:55:18.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQj7TLaN8bkvS141mYU+vB60QNZ7I/aLcodOUvjqNPffArrmqOEegZwwdJRQNLBy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133
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

On Thu, Sep 25, 2025 at 05:40:25PM +0200, Thomas Hellström wrote:
> > I think is also needs an API that is not based on scatterlist. Please
> > lets not push a private interconnect address through the scatterlist
> > dma_addr_t!
> 
> I think that needs to be defined per interconnect, choosing a data
> structure that suits best. Although I find it reasonable to mandate
> dma_addr_t or scatterlists to *not* be used.

Can you include some sketch of how that would look? And cc me please
on future versions :)

> > Assuming that you imagine we'd define some global well known
> > interconnect
> > 
> > 'struct blah pci_bar_interconnect {..}'
> > 
> > And if that is negotiated then the non-scatterlist communication
> > would
> > give the (struct pci_dev *, bar index, bar offset) list?
> 
> Yes something like that. Although I think perhaps the dev + bar index
> might be part of the negotiation, so that it is rejected if the
> importer feels that there is no implied PF + VF interconnect. Then the
> list would be reduced to only the offset.

I'm also happy if the list is just a list of bar offsets for a single
bar and the pci_dev/bar index is discovered by the importer before
getting the list.

That's probably a better API design anyhow since building the list
just to check the pci_dev is wasteful.

In this case a simple vmap of bar offset / len pairs would be nice and
easy place to start.

Jason
