Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D3B3C544
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A29C10E220;
	Fri, 29 Aug 2025 22:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKXtOaSW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2025910E220;
 Fri, 29 Aug 2025 22:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9hoeb23Lh/+CPmbsLmhHITQNP3yTqGgqi7XwenT8weKRiZO8z8LogoH/1vbGZxDLA8K70dcsnU2eBm+7+3fxtGVQPxyabQT5EkS02KUEwJLAfTVAPy4NUZshvRB3XhZFe+kdI2GENt7N0UdWKHv4QZ5R/L2ovcOI3GBSqrb52vTsaQ1m/s+p1FMuyEgLfTSbjtllt70bZDBT3m7zkTAaiZDiZ04NYYjziY0rZiDG41r5V5dhVEBag3BOUd+gRmL4sp4Bau9Uh9XvNUebT/W4jyt1rInBOW6GBi/5hpYeUY4mXNG/TeXiTgLZaGo96m0uBbeVXromrrz/flmcqeqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btIPAbK3bUv7/v2CFO+Tup6zXNlLh4DQcGsE7TNVxZA=;
 b=vNPjPKy5f6CQNn2UVWyQwj3CvAgJezAvk3bA5xLZlxDtCywkmbakZki2rdaNxtbragSOA+wNpzHFBcEjjjJpZfnputdreL1MulUCMeZHsJ0g9wsqxeaDDj76iP0NmzG6I3y03jEx6WNd/Jmnxy54vLqCnqBzIoIWgeelgdS17duLoJCqdOJjKWm1W0UYmFrdo5stf246GRu576roxiIG+JFbgs0gOoL50D5GZqjI2NvUsMST+naqEfF72KXEb0bLVhkVMM99xzL7UDnC9bNw1lATUeK0kHO3dmN10ZE7bpmaE8yJdEdMz8pZ1cSQnMyemrXxeoZ99haICImzgoq5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btIPAbK3bUv7/v2CFO+Tup6zXNlLh4DQcGsE7TNVxZA=;
 b=nKXtOaSWBVr5zUabEezX2RoNTgxc6QemiHFeHD+VCxM/f9yQrdhNzzll3EZ9ZAj+OXTEakLXcG5Br9uUi+sS41iszvmbk9PJMcFtfVj0d2/shDsqUrcODHUblBYSC6tLrURMeuZNdZMQF2QjaVRQrBlts6AVc5jinXJ0/Bh7MhkCjuphpNQXRgg7n2CTQ0MJ8W4AS6fFCyXk/fydutfsnYdfiS7S9iPOCPFfrkAp1zldDEQvsUZsbwTA3IWoV8yEPLirnT++Yjc8ZPlAhzSFToeEr7Q2UwmouU7dmsV5aIdr2o3U//PCPrqCnyTnZ5xUtLc9V68qIvZsNi7rGx7Caw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 29 Aug
 2025 22:43:52 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 22:43:52 +0000
Date: Fri, 29 Aug 2025 18:43:50 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 05/17] nova-core: gsp: Add support for checking if GSP
 reloaded
