Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35BA42BE5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 19:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC09D10E358;
	Mon, 24 Feb 2025 18:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HvVvUZR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC50310E4F5;
 Mon, 24 Feb 2025 18:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9CdxTBot1YMRjSnWTD3/pVXkY75q0g5si9mg+etPwT6xkpsKLowEIibC9ZVopqFvJ2rIYd+X9jcQrFrklQin0qbU5sDMPh5z8ZAM73r+tDG6QLVokSupnuX9MrT2Hl7USodLqGa6auU0rGeaVJilkJ1Ez0R9DiKmDzAhMO3hKh3kG/pKYCih9thPeNJT+PJTgsErdoQkdtesiCgSOAKNJy0eZJzoYrqNk3B45tiScT4S3vlVszTHFyPBPpuHaZnI6jyvcyiO9YYbOokDrr3K+tc+3chvEokwA3aJvWy6YtZwpqaBrV5aMSnbJT5j1ePT830rGA3Ir/9tUSQQs/zLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz2vM5a1q5wpgrv3BkN9/KXbZzbO618tVcbsx6xhKMg=;
 b=P96/TZX9n7OyjLrPxIu18guxXtTEE+3um+ACqeoMaiS8KG1iTpQGpZ44yIMl0rdLGK3Er/RnDwdfRHdTUUIVP1vfMJVgZmU5t3Qh8CT7eUSDAN8gUP7IWTak68PNSGXop5Qbbk7zWG1k5J0piDHck7gkp8pQpg6SPzRyOaXxc02j6Zj1j0Zh5TH1VdwfB7urGD071w1QOoS0eOj5Lx9KSYgioF7tVOUj7CPShskMzCM8V99st4/ijr56yRZxqIItYGk8cY+vgcqsD4WWGYRfsfsEYg++smwYG/Me04T+wCjy/iDBD54x+Z5zf/6jZnlw5dKba9esEJHuHlWHXM6rVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz2vM5a1q5wpgrv3BkN9/KXbZzbO618tVcbsx6xhKMg=;
 b=HvVvUZR34d/8s9UaEzbD6ADW+yGDbWvbQIe8G1LkeX1tyqno+RsrpiP2KPxY7ZndVEceL3vAnr6Zt/Zj+5lUBZ9cKe3DtVDkSnO9BAAxxDhoALYpw0b67LC4F9G9+++S/+B7Jet/dzDC2uqTxM1wjISeHYMMBB8w3S/aE9ED4dDV5WgfBBObwKCdSR9k/M+8ws/dgOidrMmhCOoJTnLv3cjxUUL3Frt7EjtQr1oyxWl72TsaKvnkc+scq/zEt58Dm6OJZ9gV9Udo7BzmeR6zMpqUwFu1L/d40Ju+e4AfaSQ+jLUzGYc3g71LqpgF6qloqljLWYpPBwhNQUOf/PHBmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 18:45:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:45:04 +0000
