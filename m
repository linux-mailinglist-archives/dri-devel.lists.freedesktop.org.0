Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87065C5F1DB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED6010E0ED;
	Fri, 14 Nov 2025 19:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SK2iH0+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052610E0ED;
 Fri, 14 Nov 2025 19:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4ROX2NzvAkwOEg4W+jUFUg4ud1xFFjPEKAEGPrDE+3T8kIzE9nFEy/GpLLX2yOoyGxD13DMSjbyC5D2kMyQrCUyU3QwPxrWMBHhx3etrQaikwPfKsqCYGWxHyxiRqowf+rAMQM5wrgEqYc6s+qk+/xG++rFEB5WZzXtecZ0aLL9CuWQ1INODZTCQs6rbhkaWaoK0wpXWgEqzfn73aWMObHSP2cE1fzaUkbLnvH05oL8TrWchtouYBhak1BpC9/kcYyxtiycqPJvGc3yA41RkoV10kd/uffyQNeZ6iEjBxie90s9r7ctxIcrJ5D57tIJBIzk9K0147Jx/GNcM8RJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AAu1lYzxbvovD97emd8njkeSBmyc+qV0jKIF608lrw=;
 b=epEwqET/T+QKB+Axaj0ET/I2O1P/iGlUNOOAqczykY2fZNQOA0LNi4mICNhi0RQLZ1hS7xtC/Yv1nhqjOzNkTUOE/dVFeqp3vIyByE+dQKKngTkxLyy2A3Fgv3pR+qfKRR7AlAEFWZSZn/clhBYiQXU8HBRM0OjX4r75jGDPWxBfGJc5jqeqATdbbxAFF9QxOdAI6jYkRxkpsfuBl70P1AJhZojnu7U2i42VtvRmJEhHaotAUGbjq1kVqOfuNiNpqXdOkZT6n9+obTk7bM4gnyJy38Gz5IW7l8zl0IrmumhPoQT+ucXhJY/8JxUalvglfTVgoccHjEo9BMGCwfj9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AAu1lYzxbvovD97emd8njkeSBmyc+qV0jKIF608lrw=;
 b=SK2iH0+Sgc0EDtVLQOOPutUhF/aHdc74uFcVy/+vxb8nEhFVy5pB2q2Nn2hwv65DBI6Y1QFALPE+gWQktMxASLQIUSgX6X0pqMCzk3G0eHCksoKyKZf8yDrIXav2hbUhqfduTHl0ahcsRnSc5s9W1/qJWUqrwHQJ6ntMxiocRMjOaUWlV7jD4rWKsLhsUoQ0Q9JYAWSprHa4IsjK7djtHJJWlZ40aG1GeB9zF2cbVuYNrLWTRRWchWHP5O3fo+vgeyj4wpuouEj6KQuuQbjM1oGWOdIclZC6pvLjvMiL+dapPyHK9Vr7OvFxrWW4o6KMKpXZQJOE/Sumg1YFLC0sFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:55:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:55:59 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 01/13] gpu: nova-core: falcon: Move waiting until halted to
 a helper
