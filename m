Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGjpECUsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E682818DDB2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74B10E6D3;
	Tue, 24 Feb 2026 22:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pqfVC10J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E608510E6DD;
 Tue, 24 Feb 2026 22:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBR2vo5C8t1Y0fcqhGagNEEIP4M4v0sYOJLDR4eQHbiC1dx4DylIg7MEkUPAPVkCBdwInbnIxKeC5hgwKau5DG3Zv2yzDEsgbBGA85yS8LBGN9MLXe428nCauhTHLSpcDQTTYqCRh0Unpa0HBQlAEwdAg+Bbaj9iPhE4cqoxFbnV50sF9hm0YEAQNfQ0aacU3lgWt15xiufQDg0xyhTdpe7Cw173ecCUMKQphwS29bDzwaW59gFXaCfSgjrL8E1RGyjV+PIMJ2EGqEebE1fQsevF/Z9oMJ8ktuPHxvhoFzz9Os1kxcZQg/Y71co8c9wYHARA4imN1Djx4NCUqnOvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKGMz3SRy5L7rDqfqpQ9+s2Oh3v5QxzRT8C59uSZ83M=;
 b=P9jeLu4TgQ9rmTlYz9rzwPJZrLBDauxmRZLt69OBn46yxrOAajxW95HHVC0JdAo7bI1I5DvxkKktfrdPXLf13wunvSaYir7dlBH4cb4WX9FJ4cEEzgYx1fITApYIm5F7L85VzzVe/YKQk0B/DQHl4srWZKVSxphdqgVhmXm1YT/r5KpDUnXUQx4a3sfZgeO3vghTev8bJueFZsDs5JO1ZbjvLzI0kL877UaKR7UVD8TwY6WpPbMY98vZD+hOsqEuBH7TuLIU/+mfi0bAzpI5wuS3F0v2eYcAoYpp+LJyVok+OvM8B18lV2uVkdYJcI7KS5x7VodB6rFDGHOjZY1TZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKGMz3SRy5L7rDqfqpQ9+s2Oh3v5QxzRT8C59uSZ83M=;
 b=pqfVC10JvYcK7FpGkORR7Ts9s2MRLEd3RdBirAwfFjOvGETi7RRjF5mn4L9AKIovaxsVKWw4YP67Kn7sq/5K+Dq8pcYflBBymjScyRy+mFn2PeOOwGN11RQqSu1mujIJzzFrw0CuJ8wiQKBpm4MEA0HPjdHtS5o3xOwXASy6zze0aeys+LvhS4EB0blIzHiyONHuU5FhhvHHLafrlHwJluACUhTHNSxfUO8ADWJmNz6BIsDrU8ZzTg405sw9tjgAsrT8R7DgClT9cGlX7re3vVid64w1hBz6r3lPuAySsilCK0u028nske8B9x3lW53Jh+Q1QkW+Z4p7KKFDy1brkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:15 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:15 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 23/25] gpu: nova-core: mm: Add BarUser to struct Gpu and
 create at boot