Date: Mon, 24 Feb 2025 13:45:02 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250224184502.GA1599486@joelnvbox>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7xh5bEyh_MII4WV@pollux>
X-ClientProxiedBy: IA1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:461::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf963ac-6257-48c9-79aa-08dd55035a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TU4oFtHDkZhaIhaZfPcS1txgM2nHgLWo1BsV0r2HNJqAuqAnSALTYP0k7KHn?=
 =?us-ascii?Q?wVkBcTPjOIS2XOxJKaBhaAEj0D5ak8mg2GC113iJ/JMfc2Z0i5XRKN8FrcLk?=
 =?us-ascii?Q?QuV3bT10w7JqcUVB8xAAwu4ojFvUmFFawIidj3jHBOQL8g2JIxzw88q0lFTW?=
 =?us-ascii?Q?WRMHrQBWvKQnPsa/wb/+vV+SFvEiFmsrV7xlG2pxmnd8gAe8UPXv7nk6TgNa?=
 =?us-ascii?Q?L3a3lNLrNKzMFdDP1l3M7co9TbebgS7cV4tzOHwPQwctyPZYvTvKo7w2wOoe?=
 =?us-ascii?Q?Q95iReShditHJ+LagA/XvbNKnM6UzyemeK0YHi2VlHFlF9cxa0Z9UfBfufJH?=
 =?us-ascii?Q?/3ueupNspyZ9k1v+0hbW3MEeVNcCukTzfESvJYrxdIvfrzdH4MWt+dH3r1zp?=
 =?us-ascii?Q?sJ+fAOpIrpBLkH4Cm51P7w2TSFcTkM2xi4jcB6DqJda6HRL7cqUv9NV2bfip?=
 =?us-ascii?Q?TF1L6vep8sDOkMckqCGUyiwo/VrFreaOtqpDffuUrP4efEkZMuBxshOxWcZ3?=
 =?us-ascii?Q?+xfCQRswPfCk+ocmCA0PKzUyh3wFy7UxEOEnhvmKwGlN40IHmJ1K1SC6BxrP?=
 =?us-ascii?Q?gs9g3bECK2e5Hcp3jjjLzGuuvYjj+zRdkGAVgJigwTNBrj1HbuwtYAav+zQp?=
 =?us-ascii?Q?PTCBhg+Cht16boR0GMi++gguQlmhiPirmzReGycbT8IJegXumru9pWPBw60r?=
 =?us-ascii?Q?6rs0Hhv8jKNZCFq7y/kFLvgX+gvVho1e5O9LuwqS/yGt+ID5RPVnqMJmJj6T?=
 =?us-ascii?Q?d6Dw/10LYVEitiSnGHwihll7m9Cc/JNO7bU/phhIprWO51UHhLBUHeGdF+87?=
 =?us-ascii?Q?UB9OVxBVVpJtVWbel9/B8qF/Mk/7njdO/Bznu6MPORVbcXtR0UZTtoS/xPNP?=
 =?us-ascii?Q?9vc9ZWqbIgzHSwQWwoCDuF7wAc8wLj/pwK+lEdRdkp8Y807miEQnccDjevmf?=
 =?us-ascii?Q?nca4e4xgroUxUk4oARbJtBSh0I4ilUXfAxKFGHMK/fq8yIECMRLJW0LeGamH?=
 =?us-ascii?Q?FQ1x2HO3tH2AI6jcGCDdQlNen/no8fG4X5CIuWcjv94bNKya+rTJmykVcO7r?=
 =?us-ascii?Q?6Y5aYw2uX28j990rcpqbULfBxfaxFa4GFQqip/SYQ9xZm9zHrwXi2ayacMCM?=
 =?us-ascii?Q?j+pnHwHRzYXc6hTKP/+Uo8cs3HRZiarRQNkzMvsXD6HYQgPyRMNyCHL/Jj6O?=
 =?us-ascii?Q?tGOuQcd7Zh/OxOzF3iVNZ1HkvY4Nut7m1v9j+uvb5FjM3XBky6dh9n5+BtXb?=
 =?us-ascii?Q?ekhiiH/dK6UPkpU5mEYIfn3recpezyAtTrq/8btSEqQvhMxCWuenYHoU/yxP?=
 =?us-ascii?Q?2/DVtCpfJHjcyyj0AFgNiSuB9OUc6vSW9yOuMOMFdkrRyxEANUBIS3D8i9TW?=
 =?us-ascii?Q?a9CcI+oOgbIR92mpIpyZNCRe1kvF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HkVYHXBwbc3n8Uuz4ByXV2iHYHH0ixovz2bmOY4xrOWZCMPYLFVUV0KyXtDb?=
 =?us-ascii?Q?TRXtZJckI0aL4KREF9d8mr/PU8mpVGK2Odk5EpUlwmeZvmoGdepjSs4QaU9l?=
 =?us-ascii?Q?1fOlTlgKwVX+unUZM6yx2Bb8ETOXItnvASQayxUohl5JjPj7YngAGjr4/q3q?=
 =?us-ascii?Q?UsyyIg3m2WCywo0+E/8jK8cqPF/Ux3HoxBrUHuhIYRwfugxLqj8ZaN9QGLvb?=
 =?us-ascii?Q?dJzuDhg42wpwYzZBL8CuiUoSRcJQfcGNGMNgJUxIMkX6+eBWh1ADl2FsCTyC?=
 =?us-ascii?Q?OxaabUeXDuBw9heFT/abxoit8aWo9a+lOvTH5A6BmIJqJ2ioPtgPVhhuujQ6?=
 =?us-ascii?Q?If5/9RVHqwKGPjJdiPlf2N2N8v2xW9klOKXSyiJClNEEwRwHxv7g1/lH85tB?=
 =?us-ascii?Q?B2c87lA5CWn5/T1SG5sEXDrpo83F3mqyGa8SzyMJ93bnRQ5uoS31GDg/6SAO?=
 =?us-ascii?Q?ZduZWMd1k+jwQTuhs7tdWX6aai7VoGbKzwtk1mCP+nlI6HsnX5MhfHCOY6fe?=
 =?us-ascii?Q?jEbbtZ9xRaPofixXlcs1TRM/yeqFIF6VYbmWvl75N6V8w/EMe2iHzK+itvNS?=
 =?us-ascii?Q?k+XitV2zRuvllzEaZdPIiu4GZL2ONTPy8IZxGgcueOe9PSWKDyRPx5bcx9Ja?=
 =?us-ascii?Q?PboW+0jxvZERUea0ng13MzBwmiJgPra3ucxbshsxwOK3+fcIx3SEoojuiX2r?=
 =?us-ascii?Q?yVDtXPa1yFLDvct1ZPGAVSG8hV1l4drT5JzE3FNk0XiOY7OSUmKnNCCmPQ1K?=
 =?us-ascii?Q?VT7GjTSSNXSvnG4JHsPsg2t/KwB/yIw52eB5Z15bCY0b+j9E+r1CL6G8/Mrt?=
 =?us-ascii?Q?TqT5QytDecEmiQ1ECPdBOt1Yv8KBXQDHz25aH1Ov4CFQHoIrDRipCLg/kaWf?=
 =?us-ascii?Q?M5X+scc5QZxcJEudB0sT7uqN8nt6DPm6tUMdL3tXtPlyTx6AYkqHlCXZGNMK?=
 =?us-ascii?Q?57In12fmryp3fJngcQ3mZBj/th/F5Bg+j32dAAisWzeqF1J1x1hE16aD22Oa?=
 =?us-ascii?Q?JCnRGrPN9HXzfRITj1L8vzlT/kZTKfrVpKzYcaMywKHdpuo6QlhoSMBgPT3y?=
 =?us-ascii?Q?2j4pJJ2dnMI9y1kPsFGIfXlbfjcbTSbgVWng6ssXzBh41/lcujG39hB1jaO7?=
 =?us-ascii?Q?AQRwnwAbjNu/YMLWy2xyjlbmzopJ29cRAZuge7riXCiV/FdXPBVmr01uB3er?=
 =?us-ascii?Q?LOzt1cLykT2b5Rj7bHaMK7sqeOuGS+QIwkBl7yEf0be2v7hDAI/2Kdy+0zwp?=
 =?us-ascii?Q?ZEMjxGUa8Iz4HnCKBBB4xVDAnYsudiLARPseaGZLe9OYGvnEMeYPT1oXDLU3?=
 =?us-ascii?Q?Yy7axCPUzYoBbbJ825XHXzXS67+7vIoOKv8fYovDl9c58dtwbIZ4JnIZj1dv?=
 =?us-ascii?Q?sckhv7WnwxK6T6WDZe86adEAcFZatkLsfd8sJ9WR+h2G3KPhsYVJrSD9AMC+?=
 =?us-ascii?Q?cAxoAp8WInltlnuDWTcQQ5nNKsxUzOhRIaVJyYiUi/fCoVXlWG+ueFnUTgrY?=
 =?us-ascii?Q?iE5NxsrO8WERQHUDHqFuDD9U0UbE1IUXw1dsQsMxHpCMGXziE7UWgT4+ZTtz?=
 =?us-ascii?Q?owAHMjH1NjO5QlxHi7fcKImqjnzfyMjmJa0dtnWk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf963ac-6257-48c9-79aa-08dd55035a4d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:45:04.6482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNJO6WNxDGAYueeU4dkcOY+AdJ7roO4lX1Fp7wIKbNmxmbNbhZqHWA1CY5JMAYbzdtT/xpicwqCAQOzRQBh9gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599
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

