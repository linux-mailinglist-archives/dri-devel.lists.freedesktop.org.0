Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC+6E//Jm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9012171884
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA59410E1F6;
	Mon, 23 Feb 2026 03:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KjCd9Lz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2706910E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/bGXIN6AO0fG5xawGsw/s7N/8CUAJSM/erwCmvQgHs4dnM2rapYhZrPMB5szzPFuB1b6c1v+7zRlO8bSTLjVltg56rB63l2oeT5E8zpz3i0xTnb2aLM+08tB2dXIIkwBH4/+V/yYWE044L2itMnT0dU/LUcdODkVDBMxV9ZZP/SJxNVEhGf18nvvfNdmMeEIRgV//PsjpJbY7a58MQ67F1k5B4kZILe4g7Wbzvs5VM9DkgcUnZLT7VuVyLLiXGLbR81wXpaORT0BSJF0iqvwU3H1K6SqWvkn3GZaEhcr6lmN6RRaf+BE7LSptAPoE/QurERTR5ja3ivFUEkVdAl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiqZUszkMhv2m/s+eU2otU626QPlzAmX3nR8oNmAIEg=;
 b=JCU2nyF0MMW+66/fbV5Ik8XP57ggEQ8z2pZZcTX/Q75xmmqV+/aiTAMAMxYy6aIP17DlRfMzICMsXafDwMcmE6OIP9Lm4XYU650t7HLI7x12/qjO1JniX/2scp5DLrpZjHUAc1rnSY3qs+UpRssKMGQkaj4brOND+cP0QVSgyAbVrnD76UHL/CEJnLubewyY8QaAWxBiMNYjFhtz5/m3pcXWOXUptuRP5QuJ1mTbgm68WBpeWED3ArTF2I8XG5p6Ibz+49BnieHlKXXZjUZyanfPq1ZGk51HsfNGOxn9ohbK/hkEvdPg9SAEKP+XS+FBGxwByi6OoX/D/vIkRnYvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiqZUszkMhv2m/s+eU2otU626QPlzAmX3nR8oNmAIEg=;
 b=KjCd9Lz6krcO3+7piBzFdz5lT6E3vNTDKDiKDEeBrvmZonMGf1+xWC7YakNuMbSXIvIqg2JuL0y7DJexF150mAD2ATDUY8Ip9T0Xwx/lH4aBOhUJWeFbZDRbuWQiy0YS40ftuTEHZfb/RHROP4g9fCwjPHSqU3t+Y3Zy69d2nDfA/406ODLTjNqq5S5Kk7OGM/a4zbJeIkq8dEY1Y5GHRc8RP5a2vPXtIrzgwz+oS9qdv4Owa9k+qv5A5kkDh/e91YevSJkRR028mXRdq5IK9eLXZrw9V/k/YMNLPEEbHxd8m/Yo788FjtNPd+QN7CvCrcaBFMQ1IbsUdRpwHcInHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:31:01 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:01 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v1 03/11] drm/ttm: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:33 -0500
