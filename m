Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLJ0NCDpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D94B911
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9A610E647;
	Tue, 20 Jan 2026 20:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WPhJKa8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821A710E225;
 Tue, 20 Jan 2026 20:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJmQ8dZq+FJYzFs6OAU2bht66jwnc/AuoFc3JpM1PuDpstaHRV0kwEONPxyGdFnftAB2LteFjguiDGNicC1hEnW+beCmrPHjXQSLAW8wVGduenqVZlR4LgmY7qsdL+FVCh9u4mh0jAQ47PBr408Yf1s9FF28sLLzdZZr8qf61jJGfcgTjYUOlYZKCl/iyKVo8eUGqaEuqEZs+tRr0QDgBs7IHDHqhVpFa/P015IJvv8llQro1z2evmm7xBmwdojw9bm0ZP/NepAcjwwj8nkxFHyjkBupG0AeOWQrnhL4VNRVcDG10Pyef36R3z+fqHxKoAc65+4Ni/EKe0J5QsY2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mu84Kffu6HOuxI02ZvFZKS7xhqFhFvmzCJ5Re8VY40=;
 b=ObSnWrZO2uC9STMHrj4pAnT1u75gKXnOxJVHfsF2elFdr9plYnBjpkW3wcXE6ZCS7Y4NrxSBk1+SWCSgxjmeJ68JRlMAf+YX/lbLr6dLW432ThLTGMhATsLBOdgzuYIIG0uuaBsUbYv/xwEQtH2FppG2fSZY8MTFLp5N5OynweGwL2Ph1eVFDKmnPrUpU2rY6SYrWEdbS30nB3qnU6X55i+AdlRircdqTnQB895xCHDrt20uANabMs/iWOI2AZbchM1WWRIJKPkgXz0cT2QumErpuY/BiXkxfN+nk/I3pSZv/hMOqTigLkof4vbrg3eP5tagBeHoOQdzRqPOhmXaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mu84Kffu6HOuxI02ZvFZKS7xhqFhFvmzCJ5Re8VY40=;
 b=WPhJKa8krL5FI37DqOipwj7ym1grqLwAGcGj+A3ZrCe1oCE7StaA3R1SasOzqIAZlV7rZQYXZ1fmkLRel4afWfXfPkgglfiOCPf83MGk3bUI0HCHG53HxDNH188qbkg6KNn7ZeapKTYpNaG35Ds7feFECs+QrwTlM8irOyWBIMM5lSrfx/9YWDMdbz+6M5nj3hdv0O94hLGT1Wr9nJpa1cvOIR2mH1EHGhA9NfG8WHZ0aaa9U4/6pnLugR8nKNlUlDZ5wmnfgkREICOGEbsDm3MFiJv7XI0+pZIPRqN0sO0D5ystao7xd4mn0mYdc3hpy9B2p7LzoATEW7/KZf3+1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:08 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:08 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 10/26] nova-core: mm: Add common types for all page
 table formats