Hi Danilo,

On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
> On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
> > CC: Gary
> > 
> > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> > > This inability to sleep while we are accessing registers seems very
> > > constraining to me, if not dangerous. It is pretty common to have
> > > functions intermingle hardware accesses with other operations that might
> > > sleep, and this constraint means that in such cases the caller would
> > > need to perform guard lifetime management manually:
> > > 
> > >   let bar_guard = bar.try_access()?;
> > >   /* do something non-sleeping with bar_guard */
> > >   drop(bar_guard);
> > > 
> > >   /* do something that might sleep */
> > > 
> > >   let bar_guard = bar.try_access()?;
> > >   /* do something non-sleeping with bar_guard */
> > >   drop(bar_guard);
> > > 
> > >   ...
> > > 
> > > Failure to drop the guard potentially introduces a race condition, which
> > > will receive no compile-time warning and potentialy not even a runtime
> > > one unless lockdep is enabled. This problem does not exist with the
> > > equivalent C code AFAICT
> 
> Without klint [1] it is exactly the same as in C, where I have to remember to
> not call into something that might sleep from atomic context.
>

Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
not sleeping?

I am fairly new to rust, could you help elaborate more about why these MMIO
accesses need to have RevocableGuard in Rust? What problem are we trying to
solve that C has but Rust doesn't with the aid of a RCU read-side section? I
vaguely understand we are trying to "wait for an MMIO access" using
synchronize here, but it is just a guest.

+Paul as well.

thanks,

 - Joel