Date: Tue, 24 Feb 2026 17:53:21 -0500
Message-Id: <20260224225323.3312204-24-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0040.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd57e6c-c481-403f-78f4-08de73f7a276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kfzgVyuZLLUXYFfHnthjja4gZ/jKMFLjqGg69SYn6/teNaGc2BP8Yd8ZShnX?=
 =?us-ascii?Q?aOCpNdlQf94cAjN9rhWZ2TXEgSAebKFsvtpNyoF+6fCjJXVJL2+sVMwWmEkV?=
 =?us-ascii?Q?L9DLHsSu0okFH0W1SlTy6QZkd7hnmMIkIgl66NPAGwvKdnLybuHJE9MY2Rox?=
 =?us-ascii?Q?AvyncunXAkEoKWg67R3dabffzzqcdfHCdJ1sehW5epLvd7mDM5JvRn91QLjD?=
 =?us-ascii?Q?yovQp7iSBmmvQr3qrAln/mfM6TVq/YSIQwfQUIVgYMmP0leeWaUxSORj3p8A?=
 =?us-ascii?Q?IxQbzNk+OTXM9wKwh1RRk+uRc2aQ5O0VXzEONF88+WDdSOJ5M9VVH6fNo+Xu?=
 =?us-ascii?Q?IYflajsxPqCBje23mFgYOTBW9OUImcXjlayCYSEL4I+SFb5/mhO/cNmPNmfi?=
 =?us-ascii?Q?IEci6oq1XuOaqCdNzG+dotPDIyaZW3axyvbnB0cTouRewYgp+EO5gyLtc3kX?=
 =?us-ascii?Q?C9nApqqvqb/Z/dGD2SXdzhMXLsGk45nepceVa/+uVi2ya+Qku9LgPfqncfom?=
 =?us-ascii?Q?K55XgxLypAg8Aoq+ZhKZig2oZNkjEHehQtoEpz+LwxMee5Qpo2xbZp+2Oo7f?=
 =?us-ascii?Q?D+gsi2BWIJbp2HbT3KNIsMJgI+EkKwphDgClkJhvw7NgyXEZqqe/mCrjpfVb?=
 =?us-ascii?Q?7D1O4HXlpHgRjx1nmD6MfN7QGKyeY0ldrThJ2EozW5eW5bZkeeSsLntFjM5k?=
 =?us-ascii?Q?c+Hf6EtaLa0ax1ZLqvd3v9pJIN9kRyA1HOm9xIBkcV5JTLLqUDcmFagNYBHw?=
 =?us-ascii?Q?cEF3SVBgpry/9gEbpU9D40MytjEGarmdRf5z64U/ihVmqKPOCp8TPtWRmF6l?=
 =?us-ascii?Q?byfYqQlacrzWOz1chXbL8PRnifwe/PH1PokvAnX4+2/h/0sKPHsrsTCGe1qi?=
 =?us-ascii?Q?/HXA1PYzSPEUP4vwU1D42ZvlyV6D1GwNcdCxnM3EN5P1Q8wYGcEpEQBhiyut?=
 =?us-ascii?Q?Qd4BtvVuNi8lZYHwO4nmR+3L6K3WRYsFBjUwoQornEPBkaqgufcP8bqVHGvM?=
 =?us-ascii?Q?eTkbVAktQCTj/VTtjNx18nVY0cx/xq+PVFBKOO2fx+WvylgQkF2KbBC1M6gD?=
 =?us-ascii?Q?Av0Oe46CUN/AYbAVkJrtPxjO6HsXumuqn6h9AYJFvXnlQAn5InvgEKhtQRGx?=
 =?us-ascii?Q?NEq6hVPiK/1fYwfSuPUSmHA5JLGvGsBAt98Btp+/o3+F8TFVzVKiCK4KscoZ?=
 =?us-ascii?Q?+cL+mxNfULBr/OiyZAY3Vdbckg3wQaZl+44mohhz6Bf6dSrsPIOBXY8XxIev?=
 =?us-ascii?Q?StD/Ml5I6kBDq8dPyLSsnlRMjfmc6Vo4cYpVRRiYdS74KCo2cyZPCUw5s2FE?=
 =?us-ascii?Q?Ody3zZ7BISMUKTy6HbozB7Loss3c4iM1MGvVJm6KS0Wke1UNbF/oPxLSXkVj?=
 =?us-ascii?Q?ZmFzkKbdvFfP92kuu2LbyLrSWNk/bs7atCPXeEPJuscnX72++rapfZd2M04w?=
 =?us-ascii?Q?X6lnMVthA3qPW9RRXa9J2NSfo670/L4ukv5lNu2C9jSj+f9KlRhLWMdYioqP?=
 =?us-ascii?Q?KNHejunAwtnx/7Hc1J2vSuwBOzxPlBa+/XErVn5Zt6GXLplzmryltnSnmlDd?=
 =?us-ascii?Q?STeY5DcVMlDKPIG47n4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RiWpZsC2kmT/3/WBW6M+YQAgxlx043sLGUWqQTZ8qha4kG+Utymxihrv/jU+?=
 =?us-ascii?Q?fB6RcnFD2ZZoW22Fhr4EgTptiEGNXODLL70NPVDSlQVT2FyP1r7BtbmaFcCn?=
 =?us-ascii?Q?3AmpowkJnnKsW7l96xBqT8sdNN1uxLlxx4CfIxa379kTmMFqn7nD5jkCLwo4?=
 =?us-ascii?Q?CPO0WOoirz/OsR5vTTg4P7FPr5yIqZ25p+P6L67gHOAXx/mzvq2SpPPo2sFa?=
 =?us-ascii?Q?fMuyNvVlcqFEkiMsw29sUywlOnwtKiVw+UaQus3W1XjCloWeChohmXT7+lls?=
 =?us-ascii?Q?3SBi5oTrcD3nkhzLoSX2X1rlq6d3VpjyhbPp6q2vjirZPHRqf+7JfqDJ8aTO?=
 =?us-ascii?Q?7Qcf5z7H2Eb/NgOXM0sA/Yw0GwB6nf/HXJN87trEIKVJP1fVnc7k1783xpFz?=
 =?us-ascii?Q?GiX2T+I42MNeONlQkq02I78abMAjanqtHsHp2I33PVMdMEhdOBVWgTJKFs67?=
 =?us-ascii?Q?rOOsYRgIRnlHClTSWbntBW7AmO0AhLllAm15MfKFRq5Zt7JgJ/kMITAJynuS?=
 =?us-ascii?Q?QVCgVEM3UAfYk5zxB8UaLMbAYGwY+Lul37UkZRQ/ze2K2bw0NfBnR/1kY0er?=
 =?us-ascii?Q?xW0Wn9UpsWTA+YHgLovESfHuCdLpoP6XWX003vQSiF8TFSO0g8m7SBWlx4fI?=
 =?us-ascii?Q?cwE4B5IL4J47snYSyH14YOBCY5DEtlDRBtLJMgeQfzhDzfgc7dRx7K4p+QWV?=
 =?us-ascii?Q?RWtVhPnJf3VyD6UeCc0VaqyAiBySRpG1C8RmE0bMvWbI8TLxWzbv4uHV4mFx?=
 =?us-ascii?Q?hjy2VGqEuq8iDzvhdcpz+Dh10zTohUBGq5zfNsfZWsVhwTqcSIbPXZW0oEFd?=
 =?us-ascii?Q?HvBvQyg+9jxxlid4ualyw+32BTLkuSzjLvQtfZLu9/caDgq104DlRJCGGwNA?=
 =?us-ascii?Q?It0u/PjiwiWGwk+0fnu3URYlj7NelpKC7a335/RZNKnAROTKEnKFxhowqWkx?=
 =?us-ascii?Q?JalvISfECLxRy4+47P76eZRWqO6cvssVz2R7Zj6SWm0ZCtEuE/xAn6gOSsE6?=
 =?us-ascii?Q?AD1ancG12X7n1xvHSslvsCuBGE6MwHy5R/70CDJP2QTqv3xtazgA1RArnEYI?=
 =?us-ascii?Q?MSnypdHqiIe8MV1XtzjmzC0T59/4asFGWvaamCuJqCOWZKZ+7dyNEvuterDN?=
 =?us-ascii?Q?X5On6O86O76HBUHlxlmYK2452OfyL+5yMNBLnD7zNEesEotcJOAhVf+dEP+n?=
 =?us-ascii?Q?/MzhkSYoyztfl7JX1G1J3RWCUDDcmTKokiXGOznuAoYhIAIntOa12jLMv3/4?=
 =?us-ascii?Q?aw9tn/QA0O3xz13JG8S6ZE3GXyRsD1VZUtlTiA9JCxvNDLG/bpuWuDgOJEX8?=
 =?us-ascii?Q?ohXmmdPz4N+pseOKNskZqxRVFs7LcJ1mAvKbyKkMFRIGkWmSJYw0y/IFLKup?=
 =?us-ascii?Q?hTuFjPUG9ZS+WRkq2NVAVL7qxcDHEgkwIzVZENEjo9ZIXDxfQO7AD0qqRjdg?=
 =?us-ascii?Q?+CPNTG1TlfTGD5otq/GPr9f3OyzhdjCWaqQdcGN4c6OCRw5OZCqxhpH/if7d?=
 =?us-ascii?Q?bS8oJiCGF6dMSdcth/TkIxefUCCG122KbC2lyuzXBMM9VU3zK3l6thMiUuMW?=
 =?us-ascii?Q?Lus5J4WmcpQYOE6XK+fIn+vi+3ekNOMbuARfIz+tXEpdxBpLw4vO4g4vbCuP?=
 =?us-ascii?Q?cQkV/Imf0xjrsNm96sas5fdETHJp2qegC/EU8kmSH0831KqrJ8PRN9Q7yKuZ?=
 =?us-ascii?Q?D6jtQpaWUMZCuzOOwXCQYJLwgehuZpmkUekrHbzKTzuAXw50Bo0XJHbKawyM?=
 =?us-ascii?Q?mKKqFRx8pA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd57e6c-c481-403f-78f4-08de73f7a276
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:15.4732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6TsNiPkgg88r4u1j6KOIyUZUbgQoyvxQT/txqFsVKaw/H9P9ogSzut9E24c5J0RPMq9RNv2Xpb8iauiEWhUdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.938];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E682818DDB2
X-Rspamd-Action: no action