Date: Tue, 20 Jan 2026 15:42:47 -0500
Message-Id: <20260120204303.3229303-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: a7527e2d-8bd6-4ec0-d425-08de5864a8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Uo+2mWh1VUNY+XQHfNIG9JVC1Req3lCYzcfzbQC12/XPFNt9Oe5xbskvrvh?=
 =?us-ascii?Q?Fo4/ZFJJ4lM6uXocq3SgfbQT8ocaf3RmAFoZy6fiGke0ihpNA+jz5svwOLDv?=
 =?us-ascii?Q?AL3+3TY5O1jAZBQYGglLcQX0KOLbY5rEfLqGwzVbRbcV5kac/lBwb1EyQC9V?=
 =?us-ascii?Q?SLR1UQYSyL1aqMbz0SrMvG4Ar4UpA4GXmsuPDVUxWuar9jqK/srYdAu00fR5?=
 =?us-ascii?Q?SeL+YaTHsCCn0kbgBt8H7m6zWN+h0J3LnSAB2hVXiM/ubiJmMGXP8Xm+ndyQ?=
 =?us-ascii?Q?jY4p/Lf33Cj7Q7ST4LDU5qcpIeVKCLVM4s/oQWbJZBNpybJx1AUP6OaonYpD?=
 =?us-ascii?Q?PoGnny1Yj67Le+L8cSohFGLgKuW+gx/ISnJWjYH4gEBP0uX+jIX7B7Pa+3gV?=
 =?us-ascii?Q?gBEDmBDBziSzB5Oz4hjifbws9A8GVMwhXjsfQ++bCgQXB9x1VXc5bxyJgFnr?=
 =?us-ascii?Q?xrt2fYUN/1lDZZodAQleE2B5RbDlf3S1L89Sl9ktpHnE47sAVrgoQBz0QKGQ?=
 =?us-ascii?Q?yXv/sRhXvHyKLDEvjlAyC82gPASKSq5sYWjxXx1AE8jcb6j5GeSLLbYGVPLp?=
 =?us-ascii?Q?bKGihtp6z+rEh4Fd6B6hwclmyNxX4AY+IZYaVv3IoZSdKav52mN6aADJlku2?=
 =?us-ascii?Q?pGaYZOiBMI+KuY9BaS+8hVyiY9vWkxFPAkO6ptNbqf1JgdX5l4Uob5XZXfpM?=
 =?us-ascii?Q?dCb0vin61jO0s6nPkk3FoBXYIKy6qej/GJxaz/6fU2040qeecEQd1L3qKeiP?=
 =?us-ascii?Q?q7KykpYz9JULgUx2yU2/FYylahU9O38Xq1BDVPanYnrsp6zU0aHbYDauyZEx?=
 =?us-ascii?Q?UgX6xbCV7wmMXyJoicnQpJraQxL2IOEqC0iyMXZPKqihz36XqbclO+WJN7Td?=
 =?us-ascii?Q?LOFBRlWWedGrlc+BhDerWNS72X6692SS99rvzEicqKLUwmE8DywNPsGL49ZA?=
 =?us-ascii?Q?MVW1cYlD16cupKGm1iPm9Ol3QCEfMYuqpWRLHbHAaMfVIuZ5L6/Y8QhbCc7l?=
 =?us-ascii?Q?IxAxg7DpU0Vneg86CZ5K9bIKeFnNFDmygs5IS6VsbpiArFKrSjq4Ft9se1GE?=
 =?us-ascii?Q?IJ4m7G719Jmj+HV+jXj3L2ErY4596Za4cJn17qQGYMTWyIvKGsDtzpkK0LrC?=
 =?us-ascii?Q?gaqJ0Ow+/XqmdpZc1aHD8iQNR2Rx2ax9o17S7xdTmR07OXOypSbmr4j1ox72?=
 =?us-ascii?Q?oN1NZFXrU9IfRnhXVlQ2YS6q4LMANqaGUQyXgd6+W4t0dHadNRYeuGHPoaxm?=
 =?us-ascii?Q?rnbXz2TXdD+RVecuPwKv/Op7HSNAe6H6m9LdjBU1yvGIB0yLPVlRjF8GBfVE?=
 =?us-ascii?Q?1FjEIzOQ9n5MO/eX5J07MdyrBs7sCMOXXA5DUaa5nCICq471Cg0Fyt+COGzp?=
 =?us-ascii?Q?J6ELRcioLhZ/QMl4O7LaeLcLoubUWeuwk7tbye2WfduydoVmac8MyeI+WBx1?=
 =?us-ascii?Q?/ydaSJwWlYSAbBv9B82oZ/7POTA595RmJNboWbJtpkPvmlMQpcREVJEZwBXi?=
 =?us-ascii?Q?WRnuR7COjE6e34bs3GrqJ3/n1tk4AXNG8Hthv08G2rbg2FKuVLFnOVkFnUly?=
 =?us-ascii?Q?CNUpx04tOHpjh+eoV04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AkQ3V0f097tqZyQ0T1/0y5M3JGnM5UFY3bdV1WETiuz8JCyFYcrOZHprZpxG?=
 =?us-ascii?Q?Fqgo1sDLsXLf5ewFYe+yd0mo2QV176HEqZbm2JhLwbSppq4rih2OXmHPOqFt?=
 =?us-ascii?Q?DerJJdE3oQbJn+eGZfgdpb20A81226vkcvxoB11FSEh4IgaWnQGrWYbh5Dmn?=
 =?us-ascii?Q?WhF13acSiobai2JgOOJVdacfCtDgPWUQ3Dcwe4DD5tLTmsq43lbyD8BxxgbN?=
 =?us-ascii?Q?9XS+xFyHB3xnYBYXbp4Oyf5ksOniBx5px6IAYBh8AWRqYdUSr5FS/x5hswau?=
 =?us-ascii?Q?LTcKix5tNOlpezoC8K2SpGDG5wxpDsCgxK0f61m8FOr+rfPnAowpToP6m9mO?=
 =?us-ascii?Q?Dqbb1aRkdQ5kr3i/Tce2UH3dlUtEZFOVnTArABqiXtVHyVqLfY19xhtDSs2P?=
 =?us-ascii?Q?biaNuHH7IgvSR1eoC7gDgjkrPtL6qcersJKco9A1qt/PzqvQNoreGGr+YPyT?=
 =?us-ascii?Q?1P3lfvlh9gQHt7eRPnpmaZfJB3Jb7Piuwbw4UywYbzoWcLZbeLCSPA6L+mlc?=
 =?us-ascii?Q?bQUh2cmZ6qMpIndNIjFODztQPf7L8JKyM5zXR6BKNh+Q0GgDR4/oQcLW/8r3?=
 =?us-ascii?Q?65+kcSJ5KmkMxORrxcxXlIJjASw3kFB3hMnqJwqNY0CbNR/D2P4e0VMFWG5D?=
 =?us-ascii?Q?eX7pkAlml86Q2juFm665dnS3okbVj3cI34pxE7cLDgKaqQdBN+whoxAkJAIL?=
 =?us-ascii?Q?6irDRXXj8jPwrkkUCVwFJW99JMHhvfc4+Rc5OhWfG5xophJn7+aUKJx+b6Yn?=
 =?us-ascii?Q?KbBSLOOExJqDVOCXlDkZeSywpvy6w9vVUYyh2Kru2f07RwSJJpqp79sIRkng?=
 =?us-ascii?Q?XImabem+LC6P6B595liPzPTeTy5+KZND+VRzhFx+npW5zgOybNrn56rxGHq/?=
 =?us-ascii?Q?wnWx3cRzS9YtduqRtyydqrLFcz2elc8Ue7wZSva2eUDSp1uOiIWe3fZi7ibL?=
 =?us-ascii?Q?SzvzBFVoBM5bGLOH0JNu2JHbNqMxvQkA1zktMJTwcAJfGDjmdWBxPbxDxd20?=
 =?us-ascii?Q?SeAveDgqg4S/+I7ZylyrFOzaOk2NAhNUAvHjTCynhAA8tU6ZhrYDshorYi1W?=
 =?us-ascii?Q?ro7FKgQMnFFkLoHxgXLkBXZKHwpxuIfoZN9gSAA5GRdMLHuSE/1iT9J4xXd6?=
 =?us-ascii?Q?pwOWJi+TMLHTfQ/JtvXCrmYA+SRp00vb/J5YOu9RBx+7QeLP52R1VIV+QOHq?=
 =?us-ascii?Q?gMqXzN6g4SnLz0vlJovrCnDkV/hUJni9E4XvPVuI8OSpZxI7LI/ZIgO4v1tq?=
 =?us-ascii?Q?RIYHjcA966Cns+ePQdbZE06U3+EZ4W8tSMKx1NdOn9tJH1O9n2YaWlV97f7u?=
 =?us-ascii?Q?AlsXrUZz5Y+iCFPm58NSBNsY3+vk3t1KfqwycRu68hnaV5ditzyaopS/YxyW?=
 =?us-ascii?Q?Py0d9pcE+VICkSRXIc1lzZmfRU0DIKioIc3DLt1I4iO8T7PciO7KuAvDo6R5?=
 =?us-ascii?Q?cBJaMdJJQN9qOd54+w49/qMy1YTN/hItxT2cRne0GXgwLwhYvaauV7xI9FZB?=
 =?us-ascii?Q?rhiyj5DO2UVREC2QQ8pxmkNH1y3NdbwA3zVZ4RIAm1DoKTM8Y4e0hFL/gdWU?=
 =?us-ascii?Q?QhmiXh5TsVhhLBdr8BbHED64EK387KzTsBEUfVlOZ1o4AqV5+8RadEiXoHi/?=
 =?us-ascii?Q?LoS9a3NIPnQU8jc2/pKpCOuN7BOeyfcPWe43DskTlriBc/jd8DPuo1otFx4W?=
 =?us-ascii?Q?mjwwIHFc5l+QAhK5YYB5O8l1T8kFQjxP0Odfciu4hELkjiw6HtQ53b7dr6Gq?=
 =?us-ascii?Q?FzQ7P0CqHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7527e2d-8bd6-4ec0-d425-08de5864a8c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:08.6721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR/9uL8NhI9y5WABCy+vrJGKE4sq0tp02jzT6wvYpiyMNOhaEdF9mvSMzY7Vvd9ukBJrX1d9Z07ntiGqGxMl4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 802D94B911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add common page table types shared between MMU v2 and v3. These types
