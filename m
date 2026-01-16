Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F07D2B569
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEC710E7E7;
	Fri, 16 Jan 2026 04:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2UOVcBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF810E7E4;
 Fri, 16 Jan 2026 04:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElTi1lDxeBznB1AE/4B6ECimukLSRsGwhXXzsc8AbidoNaxzJtN4DIZ0nV0fvfPhtt3lwbDfNxoTBlE8Fh87IdY6odpYBg9OB9QE53XVqhZ9NRcAMn9wLGah8cOOYFSMO88YqrwlGa0agoB6DN1ldyp/59EdGg+/DUVrLxKfiWiyXHDV7lhqU+SE/MKmTLTAz65O/gcf/D6EomFQGkmnvMzjpyMKFWUX81sichWyPvImhh4sltj134hfLhcWrH2v1D64GQ0LOtlow5RQws8lg3V5q8SnNHVWnWow8biSKUhy3Bp6zeUWGMOD9JD1qKogWBmuQAGbL6rsUPlUz1HURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH4REHL4gSw8skJJ3H6FZHuRgD9LfGtoAZcVVVS8UXY=;
 b=pKHoKm7/sTad8INOnJhXuUE87uUvJenvnbmP67mlR/cgorL9rEnr+TrBjolDg7NEf76wJRIkMzzvC5Yoopk5qroapj4MfINPbDOKOLHTOnXQpSZF7PWXaFgdJwWNyzYM5bjYL0AyjIPN3vnsh9NDSyp3N9t+a3pHTHIcXlwIwF1cQkSDyvAHL/JyA9HVcF435tq46JV4+XhG4cjvsZmXW5uNM1ZOsr5viUK2p8GXKnIk4gtPmFAOrjzXpOo/SOHMGUQSOR0apRJ3NWrxRxL8lZoYJWbb9oAibmaK+3oo6lOutt/kJ6JAcCzPQP/vDF2BkafR0ys8mvXThKZQPuBgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH4REHL4gSw8skJJ3H6FZHuRgD9LfGtoAZcVVVS8UXY=;
 b=f2UOVcBS82/drv90rHhkyJIknW1j5oB+U07bGjvcfVHIqZD16DRXEQ8F9lgbT09x4+VyNa9Jj+cZgq8C9RLVnVo7JI4MVsP/+pZK98/j+OA3wCfu2bYKvGuOlVyDzhLV+93X13zi9LoQTSw6yeYuwp83jllOhK0KHCvaWWEywChz0+8GWKpZLUBdeUJ3NAQlekBaibrebgbtmyD/dpzjyAs301MZ1KSQzzbTh+SQy9Jm+X4ZssVLqnzvrcpmCnRprvz8OIvhSYdHbYxv4DqDadk/Ajst85H1l/fDEAnMfhZVkwpweMNj7+v54YFOp6w6V2yLtl8JUM6JppeL2gmGYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:20 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:20 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v5 4/6] kernel.h: include linux/instruction_pointer.h
 explicitly