Message-ID: <20250829224054.GA2082651@joelbox2>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
 <20250829173254.2068763-6-joelagnelf@nvidia.com>
 <a251efc542a49e95fd7b7032bdd1092253f967b4.camel@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a251efc542a49e95fd7b7032bdd1092253f967b4.camel@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0930.namprd03.prod.outlook.com
 (2603:10b6:408:107::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: b08768b0-da3b-4be1-0c14-08dde74d873a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yQzFQNFSuzDsIci/0MKcWFm80LbgOgMRNtR6lnFgUz+Y7fDFQFU/++9OE6?=
 =?iso-8859-1?Q?hhfHcSskOvf51sGHjEIRPDQNXS7qOFMy3nreKzYjQBYHc+RzqE2NHg4QOo?=
 =?iso-8859-1?Q?hFh3M+zL66kwSHSjt1ZkKqe4C4Makp5+TxbIUicZLBzbN/ktyNCO56UGR+?=
 =?iso-8859-1?Q?K9K9kkbpN1d/F/ftO7MqCeJsSrqv7l0bA95k4ZblY6LaNfwoY9TZGSwuj6?=
 =?iso-8859-1?Q?CIvljuuH6SKDWxaf9pYuesqGOzCQ/dsYQn8T9jaUluMy5hr25zXJRxrvia?=
 =?iso-8859-1?Q?MEzFwlq196W4qzPhe7TEhptlweBlMXzsYUGHK41gXNalTR/fMkEhNhNvLr?=
 =?iso-8859-1?Q?RETq8wzkkP2PuxPZ0x2lriRhGZ8MPE4h1C1Dcetc7eMxHZF6n4+n0l7M9Y?=
 =?iso-8859-1?Q?omFVzgkhsd3W9TTne5lpSL/8SB4FhgVeJVMBlSyVw1hMwqktpVmt9IspZE?=
 =?iso-8859-1?Q?pIyAi+VdNi6tcOm3yD+3LHAPprjpF/diOT4pM2l7ZoabDV85S9p909BFxS?=
 =?iso-8859-1?Q?6nr90d2SVfamGSww/C+DwmS9mDXDZ20HjUaFiAMk82iPw8bB8Kin8D/6IW?=
 =?iso-8859-1?Q?+lzSFqxi8pVJnmgnuoiD1WKxeNxmvK4LYeHmGX87xuFtGnU0TmfjP+F9WB?=
 =?iso-8859-1?Q?zPHKpM15UY0un6ewlPm1CisabbtuK0YwuV6h2565tP8h+BeLTQucPtT+U6?=
 =?iso-8859-1?Q?PinyO1wbhloyA+NZVeNijDrgT+l7GZ6TAVTgqYdRVReuoJFugUmTxLJFef?=
 =?iso-8859-1?Q?UtDQibrlf3dNVNhth7TfciQXdnGTCgs+R9jOZvAjIeO+T5RU0arlu7WDof?=
 =?iso-8859-1?Q?Zk2PY4Feu0uCuYZMit/t1WBKaxwyqxQ028LqPsd50cEY1ULwVsQdHLNiLy?=
 =?iso-8859-1?Q?oE7Dqkkvco22czINO50osxP4f3rwWhIxIYF8VQ7L4W0oek86EKRWOmQA37?=
 =?iso-8859-1?Q?dmOJQdHb/H3F6KQOVDg8JvV6crbQpsYsr940UOQCU2dRI9Cs//cYkLCYkY?=
 =?iso-8859-1?Q?QL7RavHZMt84/a/0SfcAIIgJvKVVZjTLJIDp1dVuW1Xv+k7dx5OdENrW1n?=
 =?iso-8859-1?Q?vdhVbsnm86NIQt2ceK2o6d6DGQhedK7gePx8z10ddiGqvofheuHox2llbZ?=
 =?iso-8859-1?Q?eOThd+dpDm+7OpfVcM7uRZLqEI7B4byDtDT603BBSNcegXiIBYTsgOA9Fq?=
 =?iso-8859-1?Q?5wHUCr25Z90yHg8Xuka73NAmpXlgHuGF1T6+BJi4QdPYfYAvsYl65TK1Db?=
 =?iso-8859-1?Q?SQOE1YeTkdNBfqG9SJrxaexYQGD9uba2r/b3S+78MIe263Yq/GGVQoXf5q?=
 =?iso-8859-1?Q?rFYxR0EeGQodLeOoHGAgoUOblaFhMnG+X7GeTcJNz7WcsqD9ik4iEXxcDK?=
 =?iso-8859-1?Q?t7lKRGHX+fW1Nl67ZIIurnQORdrClKb/kvEV4n1o7ugsX4pkiAFpFUdw/h?=
 =?iso-8859-1?Q?HEIAKbitsiuw7YnH8cFDvN0x8mv5HnHb6DTvbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e8d+KsDc/Dq0BaEbZN2tFTt4A7nPQpOJacuiDocbSNIO0NiE2jYHlycWtQ?=
 =?iso-8859-1?Q?F1ZTKEA1SigL0DclWIrGr1aRv1ZtC/zagsK2Pd21ZQ6CKjEYw9HqmBzNYb?=
 =?iso-8859-1?Q?+ygIoffXngpLDS7YfXyf8A/sUF6pPcA058NCGSnwYnQxhn531xC5xxNkXz?=
 =?iso-8859-1?Q?5GMYJAcRj5au+dphU7fI6KzIW9TEmlnwj1pTwetLKaETWmH58AXAcXNxxQ?=
 =?iso-8859-1?Q?0H7bEUDiqJDvGUkI+CevDgQ6Moev6KwenRBygEL4B/JvYK3HSTvNhJFtTq?=
 =?iso-8859-1?Q?gWlvQLLOEeLdGm9pK5b5kPQLIZwBWNBFqaaotTkPZ3ACDuCQZkLz0C+NpU?=
 =?iso-8859-1?Q?IQS0A5I4ZThtKjLFXJZtDR3oQgkCDq6uuZxfKpT4QtyEiulTw8h8k9mQZo?=
 =?iso-8859-1?Q?1XZmI5IUkn3d7JPjHxI4pvyA3e/hDB+Dn6LJLXjyjfK9ynd45pFckHzDQr?=
 =?iso-8859-1?Q?g0M9BiWrFEauVXjM1lHNICXaP/84mUPHaFbwbbgclGXcHoWGDIA1ZJTl0F?=
 =?iso-8859-1?Q?yy36R08XqkpjWwzGkLV4D2cINF/WY0GIhMd/Xk1JiewU7XhrtAATDy0xlM?=
 =?iso-8859-1?Q?vFVmjP4Vc+muVqDjI8ILItYiG/XBTsiBkDht4z+39lM3RGjpEMF7pla1cB?=
 =?iso-8859-1?Q?+EZhGcIlQZOKpgB2Ov8IfiiK/adju62Yxjr2ACMbBj17sI04S+MCGH04mG?=
 =?iso-8859-1?Q?ZOEiNTBazfB99aUtce0SXpYUAK/A12TFv3t9+MzFGjQBJFQUicInxkIwW8?=
 =?iso-8859-1?Q?7gc/KYuZ4eIDTkHUMUn3XBMmMNE67IcOyf61rPl88N/zLUYvgorcyczQFs?=
 =?iso-8859-1?Q?gKb8I0/0Zinf3E2w3KCrcf6Hz0Y4Z/Lae46DfOX3SanJjkhG//Z+6y2+oL?=
 =?iso-8859-1?Q?DnJzJ7qV6WAVbAD0/lpGcbRMgy/bj5JITD/tAlpaBOljaJL+NKtX9WHEcl?=
 =?iso-8859-1?Q?qcpVeVR5HLMsDjuE7GFL93MctPzYcKZVNjxsfHo434/W+hwHWWW7OxqEm8?=
 =?iso-8859-1?Q?EZn5qkjRXHgikoTg5hZwZSYls8PflEL2BCzC7lg3Vsmy0op3ZJ4t2tpFGV?=
 =?iso-8859-1?Q?8FymURt2qrTCW26jBVbS28iFSaybB7Na9otk69U3ETX0jCgxqq2oFA5ix7?=
 =?iso-8859-1?Q?U6Lup6LlK6fCW8fC3pB7urWNyQVe+x5+MBpHknuW2e7yIj4idBcoixHtkl?=
 =?iso-8859-1?Q?jQWmQbzY7oEBv+m6UP9zqMwcaNQ76E9YVGvVqQyPqVA4W+O5lNk9j3pFJd?=
 =?iso-8859-1?Q?ZTFiDfKawFdAnkX4o2sUFusnGrfqueu+VCx7DGeYPIVkBTi8GcL4DfJhpl?=
 =?iso-8859-1?Q?gUiuOT369B3rH6ycSYiF9pWfKT3kbqerGC0rSeB6q/m4jcePu4mjXC54Hb?=
 =?iso-8859-1?Q?EGamdgKqF5YlIxgGiiejKfKsP7zwbRYkOEQLmtOiTtLy/TrsUeBCRpbG3z?=
 =?iso-8859-1?Q?u9TQ2TMdYhAZJ9P6n1kYGpm0vPcRh0uyIZ9v8AcZ1TY2R7tWq235hD2NY8?=
 =?iso-8859-1?Q?IsicgTyXgyPXIDRbrzVy1yZ6+dteTrguoh6Nrx1hvBhcBGEZp7gBgyJH8p?=
 =?iso-8859-1?Q?MI7eVYgpA/bj7zhNM+sZvTuj2Cp6dzbDbPoQwzwevM7OTklaxhQPjp8v8/?=
 =?iso-8859-1?Q?FvbxmngbnM5X3ApKk6+v34MRzQE9u81c3B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08768b0-da3b-4be1-0c14-08dde74d873a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 22:43:52.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eOuXkKqFT+erHaUCKTzVY5MOGJrqcDVH6Vb+qZEhPDwHERaBFVQwTofbFze/iYM3NWzfhAK1O/r2S8BxllzrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813
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

On Fri, Aug 29, 2025 at 06:44:53PM +0000, Timur Tabi wrote:
> On Fri, 2025-08-29 at 13:32 -0400, Joel Fernandes wrote:
> > +    /// Function to check if GSP reload/resume has completed during the boot process.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
> 
> I think this should be renamed to is_reload_completed() and return just bool instead of Result<bool>

This function can return Err(ETIMEDOUT).

> 
> > +        wait_on(timeout, || {
> > +            let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
> > +            if val.boot_stage_3_handoff() {
> > +                Some(true)
> > +            } else {
> > +                None
> > +            }
> > +        })
> 
> And if you insist on returning Result<bool>, at least have this return Some(false) or
> Some(val.boot_stage_3_handoff()) instead.

Ok, so basically that means we would return False if a timeout occured.
That's fine with me, I can make that change.

thanks,

 - Joel

