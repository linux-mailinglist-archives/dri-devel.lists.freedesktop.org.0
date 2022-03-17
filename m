Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50F4DCDFB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 19:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC3610E5A2;
	Thu, 17 Mar 2022 18:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7992D10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 18:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4cK2RrveqjSenU1lLYOaT0LV6gnvgmih1+wbAjd0UJoiZHpb0+nPaAdrP1jyEpbjU1/49vKpuT2Zr7AxQV7ZL2cU8btqY2Wd86wbsSd5YIdxyvQloiVQBqJQEk2JzH5qr85NTuTVWaQR51z6pWIoUQxfh99YaOKqxwLVGtoHUTe248fV7wWjcrvbNGQkQ8kXwGQUQBDzkYdyQOUPYBfeTuBb+uvbTqBuHL4OVLQ3iiY/v5mm9ADjQ8MmhgOr4/X2zTGkGSTcQdIAxfh3z+Gom89e7TxIEySJKIIOLLDJjL7rCOr9sO+l8SVnjLc2lUK7qh+9J1Ckuyf1AvssE939w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHO8cyg/STkfY0iTaST2RxqksiDPGiIciCpFdntgzeA=;
 b=DLsi6QHTNZTUp8UJEXhUtFnnZq/srM2FoQTP2OIhsiwPUVhhJJ3YGyJ9jO8qmS0fVOvHhgdVH9+5zRVEYPhH5I1ehSIocf2NZ55tc3TlhXCDB8Hs4rO3eDUC0S5EEXsup8noxfg/R+MEu34nZX8JZGSIcMMeE+39fabz1tLd0fU564J7W2+tPepYpe2c5i2QVpZA0Ab7AQICUXGJ3frM4woVpw4dmcg9RUD5/AQG0BF6YungWRw+d1e1PrmW6W+I7ab1Br5bwTf/bF4obNMSZ4rkJDI7/HIUHQJsucS+zKxZIfKvCyRM8i0vjdF9Ti2KxG7AXrbSZ5qVaoc/7tuONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=protonmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHO8cyg/STkfY0iTaST2RxqksiDPGiIciCpFdntgzeA=;
 b=tHtKmfKpzuFP4ELtjFxLOeS2sxWfBmrPhdMX+msg53xA/R83CxQqx2l7Q7ynUNKsLywtHVHmoNs6w3E384mYDudAQNi7vNcztm21JYX2siRc6RAhOEfx/r+n9pubi5VoROKc3VyFd7kl0g/QXk+J5+bFtE1xmuLNACnwdKpxJ/0PkHltU8/tW5jDhb8H4IzYUqIoED9Qdf5CR41qX7kM7zVyONJ+EtumPNcWLzZ+tGV5ps16wZcUWz+ff8pCTNHjXs+lzEx8PHdmvHE4SAPFfe1vpeHUI0ul3EWTf70l59BtHgcbwRh5vnjUJ1+5WmB4NmK8IXTfwQCsVqyk0nb54A==
Received: from DM3PR08CA0022.namprd08.prod.outlook.com (2603:10b6:0:52::32) by
 MWHPR1201MB0221.namprd12.prod.outlook.com (2603:10b6:301:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 18:51:14 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::ff) by DM3PR08CA0022.outlook.office365.com
 (2603:10b6:0:52::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13 via Frontend
 Transport; Thu, 17 Mar 2022 18:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 18:51:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 17 Mar 2022 18:50:31 +0000
Received: from [10.20.113.98] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 17 Mar
 2022 11:50:28 -0700
Message-ID: <4bbde905-e89d-d8ba-01bb-f478fee2e417@nvidia.com>
Date: Thu, 17 Mar 2022 13:50:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Hans de Goede <hdegoede@redhat.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
 <100e0cb5-98c4-cdd9-cfc7-4b76edef8950@redhat.com>
 <D7458E1F-6F4F-48E6-B100-B4B9B1226BCF@nvidia.com>
 <5cbec4f6-4f77-0381-4f19-bb4af273db6f@redhat.com>
 <CADnq5_M3620a5tqqOMARZMG+zJYWKu_dN_F5g-KR0H=t2_qoSQ@mail.gmail.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <CADnq5_M3620a5tqqOMARZMG+zJYWKu_dN_F5g-KR0H=t2_qoSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85d6a0c8-96e1-4bfe-06a7-08da08471cf8
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0221:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0221A3986F81F2A45E4EC29EBC129@MWHPR1201MB0221.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZv8+cZn3FRBP1cvMANTaARNOr6HgdbeRZQEJelRJsJ5j0jQMhdHDwdYfgww/r5nnVShutB3y2IuRaf+hLj+lk26dWGm+2k5ZTum3X6wzF7Nof5xTE5gzdyy6yVbuL50HRtOkoTXBEpnwVZtzknuvtLr5euZlZ3fsCmrTgyJ2Te3s2F5vFuzzLBJeyNjs/34oWn+SK0hiWX+QOzneWjbwxMqVM6PO1WC9JU6KspVnzTRZ4fms8vbTZHdZ3EkUf3XIVdjsDubaHBt2Mxi72JzOzQu9f48w1yCkEJjJnY6kE26JZ1Yh7vcg7MEzr7gb2auVOCZF2OYA8IUMh8EmSsRtLsEvzu3S8/fmAvmneKLNV7atl2qdYZd+dFSw5GNpGciFxzq6XIP47/JAZ1hTF068uugdWCob5+I/nfJnrAuV0y/vCXe89GVH0TvpcDJ6mkCLCbKJkCvxBvxHizZ9qdvq5PDjzlcqh8oUFsJQXPowN8PfwqMdV6r5uaeyshUP2qwesSlq4oQqjYAp3VRkPP6F65apo9DmfVXMhXx1hj+sLmGsYmoLLp8hPalf+l2qcdhVrHQ/4VvfRQY3HGKZtR2Pe8wePrAc0WaYlGGKL/xHK8fMxv8XBT1TzMelG2JKqrI4vvOgoiHcDgg4UvhjF1Cv345k+gJXsg9QBMKmqVUlhTGUTGlRMv72flAwKP8G1eZdpUT7GnajPsQSGsXYMBDGNjFDU8dZaubRVydWhJ6lsqooSuBtru/1oXwTAfXrVU0
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(70586007)(110136005)(8676002)(4326008)(47076005)(54906003)(316002)(16576012)(36860700001)(81166007)(356005)(508600001)(31686004)(82310400004)(2616005)(16526019)(26005)(53546011)(83380400001)(336012)(426003)(36756003)(40460700003)(186003)(8936002)(5660300002)(2906002)(4744005)(6666004)(86362001)(31696002)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 18:51:14.6501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d6a0c8-96e1-4bfe-06a7-08da08471cf8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0221
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "markgross@kernel.org" <markgross@kernel.org>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "Mario.Limonciello@amd.com" <Mario.Limonciello@amd.com>,
 Alexandru Dinu <alex.dinu07@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/17/22 12:35, Alex Deucher wrote:
> Sorry for jumping in here, but I can't seem to find the original
> thread with this comment.  amdgpu_atombios_encoder_init_backlight() is
> not applicable to these systems.  That is the old pre-DC code path.
> You want amdgpu_dm_register_backlight_device() for modern hardware.


Oops, thanks for the correction. Alex Dinu: see the above for the 
correct code path to disable to test whether not registering the amdgpu 
backlight device helps. I have some other things to attend to, so it 
will be a little while before I can get you the instrumented driver I 
mentioned in one of my replies to Hans, but hopefully we'll be able to 
figure something out to actually switch the backlight control to EC 
without having to do a suspend/resume cycle.

