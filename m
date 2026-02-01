Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JHZFK1kf2lSpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E607EC62D5
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5453610E0D2;
	Sun,  1 Feb 2026 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nXr2bkhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30B10E0D2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/nNBUzpPFv0u7tRVK//sStMzy+3CN0MrqwuVyQkffaC1Fhx/2BMmv1gN3zGB+5SzkE/Q1eJBKc6oItZLj5r8ZUMvapV9w1eRUG2vyK42BtKSOBaPDcTdjYZHvoieED/UjqEr+pSWK4rxwp8hY/EUbAmreRQ5BokCIhrL/7v7lW8WpQa/nIhpIeW0wlcs4OrJVPJEmzwSFvk2C2hpnvbaTr18YxwK07r5wxpOi4yCknCOGJMzwshuOXe6i9MKEZFyVUCzudthUhYohj0d+Y/RLQEslk3xXWIenNPKWob11IOJ6QRsQ0lRQQ54Z6rJBXB3/0cEhso9pcPKVD4BqlqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0J1+5GnHz5hxiQYAV9NW/fcGEDb3qMf5AolhgVWvcM=;
 b=awqsxqJz1AiuI5XBuNrAWntqDAuI/vQAeknmr93s1uSkVX545yeb6bNflgpEEDk78euL0l+IcoXcMFulJn9nNsh518YW0Cu2jYv86mMSB72ZzAEbTDmJ4RfJM7WKPKbm5dw4S/r5boPol3CT3dbgOuXg9l7vlWIoYxcGzwSXvcT2QEaDWWmfuHd5oQ1Y/YRpfwTTNk7dHozJS78eR7iiNBcAkkb7lOPQ3hiOEXAFbfeoCu7oZu7EWBxDWJzyLqQYiT6Uz2ybnBZwgkYiawofBbHoaA3eyry8Y745HK6kc9qdUJSIVglqi274CtNhDwsA8Lqgns7nAsJvYZnS+s4a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0J1+5GnHz5hxiQYAV9NW/fcGEDb3qMf5AolhgVWvcM=;
 b=nXr2bkhHip9y1CmSr/bzOsjhBskXxJUOJVjx6C/UaJKoLTlWpjMSTrFzlF7ErG5/A8gAzpGCLjfrG8QPmuUf9yNrJVq4aSW2jsyK0ge2zc93QbCL+bor3+jHcMiydUYGCzD6m9TDUkCQB0CvLL+zKhqLiTWW3k+uhByoKv3W4QK0la2febTg+U3PXp2SQUDBlg1ul6cAARao92PLmAsBhrvSn/3zS56v0oY0XjOtQVEyVnImr6FCv+qYmb7QC+nEGkFmr7pp1dSy37D3iQqSxG+nO8x1Vw6iAf5skLVIimvLcXtRezYxpXBydGzA+gfoaShxMlTT1lnu7YEZCpHUxw==