are hardware-agnostic and used by both MMU versions.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs           |   1 +
 drivers/gpu/nova-core/mm/pagetable/mod.rs | 168 ++++++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/mod.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index b57016d453ce..6015fc8753bc 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod pagetable;
 pub(crate) mod pramin;
 
 use kernel::sizes::SZ_4K;
diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
new file mode 100644
index 000000000000..bb3a37cc6ca0
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Common page table types shared between MMU v2 and v3.
+//!
+//! This module provides foundational types used by both MMU versions:
+//! - Page table level hierarchy
+//! - Memory aperture types for PDEs and PTEs
+
+#![expect(dead_code)]
+
+use crate::gpu::Architecture;
+
+/// MMU version enumeration.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum MmuVersion {
+    /// MMU v2 for Turing/Ampere/Ada.
+    V2,
+    /// MMU v3 for Hopper and later.
+    V3,
+}
+
+impl From<Architecture> for MmuVersion {
+    fn from(arch: Architecture) -> Self {
+        match arch {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => Self::V2,
+            // In the future, uncomment:
+            // _ => Self::V3,
+        }
+    }
+}
+
+/// Page Table Level hierarchy for MMU v2/v3.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PageTableLevel {
+    /// Level 0 - Page Directory Base (root).
+    Pdb,
+    /// Level 1 - Intermediate page directory.
+    L1,
+    /// Level 2 - Intermediate page directory.
+    L2,
+    /// Level 3 - Dual PDE level (Big and Small Page Tables, 128-bit entries).
+    L3,
+    /// Level 4 - Page Table Entries, pointing directly to physical pages.
+    L4,
+}
+
+impl PageTableLevel {
+    /// Get the entry size in bytes for this level.
+    pub(crate) const fn entry_size(&self) -> usize {
+        match self {
+            Self::L3 => 16, // 128-bit dual PDE
+            _ => 8,         // 64-bit PDE/PTE
+        }
+    }
+
+    /// Number of entries per page table (512 for 4KB pages).
+    pub(crate) const ENTRIES_PER_TABLE: usize = 512;
+
+    /// Get the next level in the hierarchy.
+    pub(crate) const fn next(&self) -> Option<PageTableLevel> {
+        match self {
+            Self::Pdb => Some(Self::L1),
+            Self::L1 => Some(Self::L2),
+            Self::L2 => Some(Self::L3),
+            Self::L3 => Some(Self::L4),
+            Self::L4 => None,
+        }
+    }
+
+    /// Check if this is the PTE level.
+    pub(crate) const fn is_pte_level(&self) -> bool {
+        matches!(self, Self::L4)
+    }
+
+    /// Check if this level uses dual PDE (128-bit entries).
+    pub(crate) const fn is_dual_pde_level(&self) -> bool {
+        matches!(self, Self::L3)
+    }
+
+    /// Get all PDE levels (excluding PTE level) for walking.
+    pub(crate) const fn pde_levels() -> [PageTableLevel; 4] {
+        [Self::Pdb, Self::L1, Self::L2, Self::L3]
+    }
+
+    /// Get the level as a numeric index (0-4).
+    pub(crate) const fn as_index(&self) -> u64 {
+        match self {
+            Self::Pdb => 0,
+            Self::L1 => 1,
+            Self::L2 => 2,
+            Self::L3 => 3,
+            Self::L4 => 4,
+        }
+    }
+}
+
+/// Memory aperture for Page Table Entries (`PTE`s).
+///
+/// Determines which memory region the `PTE` points to.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePte {
+    /// Local video memory (VRAM).
+    #[default]
+    VideoMemory = 0,
+    /// Peer GPU's video memory.
+    PeerMemory = 1,
+    /// System memory with cache coherence.
+    SystemCoherent = 2,
+    /// System memory without cache coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePte {
+    fn from(val: u8) -> Self {
+        match val {
+            0 => Self::VideoMemory,
+            1 => Self::PeerMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::VideoMemory,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePte> for u8 {
+    fn from(val: AperturePte) -> Self {
+        val as u8
+    }
+}
+
+/// Memory aperture for Page Directory Entries (`PDE`s).
+///
+/// Note: For `PDE`s, `Invalid` (0) means the entry is not valid.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePde {
+    /// Invalid/unused entry.
+    #[default]
+    Invalid = 0,
+    /// Page table is in video memory.
+    VideoMemory = 1,
+    /// Page table is in system memory with coherence.
+    SystemCoherent = 2,
+    /// Page table is in system memory without coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePde {
+    fn from(val: u8) -> Self {
+        match val {
+            1 => Self::VideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::Invalid,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePde> for u8 {
+    fn from(val: AperturePde) -> Self {
+        val as u8
+    }
+}
-- 
2.34.1

