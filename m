Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E8A481DB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 15:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211B10EAFB;
	Thu, 27 Feb 2025 14:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hwsq2dzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7F110EB0E;
 Thu, 27 Feb 2025 14:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCY31bOsZm/F/LZ3dThdG4psCCGGcNKInLxii+vFrXDHKS6S+C7HLF8kuqsagVAOINB24f3Mto6IsbPwRJEHR9c+HVUgVsAJLXW0F94QpoT/iRexnce8WxT9nMjcQUmZ/M1uoPi8tu14Jzmt4GqKDEclDjlirLa3o0QL+0r2QfRTYtjxTKj6s/NK2uuKuJRGlyi26LzwxM8YKSQ9e2wBXbE65SNNU+jlEmCiWvnmck7GjiRPAjDuZW9YZVd4eDLA6afPbHsb4yGNsOFSs8na2Eu0qJV8PZXASJncGZKIPASuXfu6+Gsh9yUouW25l9k/yQuYC/CTsPviws3zaFgCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDbFB+WMiEAipLGt3S+rCLyf9Hl8l7CM9tquJRH/gmg=;
 b=taUxAw6+eyFvS1LDAWky+YU7LnoVuZ4hxxtVJcx13upwQ3eNU7em1L0K0n4WW//yEWSyAiObimdzlz5bqTxfkJ6+1XoTq14C2vqkHYo3sZ/LkfnHqhXI2vXEZqfgT+89sJdCMSImoCoqo61V6xRNt9X0nKNEviSlAm2jBN6qvjM0PgsnxsIk292kPH4ZqTHr8EzsCI/n+h/ed8RADv+0gnMN5QCmiVSi7Gs/YkBDAyIQxV7gi1dVdsV0RdZucCT/gAL1kZ3Uf9dhl9oS6qmRjEmADpCE16VdT/LPIV4HTf3LLul3/Pv1m/0eiZ45vZf9N/NPYXaLeU7Q4Mt1yLHWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDbFB+WMiEAipLGt3S+rCLyf9Hl8l7CM9tquJRH/gmg=;
 b=hwsq2dzjyfrBwcI2F9Ql2Ir7vswVtgI7kqcD2TS4vPwqj/LmnZleWvJKphDmJ+dhKUy08twZj5ug+zVbrBJ5T6ORyp1yno6ksBIlOCJA7poZFbaX6shk55vU5kQrgodvHIblsAurOSGGjAj3miJT+vX5o6EPbpQvJWOvXu/YufNr38YPBNK1sZYmMlmTlWWtrx00pPQyHlHl694e9FIQ9X3ECtAadSiX3hAi5jCcFAtvH14K30zjl32wasZpasIFgClUQIjxnAhYnlnLZ0H0iJVjNfZUmqpjXYay146VvcHiYQqhu9zPKYOotP068e0ZjuGdinizw0vdtUj8YaNpOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by SA5PPF9BB0D8619.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Thu, 27 Feb
 2025 14:46:20 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 14:46:20 +0000