Received: from BL1PR13CA0253.namprd13.prod.outlook.com (2603:10b6:208:2ba::18)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Sun, 1 Feb
 2026 14:35:11 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:2ba:cafe::4b) by BL1PR13CA0253.outlook.office365.com
 (2603:10b6:208:2ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.9 via Frontend Transport; Sun, 1
 Feb 2026 14:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Sun, 1 Feb 2026 14:35:11 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:34:56 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:34:55 -0800
Received: from c-237-169-180-181.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Sun, 1 Feb 2026 06:34:52 -0800
From: Edward Srouji <edwards@nvidia.com>
Subject: [PATCH rdma-next v3 0/3] RDMA: Add support for exporting dma-buf
 file descriptors
Date: Sun, 1 Feb 2026 16:34:03 +0200
Message-ID: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtkf2kC/3WNyw6CMBREf8XctTV9AFZX/odxAb1F7oKWtNhgC
 P9u7UpNXE5mzpkVog1kI5x3KwSbKJJ3Oaj9DszQurtlhDmD5LLhgmuGY9s9emaXyYeZcaxPmtc
 aUVjIzBRsT0vxXSHkLXN2meGWq4Hi7MOzPCVRBn+kSTDOGqyOWDW15qguLhFSezB+LKokP3Apf
 nH5xpUWQqvOGIVf+LZtLzvnndr1AAAA
X-Change-ID: 20260108-dmabuf-export-0d598058dd1e
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769956492; l=3699;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=fa3FoI6ozulVLFuIZLH6OJmyvh41t1jxQpwgpx5gjf8=;
 b=YW1CVDoU/FpD4SC5Lh+MWYPpKDGEOUoklWpqxfOudC8GES15XIPhXEidTr7r7gxxH0b+os/Iz
 wjy24zSE/UJAEC2ICcTwZ/R5VfNVgDaUHN7w/2tGJfpZMzFF0PW23dm
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: 4552810c-2882-43b1-0ee5-08de619f1b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djZHdFhzNkhTVk5ubVBqaG9OUVB4MGdtOEhQMkhtT0hjMlVyZlVOQXFyYnZ1?=
 =?utf-8?B?eGc3M2psek1aVitnZ0lmbDE5RTkvTkloMkRTL1kzSFhTR3R6dWpDUXdIUjZ6?=
 =?utf-8?B?Znp5NXNnR01aL3lpSk1ZQSsvZFBIT2NOemdSVDNxSS9aMEx6WjNjaG5JTGxu?=
 =?utf-8?B?VWFpUXVVSFZHQTEwczJ6WnNtQVFxdFdTMXgxWmJWQnJpWk9McnZVcm14d05Y?=
 =?utf-8?B?cC82QWNadG9vNWR1dWlXWm1CeldRdE1KVm5MbVRqaEJUbE1QT2ZOak02ZW1r?=
 =?utf-8?B?b3hSTDJaR1hDWHNtV21TaEtSV3BtTWJYb2dsQU1HVWlpMngyRDE3ZlJ3RGRI?=
 =?utf-8?B?RDFpa0hGd2hjV2tKTEJ4RzJIdXNKck85eEJwNnFhdnoySzNFZ1Bsc09GZEp3?=
 =?utf-8?B?eElMRGI5YUU4NklxbHFXUmJxMWdiQXc4WThwQVp4am9UZk5UVStwTVhqWmxq?=
 =?utf-8?B?c2R1czBpNFgwMGR4SmVaUFlJZnVxeFVCQ2c0dG81eUVycWdodTF6MWN2UXQr?=
 =?utf-8?B?ZmFtUkEwTGlJa1lVSkI0c3FDdUFqWVcybUREMjVHMml1cHhvVnlrbXZaamtN?=
 =?utf-8?B?TjBSc295cjEzSnBuTk5HMmg0ZjBWeW1lS1J1TlRkNEJpc2poSTMzMDZJVmQz?=
 =?utf-8?B?UFRCWUFhbVd2RXFnLzh3d3A1U3h4L3F3MEZNQzJSSk1uVllTMmRKM1JYZHJK?=
 =?utf-8?B?VWI2OTNweDdqU1dReGQ0ZCtTblk3OHk2Q3FaOExyMk5BbThGdXZyYVA1ZW5I?=
 =?utf-8?B?Z1dKTG9BazQ5VUUvTVdIelhFQ2grMFJCeVB0YVZmYmoydC8yZ0prWDE3MVVu?=
 =?utf-8?B?YlZGZHNRN09NQU1wbTM2SjIzMVlJaHlPaC9seGthcHI0NWF3VXpyUWwrR0dW?=
 =?utf-8?B?SW9tNzM2TWsyM1RDV1B5UlM3Zy95YlFwbS9EcGFESW5yWXJPVWxmRk5lZUl4?=
 =?utf-8?B?Q0pOVlBMQnZic0tndCtRMzJPKzlBeFhsdWEzcnNod3FaQlNxREFvVWJRWEky?=
 =?utf-8?B?dzVxTk91WXE3Y1BIVUhVNzhyNGN0QnN1ZW9nRE43bkprMkx5azVIM2EzRUw2?=
 =?utf-8?B?SVFJWGpiSjZHaWh1K3JPMHFna3N5TTNPVTNQQTY2Y1ZWRXF5VXQ0UGhuSE1a?=
 =?utf-8?B?VGR4VW1VK0hKeERBdStwS0liY0tZNkJEdUpOMjNxY01pc0dSU3JTU0ZHSHRN?=
 =?utf-8?B?Mmwzd2d3ZjJ4aVhFcXo4eWdya053RHRLQjZWaitIbW84TFNSeUhWaDVEVCti?=
 =?utf-8?B?Q21waldpMkVJVUhPZWZxUE85TCtZdnI5cmRlamZEUlNyaTdyYXFVQ2VYQW1I?=
 =?utf-8?B?UFpERzM2YWVYRHo0UFJ1T0VQTUs3b1R2T0FoUG1MUWJzWTBZeUFMMVgweDI0?=
 =?utf-8?B?QTk0dmdsZythdE5oM2p5RG9MNUprOWJwNkNWc2JtSlR5TUNhZEVLNDBvZFN4?=
 =?utf-8?B?RVhpYWh0U2NLVVNRa1ZDNUw4cktmOTFNb3ZiV20vMTlJZmJXSTZOOHJYNUxK?=
 =?utf-8?B?Vno2SjZobXBCV1U0c3VvUmZYUys2ejNDYjZsU3c5Z2lqdWFlUkRiK2xtMWEv?=
 =?utf-8?B?RGVsQ0hKekRCTzlnMjQ0UmkxUjJKaU93ajFEWHI2L3dmNnc0NThmclhkUnpp?=
 =?utf-8?B?b2k0c2l4MmFTQ1N5U3hHbjZJQ3Z6NEgwSG9iODVsdkxZeXZ5Z0l0b29sK2U4?=
 =?utf-8?B?aE9nMW9ONytiTmVNWkVPWWg1QkFLZlRmeTBSV2pMRllnUzRlbks5VFIzSUhQ?=
 =?utf-8?B?dkRSVG9RYlRmWWptdWY0Z1AyVnlneWVJZGF4RjBpU2lNRGlibG5IMVZYRlZ0?=
 =?utf-8?B?aWlZRDF1QVNLNU9IOGU2cllZRGxpSDUxLzRYUUJRM2E4VXNjak5MK0QrZGJX?=
 =?utf-8?B?K2FKNVVORW1RNnh1RnhtaVdrbXdMUUxvYjBuQlhEaFJpZ3lweHBySVhLSGpj?=
 =?utf-8?B?THBpRFVrU09mOE9hRmdhdEtXQkxJUlNycXRscUZqMkFtdkI4cmwrQ0FPTGxP?=
 =?utf-8?B?VzZjNklnRzBsL29pZS90bDNON1ZjWUJkUGZWdUpYelUyS3hHQ20rZjlON1BT?=
 =?utf-8?B?SGpQSWpLTUZvOFRTUC9DTVMzZHV4N29udVVMRmQxajVTcnNIMnRFRm5zS1BV?=
 =?utf-8?B?aFhKZFIwVFlwVDg3QnpBWGFwcEtLMFFETlNyREZWNXgreUJnSGVOSFBIY1N0?=
 =?utf-8?B?QVlJS1FRUXJOZHZQRDRHaHFFbHlPSEd2azlXaVlRWEw5Q1hCRnJWZ1g1dTRP?=
 =?utf-8?B?eWE4enA2eEM2M0syVGJGVUtjMGlnPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ESXffWIPa8QE0xPhn/8Ocpnh3W4sB+2SHLrb1npZ/fZA5PAi2kJc9O1kkw64XM+QCKucMlm1xKZSE1Wnvxc8AfhKzM5eDVdXrKKunaUchlUJjGcmImxhKXMQDXHEbiZxnb/0A+91F3kIJYbJZ2ntWpG6iM+K+GLDNGtoFZpIbs8wqCxmhQMNXK4BEbRr4HZWPvnjshgKdXd9PyfOn3xz1+OZDovEqbFzjywtLH8X+9/ySpoiR8wHADEPXgdSh6LCli0/curWxFJAoP6aOXnULp95Le4caQJa8yvXryM0ea5T3wyI/ddipbPxSPMWf/Noo54mKrNH7x3cTlz4TRk2/spmkQKmu2JqERA4FzZ1atnsjXHZt/iz2wqnT+jq/GAzOvF4sja3yvEbDUagQxmD6ii/+JwBkCjcR6o6O6m+FQRCMvme0i5gAry+3nfF1Jve
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 14:35:11.6325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4552810c-2882-43b1-0ee5-08de619f1b41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,m:edwards@nvidia.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E607EC62D5
X-Rspamd-Action: no action

This patch series introduces dma-buf export support for RDMA/InfiniBand
devices, enabling userspace applications to export RDMA PCI-backed
memory regions (such as device memory or mlx5 UAR pages) as dma-buf file
descriptors.

This allows PCI device memory to be shared with other kernel subsystems
(e.g., graphics or media) or between userspace processes, via the 
standard dma-buf interface, avoiding unnecessary copies and enabling
efficient peer-to-peer (P2P) DMA transfers. See [1] for background on
dma-buf.

As part of this series, we introduce a new uverbs object of type FD for 
dma-buf export, along with the corresponding APIs for allocation and 
teardown. This object encapsulates all attributes required to export a
dma-buf.

The implementation enforces P2P-only mappings and properly manages
resource lifecycle, including:
- Cleanup during driver removal or RDMA context destruction.
- Revocation via dma_buf_move_notify() when the underlying mmap entries
  are removed.
- Refactors common cleanup logic for reuse across FD uobject types.

The infrastructure is generic within uverbs, allowing individual drivers
to easily integrate and supply their vendor-specific implementation.

The mlx5 driver is the first consumer of this new API, providing:
- Initialization of PCI peer-to-peer DMA support.
- mlx5-specific implementations of the mmap_get_pfns and 
  pgoff_to_mmap_entry device operations required for dma-buf export.

[1] https://docs.kernel.org/driver-api/dma-buf.html

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
Changes in v3:
- Wait for importers to complete their unmap() calls after
  dma_buf_move_notify(), ensuring all mappings are properly cleaned up
  before revocation
- Add unpin callback to pair with pin (both are required by dma-buf ops)
- Link to v2: https://lore.kernel.org/r/20260121-dmabuf-export-v2-0-6381183bcc3d@nvidia.com

Changes in v2:
- Split the FD uobject refactoring into a separate patch
  ("RDMA: Add support for exporting dma-buf file descriptors")
- Remove redundant revoked check from attach callback. It is checked
  during map
- Add pin callback that returns -EOPNOTSUPP to explicitly refuse pinned
  importers
- Wait for pending fences after dma_buf_move_notify() using
  dma_resv_wait_timeout() to ensure hardware has completed all in-flight
  operations before proceeding
- Link to v1: https://lore.kernel.org/r/20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com

---
Yishai Hadas (3):
      RDMA/uverbs: Support external FD uobjects
      RDMA/uverbs: Add DMABUF object type and operations
      RDMA/mlx5: Implement DMABUF export ops

 drivers/infiniband/core/Makefile                  |   1 +
 drivers/infiniband/core/device.c                  |   2 +
 drivers/infiniband/core/ib_core_uverbs.c          |  24 +++
 drivers/infiniband/core/rdma_core.c               |  63 ++++---
 drivers/infiniband/core/rdma_core.h               |   1 +
 drivers/infiniband/core/uverbs.h                  |  21 +++
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 200 ++++++++++++++++++++++
 drivers/infiniband/core/uverbs_uapi.c             |   1 +
 drivers/infiniband/hw/mlx5/main.c                 |  72 ++++++++
 include/rdma/ib_verbs.h                           |   9 +
 include/rdma/uverbs_types.h                       |   1 +
 include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
 12 files changed, 379 insertions(+), 26 deletions(-)
---
base-commit: 325e3b5431ddd27c5f93156b36838a351e3b2f72
change-id: 20260108-dmabuf-export-0d598058dd1e

Best regards,
-- 
Edward Srouji <edwards@nvidia.com>