Date: Fri, 14 Nov 2025 14:55:40 -0500
Message-Id: <20251114195552.739371-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:208:52d::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4ed133-e163-4193-b908-08de23b7d4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WAIs0TY+Ekg7I77fmjMnSgwUFS+CQIKVA341kQozah2cNRK6pcJPbw9lu4wu?=
 =?us-ascii?Q?g5LF8z9nQJPumXGq1rQloYCd5JVxsZooRzVRpIv/982HGSHK9V4p1XlNlPvA?=
 =?us-ascii?Q?P1WRzmhmbxBUNskr/pHVYzWJUHatmVeliOmKK3D74+2s3zWwuMJnXG5Ls6+J?=
 =?us-ascii?Q?onKhJtW9iHP6emRZxiE41p0ZZ2XLQvX0ygwjYxCDYd9JqsQaKXk5ubHbUJQi?=
 =?us-ascii?Q?BIu4YbRU+eWYQrWrPacqayYN1mz4tgAOpfz/4saOzRmHlDCHnF5r6dJD9tWp?=
 =?us-ascii?Q?lCIc8lcCRr6jFVodUzaoZC/xGcgt39IinXxMIdoPL5Y7kuFY3uwzAZats0kK?=
 =?us-ascii?Q?u1YgkMXryULYEswSwobtd/jqUGolgNk+tWJGkO+9V9X4BBL/fnzSwS+K1PJC?=
 =?us-ascii?Q?WgvHAIlxkcR0VS/4i6OVz1mrd2a6cFAudn9Cg9Tve7z2dZA64xccwlZqByAo?=
 =?us-ascii?Q?8c4YQHevKFd7tpEKd9M+aCVMwXB3NT3vKBUwgFSP1MwITO5kzMAH9QlfUA0M?=
 =?us-ascii?Q?ybTDAs+mbJ5ptozcbKUqZY/UfYn0HFvx57yePqIh1/DyuYo89ddbo2vBjLhg?=
 =?us-ascii?Q?9h/zyo+d2WliXBE2JNRocJOq4iO8hy43/2JOYBKDUcW0kELbvPnER/OoCrDw?=
 =?us-ascii?Q?gxSpf1X/SyuBQXighOPnlfbEVoZWWZZP0DcSVPctj016UnavU0FluZXaQjOT?=
 =?us-ascii?Q?ciI5eoSardnuuLl+iz/q+4DtJigG/z/7972aIA6c5Hao7s2o3caGMIHdXmqL?=
 =?us-ascii?Q?N4IBxbf+W2iMocpRFRmEHiWN+OMIiJPLQZqkDWQduHVu5xiLWF+cP9LQ2E3p?=
 =?us-ascii?Q?o1PqX9yJ4xk6/Xh6UHZm0uwOfSqOAQE4XhukbYl850dKg2lmPyXANydFUtFr?=
 =?us-ascii?Q?Zcv+70DsQ8gTaum40+YPjzXJ6NtRRiqxQAX6PpXF1ZzrnoOLGtdLNSC/qT5W?=
 =?us-ascii?Q?+btx7Iq4QPBHP2KZw1WECECm+xPECnEPdy5qoPuarsC1QBGueW6l+TThwfqF?=
 =?us-ascii?Q?nOi7nNaQpjvt/k3tPTiKxMDUVyAK41VSojk+qUBEncMGt3XXdNbdOgsq18wO?=
 =?us-ascii?Q?9s8i4WonGbx7NhShJmcX5klAuJCiBkPNOvIl47SXGjfQ/Z9rmCaCIidHPnYz?=
 =?us-ascii?Q?r8wXH+hbel74qzQY3gwUoRmijxNuXGvpljldKHbEmeqth8fsSYxovEq0iz7y?=
 =?us-ascii?Q?dtqriSh2tfX5brYAgCy+ScSEzz/s3Kmm8ulsMwOSdvhE1qvp/stFMX0QryGi?=
 =?us-ascii?Q?36Qp+J7NjM3XvqP7WAlW7s0UHXdKZfTy3lFSLYrU0oy7bBcpkzcFUS7bFXDW?=
 =?us-ascii?Q?bhjrUlFOKSJLruhwveJlJsH83g7HNV/z6hf6d4qPTSZ8irFfyeUjg3GWDvDo?=
 =?us-ascii?Q?OL6pth0ljZGvTxP9fYDn51SL9AnXPNG/Hr63LT5KjuU3ylXb+D2shC6fmW/b?=
 =?us-ascii?Q?IZbVDdY+8VqrHXLrmNcwMKgxTVyeBUhe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2BeMH46fthcEV6metVXijFcF7mfJAygzPOD4zkVJC97J/7w3bVgSVjH3Uud/?=
 =?us-ascii?Q?T0mXy+ZgDGz7zR5r1rwJ0oC823LUGonbcQx3u5ZHzvQtZt+VTtXMOJXSmmKA?=
 =?us-ascii?Q?A1WJQk86T2Ojk5ZV6QqWKoCTEARgZp7R5COcXIFigXAu+rwtRgtnxA6L7dSw?=
 =?us-ascii?Q?xUwTWm5yneyoS4VlU2rWSSa4uzPUDQe9OzUnMpRw5o6oPPlNaIxHaGptl8+s?=
 =?us-ascii?Q?DZcyvw5hdUIR4cHJ6vaLjdv9UVTXvBbkAWgn2EH4SzITHmc2XIJuhHHUHb4s?=
 =?us-ascii?Q?/eQ2aArPvc2sykp9ODitP0GObROlVBQwcp4w0NeSIHZitgs9iPfgoYvK91kf?=
 =?us-ascii?Q?21q8i26C7v7h8DD6wOifl9aKb/2XuVXVzH5dYvob7p+Y1RG28IBJzLgIDImE?=
 =?us-ascii?Q?w+nZw/qrT4eb3d+qUU+6d0B/pABoQgz4/O0cEQ8fkchLKpDOupLg36vvXrKD?=
 =?us-ascii?Q?iD4jYSJUSHbwjtGSh+gABd6/m6t9qochxyLfxVrpBIlEBq4lMW96QUiwwS4s?=
 =?us-ascii?Q?UI+z81oGRKLlrdF9uAVK05VzVAePe+mfGR0GsP9tbRNUkcjTfbGN0SLNqvVb?=
 =?us-ascii?Q?r02i5Kc5GOTQCZpAHhkZ8v/48hCejfFHf7biDrG7Mj9cCglfBielHck/WM2c?=
 =?us-ascii?Q?9Qsu9rg3XsngQxs69LuqTsoVtRc26WjyZD97vik9M6I9jn3cU6cSf8YHWKiG?=
 =?us-ascii?Q?Jit+xNzEDhc6Ap87r8Ypca/QfmUK1miLVjTocUf2VaNAHthLJ0wRI/EtbJdv?=
 =?us-ascii?Q?dZ4UxfCrSPEAxX9p7hzAwEzwy2dMZjBrc4grLMt+vdvTP1lEtQ0L8yc2Ehfj?=
 =?us-ascii?Q?TGTFhTq2EJfqu4KZiVjMpo5GW7WqyC86LiCY0XdXUylYETK4dSKKnDiFUQkA?=
 =?us-ascii?Q?jpzD5y/ffKSa3DNEOwCxZUpGL93pQDXvIbOAsxeAiSRo7kEmFLVhPkR6HWrk?=
 =?us-ascii?Q?q/CHlaf4Hn9XxwY1aBDo+fLf2hyx4itfc91ambi1PmvXnx3VyTcHmjBrpt9a?=
 =?us-ascii?Q?rvjqAkU0/QMs8aJAyYFcR2vheRr6LNwfxmNioPPAEX9FG7LhE96EPBA6eZZC?=
 =?us-ascii?Q?s0GNXjNiQOum7IsZtb+IFVRVg6FdHWXcvZSkVBbGTjA0i9dH+I5vzK64Ekhk?=
 =?us-ascii?Q?CuTwD/2SkdxN+mvb9UwYGhrHh2hWXmWmQO+TDw3nxdAsCLboDB0fg0xP7zgT?=
 =?us-ascii?Q?EEU/M+Gx8luv7g5n+Rw2qqFwQ/RILA06yxatAdgforDQltq+7Dg7A+oQvHKa?=
 =?us-ascii?Q?v+qxxF06nHyKRAnTkiql7VJp2ra2dzlOOvgCeb0acvOEyV6s1jYstHeJ/DTN?=
 =?us-ascii?Q?n7kYDJD2E1yqhvZy88ZZssNIEz/VC+It+rZCwR9CIz9SpA77WREVGSGTw7b9?=
 =?us-ascii?Q?dMjFbVvnEMRGFXq+ETXqpGJC95j4588QUsN/nrxiJT5yImwdqJy5Yr4yY9Re?=
 =?us-ascii?Q?hxYGJKki8hl1z3sJ5HGH7G47rptDnibl9UW4q//EGk/LuhqG97hPxkWk3gZ2?=
 =?us-ascii?Q?Hxb1XVqq52PUzvCU/NecaqM2qnYm54LK3+pxzu9XcZA9SbPQJ//SYfr1MY5q?=
 =?us-ascii?Q?89X6/dk8S9mrI+nPnooU7t6+dGWrcuWY+/3XE+Ml?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4ed133-e163-4193-b908-08de23b7d4d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:55:59.0734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKZ8ZZH1iwv6OQO9JWV84HgRpiED8CNbYB985/XUB9JEWXHaGBNrWji1ebXxrTiPIrj1q7YoEOnbi4OpBOP4pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Move the "waiting until halted" functionality into a helper so that we
can use it in the sequencer, which is a separate sequencer operation.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 05b124acbfc1..1e51b94d9585 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -551,6 +551,19 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         Ok(())
     }
 
+    /// Wait until the falcon CPU is halted.
+    pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
+        // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
+            |r| r.halted(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+
     /// Runs the loaded firmware and waits for its completion.
     ///
     /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
@@ -585,13 +598,7 @@ pub(crate) fn boot(
                 .write(bar, &E::ID),
         }
 
-        // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
-            |r| r.halted(),
-            Delta::ZERO,
-            Delta::from_secs(2),
-        )?;
+        self.wait_till_halted(bar)?;
 
         let (mbox0, mbox1) = (
             regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-- 
2.34.1

