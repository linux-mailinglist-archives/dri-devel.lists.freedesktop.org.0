Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FD94F236
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 17:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDF110E18A;
	Mon, 12 Aug 2024 15:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yaqF0QPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1525C10E118
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4NjriRQNm3tbhZEJLxJS3N+5I9Wqirp4oteYPOTV20kDsN/uRN01z7EB55fz3SJUAl1U+Br8KxfGg8ipxQjNnKMIeAvDqZzGl38DWZ4seg0ZGaiSata5f3pwqWXvBUIxKK1yqgaFDy4TkfulZY60tWqgFnYwuOOJXh9Z790dvAR2WU1kW6URKuXdWnnPkumOet6gZvfKkukKrets77gcHtT6X6a5RX6LbNATCQcFiWvL3ychnM4p8NxEV6PFixlLfMNxCK5VsrVsJrsLf3DhRLVig7/kC4X0aNdAp8YOJxb9DqsjKAgWxf/qXq8VMwoEvdDiBHggzdY65HbWlqDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reOERmpLpRENX7zVeYBfiwAFPaHv3Qg3n6yDk/YuQ8o=;
 b=RixWvq+cavtDKpsHziIbWxU3hrHi054e9bfxPnvRiInK5bjhtsY+h/Tpd82pSUKcKCy+Pk+YOBKuxubs2yYckEy3CQ/P4WqzvYxHmVs0X+lC16XNx5jyEhYmlADwv1EK1eIl7xOHQ5+fFjk4pxqC+OrrJLK/aiD6OjBgEEfWgdlpfOToOYygyqj4RfXOpy3HSgyKpJpWRZMfD7sL6csHebpJPFO6L0l9BjRfNSj/rdXrET3yV04qgQzl06i8pWre1hDgmOm6EhOFWEuN77USEfBAN0KXRvNWrBNAtpbRxHBvgFfBjojzRe5OdIZJ0i2AQN+Ii2f5ETGPVXeJjH1KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reOERmpLpRENX7zVeYBfiwAFPaHv3Qg3n6yDk/YuQ8o=;
 b=yaqF0QPWTrhHS3sQcorueanQx8fcdrokTNt71/uM+62WpWoyS5U4MCUuBvKen/lFlYogoi+I/Wg9CZaWbrtgkDHThibhifnRVMhAj0PDEziewTI2zi9PtUcxMdop5SxqzdBz0vDoZoLkkeola+loUcg3LaxVKuKRJzNFmSrB4zs=