Message-ID: <20260223032641.1859381-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: be0f7b49-4690-4a0f-7da2-08de728bf79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?98+9d+5pUJJtwJ2rVADiC0AQf7ZqoeN/HEVrWRi2HlX20EnWEtXEIOkX70qk?=
 =?us-ascii?Q?6ED4wmodB7ON0WeNTcwELTv/UD4OfABrYo1gGtkQVxW5OLCXW00uJbD5dUIP?=
 =?us-ascii?Q?aUhn67gia6SedYEZfmPuHo4IiSDV7Zw5Wp32DBmIJZVeCB0LrTFh/siBE89a?=
 =?us-ascii?Q?rZtOqNuhOPsOHWIZTWydbcz7r2hNdgXeF2jhxAD/DqAmoXUTGdVZMSrr2qlg?=
 =?us-ascii?Q?tBUy0liaU1ixtY1HomdsP8nStLKE46nrMZkR7SNS8iCi616KyQca2dhCvpbl?=
 =?us-ascii?Q?i9wmSjGmX8H+EuncwjjJFRnCEWUdX/7IFfMrjFinpvjVEwEKKRJg6F22saub?=
 =?us-ascii?Q?P647mmJmji6V+hwrs6GRQRBGU1uNbdZU/pNtV984L0e/aMiuaOCLx2rKNNLb?=
 =?us-ascii?Q?Ky8rXCNTAqZz67jVhENyhovRezP/ONTwcTJ+ghuJHVSRMkCtZ1OH0cLg2KBl?=
 =?us-ascii?Q?HcYEd1HzV8Gs5AwfoaH40M8LFelwqV1R7c8riFauIeNSbpdgTEWCz5FabEY0?=
 =?us-ascii?Q?og6MRn4+E+DrV3txfHnjmA1XgEaI71kHdIQB5Dy7PojAq609FgoNlSZ1PWQD?=
 =?us-ascii?Q?PCsoNmXrldnX75aOopRcxPM1/ofA/4PQlDhtp1dEy2iOSv3VtB6hy2X+m7rq?=
 =?us-ascii?Q?6LbbkjzGr/sYXNcemB8JpyChrSbpEsYoyIh5pZDsuX3xh0J5P0m3FsB5TV+g?=
 =?us-ascii?Q?IyzNGlRow0nkhCq9aMUM4vbk6pAhu+imO57td3Fs2Mkaws44pzSmTTdn4lrP?=
 =?us-ascii?Q?FFkYEpG7cVFVMJB836nOluFDAtk4ahfWYPmCFODt1yCx+maBJP+9vOYp6ctY?=
 =?us-ascii?Q?XYAAz6kv64pa/8oNh6XtU0SUR/hQFwf+HMPN26CrvTsGNjXK248RJUy3jogU?=
 =?us-ascii?Q?SvMaHfMpQ7ydKcyZCUGm5sgGzSbenp5n5Xrk3giftWAsgr0w0P/9Vd4qMnAm?=
 =?us-ascii?Q?rlaH0bISqzSY4fyRAx+TsXru/6JWIizEcylV/4r3J86KPM2IrO7J+MZ44fpd?=
 =?us-ascii?Q?QK3YnQ4PMoAxFiEzyCGs90THzzOOODrn9C+LN7FC3DACxZ5fjPXPo+SJApse?=
 =?us-ascii?Q?B6/Z8sdLQk2QyD6/5SPgtNK295iV9h9573GA3FQZEdKEoMwb6+TqaunX9fnz?=
 =?us-ascii?Q?zLgeuW+cP7sWwo2p6qfIvI3ikUnT/4JeUizb17korLLzo8xYEeLvcwhsx9XS?=
 =?us-ascii?Q?/t3XlL0I6rYPOuLxm2SoQeV+dFFjblIbeS35015Bja8LFMg6Q63c6sKjunf9?=
 =?us-ascii?Q?Owu4UiMt9WQ6FC70YgYhi/m1MHyj/MqT+kw9rgh9Ms7p4W7oUHZCHmY4ne1p?=
 =?us-ascii?Q?n3F0yCaNWXdj7I8J/966yHIkNV9sF4eU5KyEhfFuu/tzLhLVtGe+7DBFXDis?=
 =?us-ascii?Q?WczxuPeAJf0scW3aHsAvUAXRQUvr/uViJ3EXj7tZGxYkJIjbMSj3DDa4IIzJ?=
 =?us-ascii?Q?j5anOHQ13NZ6OrxlhughSr7atInsD5wGNMBpJZPXgZPN7t69t70BXqJ48rhq?=
 =?us-ascii?Q?L//QNyF4OebjyT/fG8NO1aZ60TbkbJaXrrrO/c5CLjnzlShDGqHuAGzdGFjw?=
 =?us-ascii?Q?gdh/ITiDw/00iG+yZk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0DWtZpflmQvSCNz4PkG1KRwy57tsymZReLscQmGyCifs+DGBpD8jJmBvdez5?=
 =?us-ascii?Q?DNwZDONR47dsQ4pjBweNOgmN6vBf3LwkDy/EaAGazg2oO9zJPhNJXS7rjVTx?=
 =?us-ascii?Q?2v/nGEydJMLi8/pUy0xt9HP9zJlCfIBgR3k4tEZBPEgMe0jCDfx94upliZYh?=
 =?us-ascii?Q?4t5GHV+AxkpGv8q+F+vmAI715G7jJ5xCssOA99O6o9/GqCrhfN4Bm/Lhl4Ww?=
 =?us-ascii?Q?IqGbJDSwmtsvI1yPd4xfkB7M9QrIn6QZmfY6ZVkRzVCY8qOSao3uDKp5HweL?=
 =?us-ascii?Q?IhzTDCzX5AwVqNXlTPlzKG5iOMPVbLry2Lnx9aLwhkn7qNZsdqbJ1hFGDp/v?=
 =?us-ascii?Q?AZd1uIuZeI6d0pjSKb8H29zXcQ2h+LroPLUiRREN/anVzyZRNiYydqQdXGBJ?=
 =?us-ascii?Q?UopUPZ4n9GTZlS36zxn2zQWt/OSrau+VbkfyK82YpfEn2arUdy5xxMTXH6PM?=
 =?us-ascii?Q?EzoU+XC1LR6AoI0ajCvrpHHnE3caAilVYkY6R1tgC0YioAjd3HaG4zxxcR49?=
 =?us-ascii?Q?Q+T3NUGIlS5WRJLZbGFy3pVPRLmAvMhZ/EqZSXBC11awRw3MaXd+05oPXK0S?=
 =?us-ascii?Q?eNkZpEZT7xvzEzPBvmN2k/nHzwe5isFwZWyEuhxKMDjs/F5GKqNkForxZiOF?=
 =?us-ascii?Q?0VzznuTxXK061gdWBnDGKneCapufD2QnXUFmYwnBeT+kIDm80406/7DAKU2N?=
 =?us-ascii?Q?5IcChQJNRyXGfgvBZUgFRGPPgesisR8HRXCBJZweObLFZFRyk+8eW8OQb+jo?=
 =?us-ascii?Q?Q+9mjOs0sPTcHT2+tR+baWeGgkeOwG05oL6cfrIS36VR/lLqRI/DZx2qdLu1?=
 =?us-ascii?Q?klmPqbDevk3SHxc0pBn5lYNUv3y/EtKAAOnt5oyGceZdepASC4gIeMsXEprb?=
 =?us-ascii?Q?Ol5P6Wn4Zq972srX++NvMaD3dh/azXoZE8OSL7G6XGnSkmJzxnZBd5JeuhX/?=
 =?us-ascii?Q?oNcY77r+cqHVfcJCdcnwEvHxEalJbtIikazyLIuI/KRu0Orsveig8AJ1ACcd?=
 =?us-ascii?Q?a6Vs+17+DVzIo2upMFdKFUcta5Qga78cz3UnsxSIODFkQxn0d8ctKJqxkUy0?=
 =?us-ascii?Q?MnK+4a0y/uTyaI2ulu0c9rj8wo1k+0xZa7qka1ZpZIiUUCzdfkdSH2sWzOmT?=
 =?us-ascii?Q?sB7dZvcmgAfSor1ygZZLEY2ZSLa4ZturhyMTDkbbzCejtNJoQkeIwNAN5VVY?=
 =?us-ascii?Q?bnbgGOkZ7OssvgomJhKEqcWkeYuRkXzCW18J8BLvQC/XtBSajcbyeG/8+qTD?=
 =?us-ascii?Q?ETzLIulSuxCd6eZ9vTl9VTy8yj9VczNReWIoYRZ4zMb43k2V/Iy1vnqnVG4O?=
 =?us-ascii?Q?kzB7/r2PwSd0mcU6Uf+swlSpywWCjJmzabUGxKE+9WgKa52YQ+qPL2SbEYXb?=
 =?us-ascii?Q?2KLbMYN8qzRAtxZXaQIwIQINJIhJGu6yc3CQZDvEZRLT5LAXPi3C2909PLp9?=
 =?us-ascii?Q?PuK18m4lJ7eTdbDsvWMcTu3gR0JM7OK5lBmaSwRuNUJulk8pUutzDfj0xckO?=
 =?us-ascii?Q?T4XgiWRo75xsQny2DHmu3KUkb8pywUHezxrxgLOepXuXMregvnsBHzUd+s0b?=
 =?us-ascii?Q?AsMn3n5QFgAnMWAGZBzSl6jnYrO0Yd6Y8dlbydOhMryTmp33rH7rzErza6It?=
 =?us-ascii?Q?Ycl/rG1CUc2K1BxCrMQRqaeso7bCnDIWShmDNxcd7BfMMUUwQDD681O0HhzD?=
 =?us-ascii?Q?w7m2gO07K/Bny1E9nBBeR4njF+STYhwvpeiB1YUQRSTa0kwa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0f7b49-4690-4a0f-7da2-08de728bf79f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:01.4684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak8zn+XgnApoNvHz5DXGRGWcXpJADzEox2R1LsCRUN0Kh6EN0TZozbj/2Pu+TNB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,nvidia.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,intel.com:email,ffwll.ch:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: B9012171884
X-Rspamd-Action: no action

This prepares upcoming checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ttm/ttm_pool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 217e45958099..a85cf1582dc8 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -210,6 +210,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 #endif
 
 	if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
+		set_page_private(p, 0);
 		__free_pages(p, order);
 		return;
 	}
-- 
2.51.0