Date: Thu, 15 Jan 2026 23:25:07 -0500
Message-ID: <20260116042510.241009-5-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0586.namprd03.prod.outlook.com
 (2603:10b6:408:10d::21) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: f6342366-a7dd-4fa8-f00f-08de54b7428b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u+I7+HokhO0N69Hor8AsHsxzVwbGFVhkU13Y2nafJMQ8O8lRs16KXJNhOa3H?=
 =?us-ascii?Q?SIU20KXoiKZgPlNNXJYi+0YKebmTKsl5NwRzs/803kV1zbDuBWR2K+GoMh+V?=
 =?us-ascii?Q?ufKTOi8WaNU1swScTPcq6EXQJMGMZSMmwRtSu20DQPovetTD8bXJRNAEuku5?=
 =?us-ascii?Q?ctw9VvSqt6debi2Dhxde8RBKvW+/Cli+Cs32TfGdTAne3jm8CVdPk+UrTZYl?=
 =?us-ascii?Q?BVHVwe3JBSkbAnOCTP1LwJsSKwzX1i7nSOAyIn/jEmAD9II895O9cA4FV/iL?=
 =?us-ascii?Q?0MWld2c2A26YgNeVavlOtaobr8OXnhmV900Mqn5Zc1C4yeKinKNKf/bCfTk5?=
 =?us-ascii?Q?Ope12qWpEh+JbLNRxCizuOKE5hcq7V14Ood4ZTHFmK7Ufy2OgW6/hw9MK9hA?=
 =?us-ascii?Q?fpihqPlJJLURh9WsaXkSTz1khifmcxzF9i7hcbvRUz0oPCEYtXEpfd72H+Cz?=
 =?us-ascii?Q?WZQhD+W4Phg8e8jVXIV4JAVw2QwYNGoDfG0lB8kcLLv7qU1rYR8U85uGWc2J?=
 =?us-ascii?Q?twjmjbF7C8up7wlXJHpakSNOK67lrLUYKIJBXCq1J//wG1ke1F+gewZIAv/z?=
 =?us-ascii?Q?kBEnr5JwXnxXZCUhKjU5nhvdRf15Pm5zXYzIP+/Zy+wAyS7/XauoPIRIKPe8?=
 =?us-ascii?Q?alV9XRCIv0KJZGFYv+pva0a7i71rc8rnSYPye6FjVClOwo7L8obZQUP4stEX?=
 =?us-ascii?Q?gMDnO1HfQK/MS+N+OX9xLS8+a3uC+tlCbz7at6k/+z9/KevuP8WtCPCN3kTv?=
 =?us-ascii?Q?2L+8N8sY3Zj26sJmMjrTr2Fu+V3Z5EOt8w0Biu4rhq2G7nJoT/oxwnyKUhxl?=
 =?us-ascii?Q?gXVLVPzt1wKiZvhnMK+UeQkGKCrd92Wh1zZlZw2qERun+cDmBtIUcZXlIch1?=
 =?us-ascii?Q?lNWZ9dc7UySF1n2ym1SiqBFM4glhN7+Dy8YU8uxppPKy5Zhqu5ZpUMIZsHRt?=
 =?us-ascii?Q?NohQyQEthiwoXkZXZjg439kE8KaJyDt52MopDOCIdv+6HHHqKfIlRBVlFPOC?=
 =?us-ascii?Q?CMuERxQllHEYaZVGK1W5j4XVJs0jjP4ivpP56qH4HpWloHzV69R1DomIAQsv?=
 =?us-ascii?Q?7VmsFtziA1501pl9M+l6jWJdBZU4qsXVWvcEQxSjmvAJuel2LAPtY2jquA+L?=
 =?us-ascii?Q?w01nmwhCqbkSvjs8CZtY2oXI91SjQbUnLGLvl1UrCPp8qu6AwNp+dq2xHovi?=
 =?us-ascii?Q?XdCBotRUTSuqzexoz2y3yQ6Z13zJJfEFEHbwX3ilfu0ern7293ljCJpypOAv?=
 =?us-ascii?Q?7Ymt17c+tpMmmSEBuCXjrt3Y+1FxuinXZCNPsdu81ufrzm04z1OflfqKr1eG?=
 =?us-ascii?Q?/D44l9K9lt5p44XapLRPBYzOrASzlAbzB5vZjbEohHxTAb9c5F7KH4foCM4y?=
 =?us-ascii?Q?n/QEoQRFj7tWUHGVjWt3b9vLPXiZDYfW/IM8vi8A+pAzBJWPJf+5Gc+8jr/u?=
 =?us-ascii?Q?aZzFH4LoojdHz/Q9hPjAu+wXbPVcspHYx/58otDEHLwxRIdGVnZTi7OQQUCS?=
 =?us-ascii?Q?uwJLkyIbh7M9uYUz29GojqrWnn/u8neu87lBaciEV2ZegasyiZk7KZeGo8PM?=
 =?us-ascii?Q?Wb4Byc3dtpyxZOGvnHnaBIrK0iNCOz447l2gfY9WoDc+3RQIP3QrMY5vLxKH?=
 =?us-ascii?Q?4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jrxOo4KmM8pnyN1AiZ7XMlkHDB1qzJLkUKAQvx+eiokEF912E8YDfxPg0Nyu?=
 =?us-ascii?Q?EV8183W33hWzujQd1sRSlbcSHDV7Sv+OoIhU1Vqz/ACT9CtBRQYMi9UKvwe1?=
 =?us-ascii?Q?a718A0ZjSstUIbXvZqqlbVsb4gcf7S44PqHIEw2HWoMYGVxvZPjPT9JAxHk2?=
 =?us-ascii?Q?YFXRifXQBR0cYBDojdyKHNML3xSCeswT+/R9MMVp4YIrOY7Kf16mNH2wdXbV?=
 =?us-ascii?Q?r2L0Er7syqlRH3HgmLxtXX2/9JTqRus4FoltIlhhcxho15D48JX209wYB7gs?=
 =?us-ascii?Q?VKLmW7/f04lw764kz5ompbduYknpxeBIiA9lEwh/w9VmBrby5XU9ejbevE9u?=
 =?us-ascii?Q?vTe20TjX815cJgk53ehmUXK35WjN/yamG/RrtphJL/Yrx0CpkBEzhlkk9KUa?=
 =?us-ascii?Q?PVPfDwmKXCUka5PUo27Rj/nT2qLdWJBCdUkGvKdYUm9r9v0JGvm6SGu0s+sW?=
 =?us-ascii?Q?ZnE7vv/J+RjVijyE3g8nqp2Z8F/plSAfkC/6Pn3FamSIXJzgGHfkRJgZKUcR?=
 =?us-ascii?Q?TCauTZ3JNoPuuU2yfc+XsjaA1Q5ZG7sQb/RPmtDns0VqqHJnRvmafTssYblC?=
 =?us-ascii?Q?Atwp5Mry3XWYbzK+UYmsDXM7HieU32z+Egzpysxcain8pG/J2jXl1fpT4e3j?=
 =?us-ascii?Q?1b4P9PWiKYDCiJ1mFD1W3H/XjcolLynmqKl3p4200xA5VFmkb+5/w9O92oNm?=
 =?us-ascii?Q?uhBrvhsL39BKlz9O8wf+3pZ0g6hrk5xgJmdAqCCzUSHD967WDwx1wBhHJG8e?=
 =?us-ascii?Q?AbX1OyXZyVBkXvEB4zYJfFoij9Sv6wcdDmKmXgfSVUuUoPYSdeHIY7+7EpNN?=
 =?us-ascii?Q?YtFRX8ZJL4nN7sVieydOHFJD6VldMqVOB4+eNnk2CEe0UwxXHyOaOPhNlGcm?=
 =?us-ascii?Q?fblmKTztxK+MPVWgbbVpAbF8j5+SHhwr9HCytru8VVrmRusUm4HGZAU5GyY7?=
 =?us-ascii?Q?5EGEpeVoxDrPM5QJfM9q2h9Gxy7+pBbh9KEj1CSyPWa+eLnaaAfb7Tb2Za68?=
 =?us-ascii?Q?WHcw0Wz+qlgM5ljH7ipPCLJ3IH2l8zWGITWKSGiD2eAHLPqdVprnyJQlZjKr?=
 =?us-ascii?Q?EkH+s3/fF9rOg8r3P3fbxSuSAvR51CoXUWCTQf8Q3rHBvLYmTXQQaMRa19Oc?=
 =?us-ascii?Q?HKrQ2ts3lawl5jFBqrwNJ4l3Bd+fi4Rj/3FMfzvvcOikjTB+A+6rphWL6/du?=
 =?us-ascii?Q?xPmB8Ene+eXMn+AXGSCrmNRailI0ptWjbDW4bGmw6GKLVHbddO2REi1GPcSj?=
 =?us-ascii?Q?5oTh1MXwuz/SUTLLpBOSaH447XzFjyQAev4UFv/cOQ/OQYo2wviUW3lf3KfS?=
 =?us-ascii?Q?1+EOqJ7Mu4UD007EFLfOP686DZgAstQHx//HY0DpKDOX0GJReMERl/Ma4tLo?=
 =?us-ascii?Q?BrU2BvA66Z7dMYRL/MLZ1zu0YrnRj2brlKaqO8vayQR4ANZLnDe6MNiNrkmg?=
 =?us-ascii?Q?4L3wtgCSyH7tKFvOHj/X804huaa7SnVl6gxkWCZlxGchW8rcKkKXPX4JEmgt?=
 =?us-ascii?Q?PFsug4vWzIe+gavW3i4audI6jt/tfu471S2gHku7nbMF5UghBXc5FcT0WieT?=
 =?us-ascii?Q?s2wLsc5NG9dvL0y+7P2EZfV/cJq14xkQR0gjsZrjDsHg2Cya4+JTpmu51uYl?=
 =?us-ascii?Q?2coRos3IwmspRfWIm89wWj+hUTWDJvaqy1jniF4OctLA9EgPZ67IQEvR4dvj?=
 =?us-ascii?Q?yN9oJl1O6uiiRDmWcturHINCo9zxF8Av/rBGKDHzIiG7ALwE70jvSfj2QdBr?=
 =?us-ascii?Q?vHOHjvkQmKFvVTNsA1qivks/fnox+M2Jz4goHU1BCAiHWbrWQy0C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6342366-a7dd-4fa8-f00f-08de54b7428b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:20.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHxmABoMYRz/USnm1TzuFO34N9pBqWIwsUKTQy3YbfIUX6YojszWSlMR4s8PyJgLUXv6MELiKxnlchKS2dVMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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

In preparation for decoupling linux/instruction_pointer.h and
linux/kernel.h, include instruction_pointer.h explicitly where needed.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/s390/include/asm/processor.h | 1 +
 include/linux/ww_mutex.h          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
index 3affba95845b..cc187afa07b3 100644
--- a/arch/s390/include/asm/processor.h
+++ b/arch/s390/include/asm/processor.h
@@ -31,6 +31,7 @@
 #include <linux/cpumask.h>
 #include <linux/linkage.h>
 #include <linux/irqflags.h>
+#include <linux/instruction_pointer.h>
 #include <linux/bitops.h>
 #include <asm/fpu-types.h>
 #include <asm/cpu.h>
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 45ff6f7a872b..9b30fa2ec508 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -17,6 +17,7 @@
 #ifndef __LINUX_WW_MUTEX_H
 #define __LINUX_WW_MUTEX_H
 
+#include <linux/instruction_pointer.h>
 #include <linux/mutex.h>
 #include <linux/rtmutex.h>
 
-- 
2.43.0