Add a BarUser field to struct Gpu and eagerly create it during GPU
initialization. The BarUser provides the BAR1 user interface for CPU
access to GPU virtual memory through the GPU's MMU.

The BarUser is initialized using BAR1 PDE base address from GSP static
info, MMU version and BAR1 size obtained from platform device.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 22 +++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs |  1 -
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ba769de2f984..4281487ca52e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -26,7 +26,12 @@
         commands::GetGspStaticInfoReply,
         Gsp, //
     },
-    mm::GpuMm,
+    mm::{
+        bar_user::BarUser,
+        pagetable::MmuVersion,
+        GpuMm,
+        VramAddress, //
+    },
     num::IntoSafeCast,
     regs,
 };
@@ -36,6 +41,7 @@
 struct BootParams {
     usable_vram_start: u64,
     usable_vram_size: u64,
+    bar1_pde_base: u64,
 }
 
 macro_rules! define_chipset {
@@ -273,6 +279,8 @@ pub(crate) struct Gpu {
     gsp: Gsp,
     /// Static GPU information from GSP.
     gsp_static_info: GetGspStaticInfoReply,
+    /// BAR1 user interface for CPU access to GPU virtual memory.
+    bar_user: BarUser,
 }
 
 impl Gpu {
@@ -286,6 +294,7 @@ pub(crate) fn new<'a>(
         let boot_params: Cell<BootParams> = Cell::new(BootParams {
             usable_vram_start: 0,
             usable_vram_size: 0,
+            bar1_pde_base: 0,
         });
 
         try_pin_init!(Self {
@@ -330,6 +339,7 @@ pub(crate) fn new<'a>(
                 boot_params.set(BootParams {
                     usable_vram_start: usable_vram.start,
                     usable_vram_size: usable_vram.end - usable_vram.start,
+                    bar1_pde_base: info.bar1_pde_base(),
                 });
 
                 info
@@ -346,6 +356,16 @@ pub(crate) fn new<'a>(
                 })?
             },
 
+            // Create BAR1 user interface for CPU access to GPU virtual memory.
+            // Uses the BAR1 PDE base from GSP and full BAR1 size for VA space.
+            bar_user: {
+                let params = boot_params.get();
+                let pdb_addr = VramAddress::new(params.bar1_pde_base);
+                let mmu_version = MmuVersion::from(spec.chipset.arch());
+                let bar1_size = pdev.resource_len(1)?;
+                BarUser::new(pdb_addr, mmu_version, bar1_size)?
+            },
+
             bar: devres_bar,
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 22bd61e2a67e..8b3fa29c57f1 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -235,7 +235,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 
     /// Returns the BAR1 Page Directory Entry base address.
-    #[expect(dead_code)]
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.bar1_pde_base
     }
-- 
2.34.1