Received: from SA0PR11CA0119.namprd11.prod.outlook.com (2603:10b6:806:d1::34)
 by SA3PR12MB8437.namprd12.prod.outlook.com (2603:10b6:806:2f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 15:58:12 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::8f) by SA0PR11CA0119.outlook.office365.com
 (2603:10b6:806:d1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 12 Aug 2024 15:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 15:58:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 10:58:10 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 10:58:09 -0500
Message-ID: <f76e4427-bb7b-747a-fd5a-21ca9e388d4a@amd.com>
Date: Mon, 12 Aug 2024 08:58:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Carl Vanderlip <quic_carlv@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
 <9f017342-b686-4ba0-bb0a-6912b051c152@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <9f017342-b686-4ba0-bb0a-6912b051c152@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SA3PR12MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9ac476-00d9-4fc5-b295-08dcbae79101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEpEWjhCczI4S3d1SzJ3Tlc2OTB3Vkp1UU5PczY3emxVUVFTNHpaVE0wWGlT?=
 =?utf-8?B?cnBGOEowdisxckIrclhJL1RLa0FXbVRnNVpnbkFjVmZMY1pxQXVKeFZTSUlD?=
 =?utf-8?B?QXdCRmh5aytJMDJoTkFqS3hkcko3S1M5WncybzNTaXNqQzgvbFhFcm1YRFUv?=
 =?utf-8?B?ZzlBWkc4ZnYyaGZsaTBnQnRJWVNTY0tiaGdIc3NRWGVQeFp6b2gzZkVsVS9I?=
 =?utf-8?B?clQ3aTNkL0JMcVRUYi9NL2V6VVhwT25INGx6enBCeDNsVTlLN2lxVEdZSUtV?=
 =?utf-8?B?Ulh4WHhid3UwbUhremNnVDVxSTZ0ZS9odkg4OWtYYXpDWkNSR25oRHI2QkZt?=
 =?utf-8?B?VjRVMlpJTGVvcTAvejJPL0JSK0hha2pTQXF3Y3FldXllSEZ4QWY2Wkp5UTJN?=
 =?utf-8?B?QjdGa2tJSWIreVlwVEcyZVQxQWxoMWpnNG5reEYzalJtZDROVENFYUs4ZHFy?=
 =?utf-8?B?ZUJlVEd0djc2Qyt6MG1qN3Z0d1B2c3V0eWJ0SXI1Y2orRjJRNkl6M05kZ1Y2?=
 =?utf-8?B?SnpVY3RqQ3NlRDIzbkNpOGEySm41a3hKM2piYXhuR3ZkU3k5eEhBbUxpRWlx?=
 =?utf-8?B?MFJGS0orVVMxOXczOWpCWGtXbHFBQmppR0R6TXRuelhtNXFnRlFySnFCMmNX?=
 =?utf-8?B?RXYrWUlGNlZYMlNISFBzQ2JmcTZGTjhkN1QrSS94Vk1vaHlxY1Y0SE9LOUwx?=
 =?utf-8?B?M2F2cHpaSnVGazdyZVhTZ3FqRzFCUXV3ZmNJRTdMUVp1ZnlydndwakUyNmRt?=
 =?utf-8?B?Z3BRbWIyVjh4TEovOXBPRTlTK2pJRkcwcm9NWDhWVTlpaEdHWi9CT0s1dGlx?=
 =?utf-8?B?T3VGd3BIOEdHTXRyRXhFdnRaMklEcmhnanRGaTA0ZGpqNGo4RUdKRlFjV3RV?=
 =?utf-8?B?MzlocGlLUGJUc3JMdlQ4WGhZQW9HREZyUjArd3R6L1d3S2o3WElJejlyeTJ0?=
 =?utf-8?B?S3p6dFdPc3g3TldsYUJHdkoyUEYrNFpJSmFEQ1ZlNjU2a3BBNGhYeXFtbDZh?=
 =?utf-8?B?ZVhqNVNyNTBCQ0sxVHhJMmhMM0E3ckFKQ2dteGJlOFNsOHF5ZEIwUXRkQnVx?=
 =?utf-8?B?QnF6VGZXdEpRTGRTdUlkRm0wdFlDdUIyN2RlaEV5dWZhR25iQVpGVGQ3bzg4?=
 =?utf-8?B?cnZscDJJUTBYL1M4UmhmOGlsekdtTXJOWCtvbUdUdDJCc2NIWXgwQU0yaWtk?=
 =?utf-8?B?VzRNQW5uL0xYUUg1WXUrNURDSjVhajZ6ZmtqT0lzZmt3amMyWmpBT2oxeWZz?=
 =?utf-8?B?ZlEwUTVCd1NpanEwZEludUJiV2F0STJ5Ujh2WGxHNGRiUUQzcDJBeVZZN2ZL?=
 =?utf-8?B?VFozV1FLM2R1RmxQUzV4WFZBMytMZHRJWGNkaW5lV00yMjBqdlVSS1VHenE2?=
 =?utf-8?B?WDg0by9QNEwvWCtqbjlST1JGMi9mRHRjbzVpVWlUaVFJUllCZjlsRjQ2cnlr?=
 =?utf-8?B?cEVUUzNPWDZrOTF4NldpUFVNVitkeXh5Y2FBd29XVGJLYkpkUUNHY2xiMWoy?=
 =?utf-8?B?TGF0aTgwcnRnMnZiZUdKekROY1orMTdFbTZHdDJjVW8rMTRoUFlyem0wa0lq?=
 =?utf-8?B?SnF5Wk5LdVQ4bk80TTlUZkJ2bTVvbVAxRjVJUXU0WEJJdHdub2gweWFNeCtI?=
 =?utf-8?B?TytPQStSUExFRy9BWjh5d09mTHBWWkdOb3A2QUU3aXRRMHdaQTJyRXZqb1B6?=
 =?utf-8?B?U0R2TVJTRENFclhFL056b3R0VkswNWx2OExhUnlSQ0hNZmUxVC9WdkxScVJt?=
 =?utf-8?B?YTJQOXFTb3pBc0dqV01IWmE5eVFJZUJWZnU1b2FLYWxpOFlDZXVrTVVFenps?=
 =?utf-8?B?bWhNWlR1ZE01WG9tVS9SRjBQS203c216b3dlYWRVVjFqZlQ4aS9XZ3JmVTJw?=
 =?utf-8?B?TFA0dU5tSEFBWUFmOTBFMUhMWGdLdWhiVTNrSVpLYlFtWGZxcC9ZSkx4Q2NE?=
 =?utf-8?Q?48lEqPSPBPAwd2sutn+3GvsBsaPGK61G?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 15:58:11.2005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9ac476-00d9-4fc5-b295-08dcbae79101
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8437
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


On 8/9/24 08:24, Carl Vanderlip wrote:
> On 8/5/2024 10:39 AM, Lizhi Hou wrote:
> > +static int aie2_init(struct amdxdna_dev *xdna)
> > +{
> > +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> > +    struct amdxdna_dev_hdl *ndev;
> > +    struct psp_config psp_conf;
> > +    const struct firmware *fw;
> > +    void __iomem * const *tbl;
> > +    int i, bars, nvec, ret;
> > +
> > +    ndev = devm_kzalloc(&pdev->dev, sizeof(*ndev), GFP_KERNEL);
> > +    if (!ndev)
> > +        return -ENOMEM;
> > +
> > +    ndev->priv = xdna->dev_info->dev_priv;
> > +    ndev->xdna = xdna;
> > +
> > +    ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
> > +    if (ret) {
> > +        XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
> > +             ndev->priv->fw_path, ret);
> > +        return ret;
> > +    }
> > +
> > +    ret = pcim_enable_device(pdev);
>
>
> Does request_firmware need to be the first thing here? Its not used 
> until the end of init. Likewise, fw image is copied in *_create, but 
> then not released until after *_hw_start; could release_firmware more 
> closely wrap where it is used? I could see it being checked first 
> because if the fw isn't there, what's the point, but that could be 
> said about any of the other resources here.
request_firmware() will failed if user forget to install the firmware 
package. Other initialization calls (e.g. enable device, etc) are very 
unlikely to happen.  That is why request_firmware() is checked first. 
This will only hold the memory before the function exits. I think it is 
very short period and should be ok.
>
> On 8/5/2024 10:39 AM, Lizhi Hou wrote:
> > +enum aie2_smu_reg_idx {
> > +    SMU_CMD_REG = 0,
> > +    SMU_ARG_REG,
> > +    SMU_INTR_REG,
> > +    SMU_RESP_REG,
> > +    SMU_OUT_REG,
> > +    SMU_MAX_REGS /* Kepp this at the end */
> > +};
>
> *Keep

Thanks. I will fix this.


Lizhi

>
>
> -Carl V.
>
> PS Sorry for double email Lizhi, forgot to send to list.
