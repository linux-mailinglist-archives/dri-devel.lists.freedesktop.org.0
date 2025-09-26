Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED3BA4862
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E083410EA92;
	Fri, 26 Sep 2025 16:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J9lZOVe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73910EA8F;
 Fri, 26 Sep 2025 16:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxD7NmnoLkbymLTwbfzXbHmbcNQGv+E2IDnJ3iIsppwhmSDPPhV5Sly63mexTIgquUpGla6mur6TAZT0+LebYP4GfKD/7tzwxd5sWP4SkUC+v4n1FWhh3xqgZkP1FV+s+vIQhb0Rcx1guPyr+e7EZRJYt55WkyGw2U9Nr8eBF7CDytXOw1lRtzb0yt6VQqIxmDZo09KrlnyfuSdvg7LNCiXC/0HQamt/ENOe690FUmIBmc8Z+rkoxCXIagJ1XVxNaqZB9kRqTp0HKPTSA2j4ApeJmx+Tk6FWoLHM9NIm2osyKcAkV9E7+qvL0+ZOScfo0Du8B5UT5huDdaUYtIkEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEvD/49Fi1spAkobhbZvRdRebudtacZUGsaP7WwZMz4=;
 b=taVWuCs7TPQ6Pgzyy5RVZpf1mgwXZWldIrUwuw/P55TM2QTsnJppHT5UlNlWy2yplnVCudA92oEp6ki9y1DR8eEBpKIKoJcCEIQxeV7Zr1rmLcu1c78UwMKQY3vUqJezVyQNkqgthxnxCuwc4vzRDtsH41vBoxwJv0J/A8WXN+sTaDQ6lsKdQA0ozUKjVe4OE6s3UOcPQHNIS2plbocWfFeZQHDmvAlUUM1SnPzZ5nPEg5z+hY+v965rlMbqzjoAXRZ159P1SLHg3krMPmpkX6Ywr35GDXQAY1OyHOpYMS5Jpf+di5GQyAqCiwBkneAt+jaZBRxvd4jo21yzRkku8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEvD/49Fi1spAkobhbZvRdRebudtacZUGsaP7WwZMz4=;
 b=J9lZOVe2kuMvBw41SS3Wbt7Iv8AZRMX/SacTVwP1r3PXxqsGfudQlMnSDifuRVRCzlgnDiMKwzYcs+wFYqjCS0jNxrKWkex5tfuN2WnY3eIOp3Orm0zb16pzRgZpPmWgsgYq2YBKiormJCdgnYQnbwu4XcQJvYrheq+8ImiC0WkIkCt3WiLwwxBv8sPYJAr8HD4zKXwPqID0Mrp7n3JqZVsobVULFkecUNT/4K+l1NUzsgayIRZwtYjKDbSCX12Sq5Cp2XOl+pn+8QnYmVSgZqBTNyL+dmbkOYIaZzvt5MlVe3EDUSwC0QodpOnCY5soIUZNVVqyoVecXKo7/ceY1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 16:00:38 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 16:00:38 +0000
Date: Fri, 26 Sep 2025 13:00:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
Message-ID: <20250926160036.GE2617119@nvidia.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
 <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