Date: Thu, 27 Feb 2025 10:46:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250227144618.GE39591@nvidia.com>
References: <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7-0pOmWO6r_KeQI@boqun-archlinux>
X-ClientProxiedBy: BN9PR03CA0662.namprd03.prod.outlook.com
 (2603:10b6:408:10e::7) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: f382f39a-6ec8-44a2-aa22-08dd573d7f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?52SwforIz2ccPqEyxuHGdDMsFk941LfXkrA8tFOWWtPdNWQ5yAZAYVcQvY9h?=
 =?us-ascii?Q?cAPcaZXZlvRCweEe81Rroe9z82SCNV/sZKz4ZcqRtztMzTbVc3YoYF86byq5?=
 =?us-ascii?Q?as9sZzCZiuh7ndcRjof5y9F9TKcTAAkQ6aXX8ikU0aqmM9yQ/ZkiBaZnKf8X?=
 =?us-ascii?Q?XS3jd4OHim2/s9NTOg6NfjJFyAWDQofnb3WVpVHXX/z6yYsJniGi6Wf8iw3y?=
 =?us-ascii?Q?VV3RN34dWnl0apk+j9vsrwyXUVlN+4X1HBXmn/a+rl0vPr83kJErSMy8Ruq6?=
 =?us-ascii?Q?q0u4/MCDk3whkhsnRjGaqhqB51BovML2kshfRGJCy3JKEVtnR57qIrT/7hB5?=
 =?us-ascii?Q?QH3aHmXJIEwWEKBjOunLJ/jjDfmndQEoo3QTMCFJV8PHyv/JzCleC8kn2/Wx?=
 =?us-ascii?Q?bj7DD4stDfxwv+Z+/ZLbAy9vcyBNomu1LL3k1pPy2vI0xVNx4kJWMuEsnqqE?=
 =?us-ascii?Q?OOnHPg6eqoTN1ZvUSMbWE7Dgt/c/e6a1jPnksa3Vc1iuM7Qio6qxbvtyhrMA?=
 =?us-ascii?Q?KBF3yfxo3Rz0D1FJTPaMt5+7u0Zzuid9Hz/CQZuGN1q44oSg6pKi2b4/STPs?=
 =?us-ascii?Q?aVETqpt8nx83U6TPf/A4Tqs9YJKLNUF+5refxys3URzvP9ZLUsxt3f9IeW1D?=
 =?us-ascii?Q?hwjWFA/pFMJAR9OFeiZ0ez/SbzBsXVRzHDJtEF3aBtDemV0ndjz+CcGIUYgo?=
 =?us-ascii?Q?QgpbfflWNozql/lB0tNjWZfz/P+SWcTE0xddMm1zabzF4wVDIUl19YNocYxm?=
 =?us-ascii?Q?pX1bvqy3DiLxn5WIjwiCJy1UCieu2VA5oPdviTJk4RnxP4dLNx7CiPmHKSls?=
 =?us-ascii?Q?hkr7MLal1BmxO6nYOH/sT3/y4vjyc31PRZu+kSGeDE+mpx27OHgXRhVPKMrq?=
 =?us-ascii?Q?cmn8rlwEAYOIQnGXp2PVeT429s3NEXeJp1yMRKpO0cH3s5tfQnjUGcpwAMuH?=
 =?us-ascii?Q?Pzs+VD+/c4WHJnzG+y6NruhsKPFu2kzvkPE+86/91lQ32m+NXZ/Dt2ailC63?=
 =?us-ascii?Q?N+2+mtIEU1xM5Tp34xCoCnGX9cVZACbuDzVsmMqO7Clujlq/7poEzE+R9uxN?=
 =?us-ascii?Q?oqpo2uG0pgXx/b94peZP7IRltOxP6HwMWIq13UyCeL+ESNJEknUCidDYc3LP?=
 =?us-ascii?Q?PuEpd9XcMmq8ezO34A6pwvxRbqevVYDOkgQq4wI9mT6TfvigqEt+QC2gBD/8?=
 =?us-ascii?Q?B/sn7+YCblihKsgxUTAehkplbqqC9AGW1Z/uBOlzea0o2YcZp0U2WgqrkTaD?=
 =?us-ascii?Q?zv3gIomtr9RjRIE50bkW1Fx9hhrxQRFO9vtwL7IKgQlYWq13bUGIwy78ma7H?=
 =?us-ascii?Q?g4Gf7XC/rXhZ4exmR/jRP5JOcACb49CwE8+qsChxbowsFUAETOyHXmazHHvR?=
 =?us-ascii?Q?eIZh/l+8MRIyUNV8VngqIFSVv0qP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q4WawejWMzwrGk2uKAEanEE88/USitM8qLdHzQ6GZyAHuoa9d945wEhJsA5l?=
 =?us-ascii?Q?ftpcXrXyJdY0s5W9IpwiWh44eZCiWMHBnnu6REdj3QaHjkneSUGZhmw8tv2X?=
 =?us-ascii?Q?G7bXsyqocg6UWXEM29yxLWayGgJcjhrXYTW5tdMe1e+53Pm65mcWSdkJo3A7?=
 =?us-ascii?Q?bqSx3CgxhjW9EnnvL/YMf2sc4rjSvVrKSPwHrKJj+e1Fyk74HjqqnqFCssrx?=
 =?us-ascii?Q?IuuNxxyo996XYJFeYlheaCdE8ZKkADFHovmktI4YSjLAjZt6icALgtLYKR3W?=
 =?us-ascii?Q?Tdhl7uDpbN6/EjxHUCQxu8S+PBsd+GtO4Ssk/NX9kFFOQzi6KhZtJRUYvucs?=
 =?us-ascii?Q?aSpntUxOwc0CdzssoH8mXGA0UVMwxV3Zax/Jo2sWkfEZ2QcQ8ZnhbsvnO5OZ?=
 =?us-ascii?Q?5eHRcYm7+yL3HPDZplMNxpcup3yfSXI6ar5QRT7BvFr5eyiewActNSNgNUsM?=
 =?us-ascii?Q?bbxhjfe708vILUzz2t0Kq0//Iv6rxCJ+e9okiWaNw6gzz/1bAAO2YP9WBV9E?=
 =?us-ascii?Q?FKV4FEI2WlVuWn6VOKlGghT6QeuyQ8KCVnZlAM9CFV02QqHR2CRCecQ5y9OW?=
 =?us-ascii?Q?z94JgBasf5DZ7DgekwRQpgJRHqU/UcpTzsEHFx85aL7WAl7QNBv2pLerzAkL?=
 =?us-ascii?Q?i/sWfozhiHZpqsavTXwX7wyFBIpVEvZQD+rBRnS/H5loCCRBm7SpZwDmDC0Q?=
 =?us-ascii?Q?UVgKR3Uw3w1nVzkCHBdrPsV+sFUTkWWHEdJJSg+2305iH7m/Tn0W7Fj5hAm4?=
 =?us-ascii?Q?7W/7CwN4NR920y4OKdQ6YK8im71m6uUuuawiMla17p4nn+82HpCNPhB5eM1B?=
 =?us-ascii?Q?BeIu9bLwaIjZJLvoMpRfdUmHabMrBpgJ7owiOQAIJtMJeRX+qVsL8yN2ZbVZ?=
 =?us-ascii?Q?uiIOSMv6EIfTyOdavoiDokbN3T99vubCL0dxS+A2QAC15wh2CvMrkHF5jcHj?=
 =?us-ascii?Q?8DKyHJY78/u8LMacH/BYdWhhFAu51owea53n4Gv1OUfqehLemmZ4wtTuFTm/?=
 =?us-ascii?Q?1++lo+UdAtQB6Il725ZRdu6zYpggSD428/MwwPaDzs0ExewFg+PrdBrphwfJ?=
 =?us-ascii?Q?sBAIh7IkCKD3BXPUZT7pVPqWO36oVLjehvZ4tZzXuAncJXRejs/vSvGYe7E2?=
 =?us-ascii?Q?ukWeCm1G8KxwNAsmHTVe+1VmZaVhY4C9qg6Y6MHI5DobXAJT59ivSK93UcId?=
 =?us-ascii?Q?crq3/L7bnCo/+o70NCFeRhwZb2QfctPiYV145A+lIefmLWcgCt6zih5LeQN3?=
 =?us-ascii?Q?ZhhVZwCWJ0xZ4VWEKQG4LtFGJ5VJ8ZnqM70o5O9G+O5HGBaEt8YfGLob98uO?=
 =?us-ascii?Q?DuuqIZiiRnZYIEjiWtf0mtEaW86H9+ZryxopWlNcpaAyMHeY5zxwOpOHJ27r?=
 =?us-ascii?Q?EJFdf972YcR2uNu6hlXekFL9ZKbq1llMvfw9iwzwJt1Poao3HjykpNnRjJwZ?=
 =?us-ascii?Q?CRP16v4CNJCJ/tuwAAU8leWH33KS7+9P3Wg9ZH5Y83SQ2R0NdauYA/HxCU/C?=
 =?us-ascii?Q?H0q2Loh3Ru5cX3HB95/idQ5R9qQ6LaSMP751cW7i9wc7KI+n7iKUnnHfB78R?=
 =?us-ascii?Q?fuBp1q6WTjJdTQPgWHc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f382f39a-6ec8-44a2-aa22-08dd573d7f22
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 14:46:19.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG7+qCeIKyz6P/nKKwKbsv2REGEhppFnIwiekO1YI3ktWIKjMwcpoEbg8S1+zHUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619
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

On Wed, Feb 26, 2025 at 04:41:08PM -0800, Boqun Feng wrote:
> And if you don't store the HrTimerHandle anywhere, like you drop() it
> right after start a hrtimer, it will immediately stop the timer. Does
> this make sense?

Oh, I understand that, but it is not sufficient in the kernel.

You are making an implicit argument that something external to the
rust universe will hold the module alive until all rust destructors
are run. That is trivialy obvious in your example above.

However, make it more complex. Run the destructor call for your
hrtimer in a workqueue thread. Use workqueue.rs. Now you don't have
this implicit argument anymore, and it will EAF things.

Danilo argues this is a bug in workqueue.rs.

Regardless, it seems like EAF is an overlooked topic in the safety
analysis.

Further, you and Danilo are making opposing correctness arguments:

 1) all rust destructors run before module __exit completes
 2) rust destructors can run after driver removal completes

I understand the technical underpinnings why these are different, but
I feel that if you can make #1 reliably true for __exit then it is
highly desirable to use the same techniques to make it true for
remove() too.

Jason
