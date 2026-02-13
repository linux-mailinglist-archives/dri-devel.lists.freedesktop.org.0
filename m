Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EhYLx1fj2m9QgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:27:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F65138A33
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE1810E23E;
	Fri, 13 Feb 2026 17:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MmRvBvKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010007.outbound.protection.outlook.com
 [52.101.193.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5620810E23E;
 Fri, 13 Feb 2026 17:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFpjHhbgpFabQuH/Llt2iraP/utu4k19//03aLGuWWpu147+ok090DsKbev+48Nt2on9QFEskqJGMqMvkMlKYPuJ/4N6EpGObRYPGcI2CK2E8u5HlUViYsljpZdejmJ7SnDZjzP/XaMhbdzF3ly+KvcQ6ty4tAQ1Y0dFSq+xVxClZ3EZh0seNP3lHyYQGCUNfAXWnPjyHarslDtpMlH3jaJl0NbQHGcPvIv1xlMvN+YwyvRhBUh3FG+3IUAq5Am3LiXaWyTBctCZlVJm1X0vXuO5dttBOsahIX/SHplmqXPw/2oo8Q/uiljlu/T8Jw44unNHvTkPSzWeZhJ/ch4/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nAjHvQ3sMuURgUglLyjMM89quJ2NBvOF8Y5hhkw7NQ=;
 b=EyUMae5CxZReUSiRXb2CuoecyJciJSD/FaVZIca0C7UnqgWLO2D+fKYVbElYX6iuPM+gHFJR8QqPvWo7r2TPqqouz9nl0D8NfnntZVh8uG3xspnU6Pr7mrkTtRnWkw92N+5vrdRTJgi7OQneJ7/ipTee2GjJy+VsARPs2d5AAjFSIB8EeDndofRa6Tb5I5i28NqYx2kYhhlzxriJq4+mIet+Spy+PIg3pCAPjYlDYC3cibDc40IjWOt/GmqsDKrpsPvMWxkZVi1txwUzL9aDCT+4tHdFvWnDMehN/eHPBwpBhugtAhmj7SPf4Nbmyo0ZVeR4lWVVfTek33zKAdNGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nAjHvQ3sMuURgUglLyjMM89quJ2NBvOF8Y5hhkw7NQ=;
 b=MmRvBvKTDIqggBJaXvB11OBPItU9Dje6WAVb6Pj7qFyg0EewMu7l/J/w/xftd9G587iqXnZniaX+X96N9XCLpCr7oHgXYCkTOFDa4M3Gg+mSYcDX2nMCb8RFoU7uC+pMANQArzybUVzkIeARFE4LLyT9jxf9RuvxwX4cO+drSUiLZ49K3oGVUaglHstDi1gqZavK4XgDY3akOO2F+5YQkzm8kmt6tMPH91/t73YkQ/22FwYN895xD16eTmUMdQXCK0anilPEgJCBCSJPzXfX/HpUykocnsTxX4i4AEQLCSDtWfvJ+gRgFqznOclVLE6dN4bdix4JuiHPwG7I8Cge6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Fri, 13 Feb 2026 17:27:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:27:44 +0000
Date: Fri, 13 Feb 2026 12:27:41 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH] gpu: Fix uninitialized buddy for built-in drivers
Message-ID: <77fc0550-cbb4-4796-85ea-c552e12125c1@nvidia.com>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
X-ClientProxiedBy: BL1PR13CA0298.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d8d89c-571b-4c98-1ad4-08de6b2532a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0l66DXV8LNH7jjsqW7UhCV4gqEGLI4jFOUSp3t5tlkLgRXMFrKb0sf9M2k3l?=
 =?us-ascii?Q?h/N6p2shIvpC7NxBUKrmAVwpbFAxtrQ3oBLItpJQGfl3mlIUsH6tSsBH0i2t?=
 =?us-ascii?Q?8jUz7qNDJRnnzl5qPwHpaTZuh6P9ciDBs+p9IskvycJVheYV6/Ikk/UyXuBH?=
 =?us-ascii?Q?vGJ+VRbpUaTcdmJ3U9XGXWlVVlDCtQqFnuuJBEyvG7b94NG7mtMSbO3FZVmR?=
 =?us-ascii?Q?NVFDBek/InCy5ZMmYMgg/9NpXfhwewNeWCPbZJmZYA73tu32TwGuBhymxVOE?=
 =?us-ascii?Q?pXeOZH3zAEZS4OJqmiv5i9rcasy6x5K1cYRzTfoOMYApMoTBeHPcRNRQ3IAa?=
 =?us-ascii?Q?2C1HypFI0uGSUPzXaf/omMVsNBs7bzX8JxRtf9UQT3IrYNgSWMbbzbMzwZ+v?=
 =?us-ascii?Q?R794uc+jNeKw874Nm+ZxVPt3QxsQeXDgCf0TMvSA/14ipSnVumbUcBP6IrL6?=
 =?us-ascii?Q?KcU6UFyLMSklhD45qlmAhU1FD3wo+q0KMiMR6lLhMml7KqQkMmDsCa5pRehD?=
 =?us-ascii?Q?MVjaCL2DLkwZwygHFH/pZbDKurkvoDjj/cXgaJOeaSj7PTY52N1aP1b3uVDW?=
 =?us-ascii?Q?xx24Ob3fh3+jUelfhHO2kN+i4ynPkm55NIWOskpVGvSzZhoyMigUqrPo/V8X?=
 =?us-ascii?Q?r+JxW49AoLSuOULo+UUQktnN8AJhleWRwEcos0HkZ3kafAY/+eVmAGIWnd+l?=
 =?us-ascii?Q?Iw7sigD9E9vn5b9ba+kf7pB4J5aCFSgb7pplnJpzwJeIdOGd1UXFh/alh1KX?=
 =?us-ascii?Q?s3FWaC7e2RoNt4PRQ4Ofi/yf1a+uSIJhgHcIc+flS+tyBWQC7LRzfGHBV4Ko?=
 =?us-ascii?Q?f7LmdoOafJIeEffpa/VstChoJu5rcr2bcw/rtY7HxvhTl29q/aEktf4zxc/w?=
 =?us-ascii?Q?jp5BspyfWLZtt9IF7Q2R5M07fKMMNtF5U6TxJGyhxZCb+YBCvGLVc8qJ/LkW?=
 =?us-ascii?Q?D+eraHztJyI7fWE4a+4ZqXo2TvOmajyY3g4UbvF+fgHO7exSga0bkzijDBdX?=
 =?us-ascii?Q?x/PnMNjzwZ/jAaIeoeKFXk4s7D6+zWRAzuML65xUNA7SVld3hYu6ktzsajA7?=
 =?us-ascii?Q?fRo690SsbAQOW1/YU+JEodhkuUrhFI1r0+LnuY8PzQNbXqDqNAEwTLKOkFAj?=
 =?us-ascii?Q?3Fz/M+yn4PKqMjyNUY85I3e9Qa1+3JkTBb89YTUGQwrLTH+a+ZRieQUQ8OXd?=
 =?us-ascii?Q?JqmJ078J9zDIRJ1vs6rjw3Wz+qIkrUDbcjjhtaCSB9b/1ns7tfRVIxUn/FPw?=
 =?us-ascii?Q?DJoHkBmrYoYzzfXPeHIbR/Oa/HGzFuMSAb4b5hAv1BC6JW/5wcLhn89oWHMS?=
 =?us-ascii?Q?M8ILrl48tcxYE3RZtydBgdjidW0FlSXoCDQboNwWbXxSsuEhR0HXFtFd97f2?=
 =?us-ascii?Q?2v6eQX70Ak97qMXMKF4Nt7LRMZ4EdFqpqgRLX0OFUTSbBJJvw6reFLUjt0nv?=
 =?us-ascii?Q?lR1NixgGljaHmhl2xZkWYNYBt9V97xv6tFI4PwyESkxbmocJLc1Rr5NIfQIY?=
 =?us-ascii?Q?gocfwH25jSkyx6rJjq5yCw1Tr1/nxAhpwYnwP+Q2WdRj5PcrZ+NyIoSoQxbY?=
 =?us-ascii?Q?fBrJ8/3ykRD9s2XNzCk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BsQJD9kfJYbiskkSTRf1rtl1VvvORXInY0MBOJlWe0Ror+8kLzbGeTwCrGZW?=
 =?us-ascii?Q?L+I4JWV+usxtKu5Z4djztx+caOPv4zNj388twmauVa7whx3i3fIAl9QaoDv/?=
 =?us-ascii?Q?3RgkHfDZs7LWOFP7Ln8vUexUom/+mtzl0zAdD94ykfQpRSR5oJzzINMBXhfT?=
 =?us-ascii?Q?haVhYk7zNItW2s+IRi12c7d5rt2GNKhGd0UWCUtdsFA8hZCTIbKpNNOV193h?=
 =?us-ascii?Q?vem4OdjoixIAee1gtjLVFA3fkZwKOp93r2NLS4qyteMXrKNn1uC63kguOsxd?=
 =?us-ascii?Q?8bdjNnBWhFpQuxM0IElgsuvzTVUToSPs/1Eiw7qYLa2odY6o7Ebom4ImZSBt?=
 =?us-ascii?Q?AB8xNGLICw6c9iDxwB1IZwwpu5i+PpYCfdlIxln/GH8aXxpLyuuwP7JYKzxd?=
 =?us-ascii?Q?vjhLqvszeWCHQIbcwTsDEmprFHGqUVKAogWRd1YysahfnZ8rvU7TEyAXDnpM?=
 =?us-ascii?Q?kuvgACpJDHgOSxwWsVEYX64D/+UISVghNR/EViY83Zu80P/DG1BCqOVb6mur?=
 =?us-ascii?Q?K/uWXraB9N0KJsNdjjjfqTZneFL0yMIhB0C2Eu1hLwOMEAxAPaxTuGolaRW/?=
 =?us-ascii?Q?j3P024BQSSOG25NZdqz2XPMhkHBUuyCo5kybXBd82iKAQUtbsMEpCDW5prRi?=
 =?us-ascii?Q?cKR4OAUC5pQgf1ghHZxUhvHpW6KoLS25B9UH1/gm6muBWwSQWjgv6eU++v5v?=
 =?us-ascii?Q?oTUsgSeZuXFqzvvMkNTaE0ALvD5seSI6qQs9QVn2L3co81QIxwT2r70vAU03?=
 =?us-ascii?Q?6Z4cP5PMNOtK/fAnGaSPQHcvpGJ6irgrA0Dgk62rTaGW3hOLJyuRVEZEgB9N?=
 =?us-ascii?Q?rnlQlEtrfpZb4l+ic87gF0abHTJsUML4/6wDb/Qua4aRcnD3DxTpqAw1tHkk?=
 =?us-ascii?Q?YC8SkljKfdVXV40LCvjMscPHY95+p+eVqnMNhf6MZIUJPGruhxRwscJu7flW?=
 =?us-ascii?Q?Sp8fX01BTxujLA+chidPFmKVfKQDdGDZMlw9DFdZNz162ajfgiX437uLwvDA?=
 =?us-ascii?Q?cc0aF4QEEeoKiU5cFP3ndFrenqfJKUYOUlZvrT7JfR195Taw1XhiOuyYSRcJ?=
 =?us-ascii?Q?uv8NQUilEdi+wxYw8ZzxMrq6qYf43uiDewWFvB1nu0H7vjSbI23BQkk277wZ?=
 =?us-ascii?Q?d7cfwaDiV8a574Xh5mjyWVZ6aGxcgtaRiBIap3Ep5o72/4IzyL0hcy9N/GiY?=
 =?us-ascii?Q?qLVRr6F+hoBzv5KPty3q0AI7L15v1vUgokwdfnmSSGoIPNyXAiEc3ZQl4teY?=
 =?us-ascii?Q?2XbRa6VZXHIbbqaUsCM3A4Fwy4pLjDnsUBDZCeB1dKi4wxZHWdBwJ3kqrK0c?=
 =?us-ascii?Q?yfylLCaTtHPwXm5Nxt75uCB8uPDv6cYXBqfC9mzhZKf1NOgKRsNqXqXv3RgS?=
 =?us-ascii?Q?1RXK64ZgfiTMQq016NmiCmFMcalwtu+ACrWXIkhmxkLbhot1os7xWEUb+6Ns?=
 =?us-ascii?Q?2SlDlC4NBeBdmDpQuCVMZQoHHJfoF2wXekPq8m8HPEZg32VxMt5K34gcFyGO?=
 =?us-ascii?Q?+iVf3hQC2CB5DSpu0IbG0BrvU0InFxS2xflQFWnrgi5/mZz8LRrX/yZAZ3Un?=
 =?us-ascii?Q?qqOWP7Nfv6Ihx5l9Rq5S7IiHEBrAGddq1qXRnji8poQOMKDe2ztloxWeKDFD?=
 =?us-ascii?Q?r5B9lvBR67u9h5ulQG8EOwDcrgHKsbcQ41Qhrm1mQjiU8O+5n3SCWLmx2M9T?=
 =?us-ascii?Q?OFA3CDHg75/2zIzH0F3JhxU6x7LwcimlQ/U/e0K657ypzJTkAblQc3TyUzSz?=
 =?us-ascii?Q?ClCT0e91Jw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d8d89c-571b-4c98-1ad4-08de6b2532a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:27:44.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F445eNGrTbAjLKbEL+pxv0ZnqhynWIyhZOfHETy2R+p1GieIX0md0u6eBe0q4M7opiHpbXAKTDdzFP02uueuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: E5F65138A33
X-Rspamd-Action: no action

On 2/13/2026 10:20 AM, Koen Koning wrote:
> Move buddy to the start of the link order, so its __init runs before any
> other built-in drivers that may depend on it. Otherwise, a built-in
> driver that tries to use the buddy allocator will run into a kernel NULL
> pointer dereference because slab_blocks is uninitialized.
> 
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
> 
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> ---
>  drivers/gpu/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 5cd54d06e262..b4e5e338efa2 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -2,8 +2,9 @@
>  # drm/tegra depends on host1x, so if both drivers are built-in care must be
>  # taken to initialize them in the correct order. Link order is the only way
>  # to ensure this currently.
> +# Similarly, buddy must come first since it is used by other drivers.
> +obj-$(CONFIG_GPU_BUDDY)	+= buddy.o

Rather than relying on fragile link ordering, would it be better to use an
earlier initcall level for the buddy allocator?

Thanks,

-- 
Joel Fernandes