X-ClientProxiedBy: YT3PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::33) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 1928f32b-6457-4bba-32bb-08ddfd15d5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHZzTktVanRPeS92R1dxRTBjRWoraFBBYjIxUHBydXlFNnhpNitOS0pyU2xk?=
 =?utf-8?B?WVFhSkpGN1g0T3lSZ2ZwU2pTQkpSSGRObmMwOURKSENqaVJvdGR2RnJiUjdC?=
 =?utf-8?B?UnlXd0FKRFNwY1locGZzN0hiZVRPdU1BazFzbE1UeFowdVpXKzk5d3BFNWJS?=
 =?utf-8?B?YkpaN014c0F1MmlOWGZQeXB3MkNVVC9idUhBWXUxenh6MEhYVkhlR1VnQnB0?=
 =?utf-8?B?YXQvOU5rODNYdndrUGFmN3N4QnA0cm1ZMlNaZkdkZkVWVlRkbnc4bzd6bnhs?=
 =?utf-8?B?VUd0MVE5cXpHL1IrQWtiZ1E2Y0I1UmpBMUxackY5ODVxZ1VZKzQ2SGNCTmo4?=
 =?utf-8?B?bGJLRFg4Z2hZb29kTUZZWVNTSmxJV1lBWlJPYjZtSmtNSE9oMVo0empBM3NW?=
 =?utf-8?B?QVN1OXVWcVZiK1pGTlNmeEs4QS9BM1dZUnl0K2FYamt3K2gyeU04bzAyZG9B?=
 =?utf-8?B?VUUzOEFuTTZXUWhuT2twMjd3bkdTUjJMOGl5UkFpNVJwSjE1cWN2dFBZWDNl?=
 =?utf-8?B?NUVUTXZJUVBBMm1HcnYvUjhXNCtRWENVbzZQUWlQV3U3RDhNcFNUTS9ZbkdC?=
 =?utf-8?B?cHFGU0sxTjFjNU1vM2c0QXRxK0svc1FCMUwralpNTWtkZnVxL0hSNjlXc0xr?=
 =?utf-8?B?cUIrak1EVzNZNnFzS1phZDhOcFM1QUhib2drUmd0OGN6RFk0Qy82WnRxSjBm?=
 =?utf-8?B?eTFacVJtKzk1VTIwL05mcGd3K0VoTzJSYTgvQ0NPdWgyUXdCOXI0RktRMDR5?=
 =?utf-8?B?dEFsWk5hTUVaclMwQmc5RjNXaHJoR0FYa05iUER6b1NlbHJsTlZjWlFnNGMw?=
 =?utf-8?B?WDEvODVZTzhQbTlXNmJ1bG5GaWsxb1QvOUdieTIrTzh6dG5JZTdsdVFGd3dP?=
 =?utf-8?B?MkMwd3U0YVlHeXpMdHRObGJQQksxK1lzR2t4dTE0bHFSWC9Yc0laKzNkRy9C?=
 =?utf-8?B?cTBickNaMEhkUDFsSnRyVXprRzJvQVZhVnNwQ3VOSHpraG55U2RIOEdwalVp?=
 =?utf-8?B?Z3VGNXkyQUQrZTZ3Y21pakNRejY3UTVXVWVGYnZWNENIbE5iRlR5MFJuQkxu?=
 =?utf-8?B?YW82WFRZNThpVlVUTDdlTWdyeHd6YWRnUjhZb3J3SWNUNHluVnh2UFBtLzF0?=
 =?utf-8?B?TDQrckhjT1JqaCt2V0tidEpEdDJNNjJTRk9va1NOellnaWxRS29BOVVya1hn?=
 =?utf-8?B?dDN2bzNBSXFqbDdobE5XSU15Q2NPRXdudDNxUkUzT0VnRTc0WDNtVWFHbGRN?=
 =?utf-8?B?U21FQ0RxOVFvOXAwbTI5Ry9zeTVVeEllZWhaMnJvVzE1R0xlV25WR2ducU1t?=
 =?utf-8?B?MFNMVXlVVGxESUZiVElDVjVuRTFJbTl1TDM5bThpY1orNmtjdEFVaWRNc2Ra?=
 =?utf-8?B?Tk1uN09RaFhIZU96U1A4dC8rZXBZUE9SZ0wxYm94eWNtOFhEaXlrWXR6N0dm?=
 =?utf-8?B?QUNhb1NmUlZ3cXdJeUM0dVpUZ0JTaVhFSVYzL05DdGVwdWlXaDdVMlV5Si9J?=
 =?utf-8?B?Q1dGdmpwbmZqT3c4YmFxWFJsejdnWmQ2MHFBRmFEU0I0b281aHlqdWlrRDE1?=
 =?utf-8?B?ai9vc09JQnl2Z2pzaFRrckczM24zZVMwSEp4a2FXTVh5SWRxcW90MEJGZStq?=
 =?utf-8?B?RnQyYklmclZ1OWEyT2NHWVpIS1MxNjZxdXRoTmRFcTBEK0JFZFJJaVgxV1RR?=
 =?utf-8?B?TUJwd3F0RFVoODR5eFlVakI5ZGcvdlhwZEJjajB1YTlBT1lpRFN5eGovVkZx?=
 =?utf-8?B?ZzRGVGVOVGtXTm43aDJONmVhSnd0WU1FVEZGVklRRzkxWGVaaFdOdzhRbWxH?=
 =?utf-8?B?eW05OEtzemgyLzJXZU9hTHVnVXZlYU9pbTdOK2Y1SXM4TXFLY3doVjFpYUwz?=
 =?utf-8?B?N3BJNW1KVmNDQ2huMk9ZdXdiUVJuSlZmWnM2Rm1rZThwMnZQODF2cFloMThJ?=
 =?utf-8?Q?DGeXL0+fBik171RMcyGryP+RUBGs2YH0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25OcjFFZlk0L3hiUWZmcStPY0UrNDd3RytFdU9mdWNscjlUNCtsNDYwazhC?=
 =?utf-8?B?QjRhUWxPVHdwRCsyd09Uelk4YjBYSmhwbWo1MVZqS0ovVFk1ZWtid2Rsbmtw?=
 =?utf-8?B?aEZWZnlKTjg3MXUyUFRiQWQwYjlRK2tHUzRTNzY2Uk5FY3cvaHczT2RYWFFJ?=
 =?utf-8?B?VENpb3dwbDIvd05LTTZkZXlKRnQ0U05qMlVGNDlEekRWZWZXcFVUQmI0YkMw?=
 =?utf-8?B?dGIzNWxSeHJoeGc5VnBCVksxUnR4VjZXNmlSRzFpZXVJMnlSajNYNUdDdlJi?=
 =?utf-8?B?OHZ2VUxuY2k5ZDJBSWxCNDdHZnh1Qjl0Q0VmektnbWNFbXdlUEk2R1BSeHFQ?=
 =?utf-8?B?d2hDeFp0WHU1SEFtYlpuUlc1d3NZbnBPbHlCRXd5VDBIMVBUMWp0VlBKWWc5?=
 =?utf-8?B?dFkvbkVpU3gxVlNMMVNEeGJ3SitDZmpZMUVYTDRQc0pKQkxoVXpTeGtzNjZO?=
 =?utf-8?B?KzNDS2gyQUY3bTRZWUY4YVVOVUFpb3FxWU1kV21WcEJ4WGdMVnRaNGFhYy9j?=
 =?utf-8?B?USsrOWxGYXBZemVCb0p3SHpsZ0x0RHM0UEhDZ2IxRHBlQWtDU3lmdmVMRGNU?=
 =?utf-8?B?RW1wNDQ4S0diMHlpektMODYxeDFoVU0xakkwcXpwM0hjWm1lZzFPRGkyY3R4?=
 =?utf-8?B?TE1WVXFZWDJkbFRmaVE5bFNnS2p2c1Z6dXNNeW5Mb0hXb1drZDVkbHl0MGZ2?=
 =?utf-8?B?V1V2WTJMUXRjZ3R2Y3UxdjNLei9QWGlnc2p2T0J4a2hMbzZTdjMzaitTaTg4?=
 =?utf-8?B?NldCeDZEYzBLbGdpYVVrRE9KOUpPdFpJUmZremtGRzhQZEZFaXYxYVhRYTh1?=
 =?utf-8?B?K2dlRWZoallJWUVSdzFHRGl1eUtnWUh5TzBjRGhVRVFtUzZReWRveGQyTGpV?=
 =?utf-8?B?N0xZOXpGZUlrTW5RcEUwUXo2akYxUjJVNWQyMEhkMnl5d0swWUQyOFpOVUZI?=
 =?utf-8?B?SDRiejNzVHc1OGhUTmZmMmlzbmYvam5IaEpTQ0h1cU5oYllDUmNuZFd0aEZP?=
 =?utf-8?B?ZU15Nytkb1dPUzJCWURDRUVYNEhJY2NVSnUvcTVnZ3ZFdnZrODBpdDdQRzkx?=
 =?utf-8?B?T0hZNnJ1SUNUQThLQXdGL3lFWGdoNjg4Q0pQck1kUUJtTGU0Zm83N29jNUdB?=
 =?utf-8?B?dEFLVWVqaDNIZng4cXJVZ1M0N3dYR0p4b3BWUWNwdHFnZFZDcUlLdktGRDZX?=
 =?utf-8?B?eCtqemZ2ZnFML3Q3aGVmbnNsTkVWUEgrVklSRHRPTHpmWGxHUW4vRUZPY2JH?=
 =?utf-8?B?V3FobkVlbnlnd3JPNEVtSHZZT29WSnl5dGNqcjk4SVh5SjRnVHdFTkprY0dK?=
 =?utf-8?B?MGM3S2RSeUJJUmtlaGV0THNGTk9CWjhLdFlqbVRKbVRqemY5Um10ZDczWkFv?=
 =?utf-8?B?V1RCdTFJcmxrWlJGQ2o3K3VzSWpjVU9DNnRzSlJURUNHTEJLY2pvZG9EVWJE?=
 =?utf-8?B?Zy9FRlF2ckZlSDdYd0FGNUdBNVFaTlBhMU9ZMVJQWnZ6a3g3RENXaUdqMDA2?=
 =?utf-8?B?TnphVzhwck1ReldLdm1XeGNKWm1CWEtqUm5NQndKTWJCK3FnNWhJdVc0WFRr?=
 =?utf-8?B?M3BzNjFsZEIxQXJ6b2czVHhWRWtwbG1UU0dyczZrbTNqTGQrdkVyVVlMYisz?=
 =?utf-8?B?YjhhUDc2QkZ3VkM5QzU0R0h6eXMvTTVsdEtlSXU4NkFBZ2RjSkpsT0VHdkd6?=
 =?utf-8?B?Mk4wYTBhWXlaTDJZVkM1TlIzc2VZMmU3NFJmMloreFJHN0NOOEdNWTkwcWk1?=
 =?utf-8?B?Uld6TzBTa1JIRWp5bENpOXlrL2w4ZjljWkVMb0ZTbk1PV21LTk9TV0ljS1Zu?=
 =?utf-8?B?VTRVTDJzb1BNWEtKZGNRSVY0VVZkUEY1SXphK1FReGEyblBqTDVrZ0t6YUhS?=
 =?utf-8?B?UlhGYVZmN2xTMGlFVk5pN2IvVXFTUS8vZkJDbHFETEI5LzhTRUMxbGx1OVkr?=
 =?utf-8?B?RmN5aGlLZGxwZTVmekw5MGxod3Y2eTJMbGFtSlYzeGtTTlpvNUJqSFlvbzF0?=
 =?utf-8?B?a1kvYUZzUFVhaXVkS0hkSElsWEZuWGZWSGYvS05oSDAzbmFkdk9KMDV6bXdt?=
 =?utf-8?B?bUdCZW1OVmxBc09TSnV2eS9wcFpXeEcxNXc0WEJaYTA1SURDZ1d3ajVPT1dH?=
 =?utf-8?Q?d/Is=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1928f32b-6457-4bba-32bb-08ddfd15d5d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:00:38.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL71b31vBVeUK3lx1OxtfFcezFWskCbQ48btzQMDVkObB0krjbUfivTQSN3ipeQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
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

On Fri, Sep 26, 2025 at 04:51:29PM +0200, Christian König wrote:
> On 26.09.25 16:41, Jason Gunthorpe wrote:
> > On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellström wrote:
> > 
> >> Well both exporter and exporter has specific information WRT this. The
> >> ultimate decision is done in the exporter attach() callback, just like
> >> pcie_p2p. And the exporter acknowledges that by setting the
> >> dma_buf_attachment::interconnect_attach field. In analogy with the
> >> dma_buf_attachment::peer2peer member.
> > 
> > Having a single option seems too limited to me..
> 
> Yeah, agree.
> 
> > I think it would be nice if the importer could supply a list of
> > 'interconnects' it can accept, eg:
> > 
> >  - VRAM offset within this specific VRAM memory
> >  - dma_addr_t for this struct device
> >  - "IOVA" for this initiator on a private interconnect
> >  - PCI bar slice
> >  - phys_addr_t (used between vfio, kvm, iommufd)
> 
> I would rather say that the exporter should provide the list of what
> interconnects the buffer might be accessible through.

Either direction works, I sketched it like this because I thought
there were more importers than exporters, and in the flow it is easy
for the importer to provide a list on the stack

I didn't sketch further, but I think the exporter and importer should
both be providing a compatible list and then in almost all cases the
core code should do the matching.

If the importer works as I showed, then the exporter version would be
in an op:

int exporter_negotiate_op(struct dma_buf *dmabuf,
   struct dma_buf_interconnect_negotiation *importer_support, size_t importer_len)
{
     struct dma_buf_interconnect_negotiation exporter_support[2] = {
         [0] = {.interconnect = myself->xe_vram},
         [1] = {.interconnect = &dmabuf_generic_dma_addr_t, .interconnect_args = exporter_dev},
     };
     return dma_buf_helper_negotiate(dmabuf, exporter_support,
             ARRAY_SIZE(exporter_support), importer_support, importer_len);
}

Which the dma_buf_negotiate() calls.

The core code does the matching generically, probably there is a
struct dma_buf_interconnect match() op it uses to help this process.

I don't think importer or exporter should be open coding any matching.

For example, we have some systems with multipath PCI. This could
actually support those properly. The RDMA NIC has two struct devices
it operates with different paths, so it would write out two
&dmabuf_generic_dma_addr_t's - one for each.

The GPU would do the same. The core code can have generic code to
evaluate if P2P is possible and estimate some QOR between the options.

Jason
