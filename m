Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81A49F11F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 03:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4D10EE86;
	Fri, 28 Jan 2022 02:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF4410EE65;
 Fri, 28 Jan 2022 02:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSUESnvbBcfKduw1d5l4aTw6RKqykeEOnFxzYCPuF4WDN9n+54FwcohacwCKJGZsHGunaauF/oKMB4PxN15FoQmnpDf+zDTZNarxr1fBTgLodsa4oLduoV+gVP2RkVysFqFMvTXHTuZIku6N6lPA28jpxqjQZrBSQqsdiW5k8I+Hy/UJhxv0Ne3s4ymmJ8+QEjhJDyjjH7r1uQkYhA8MSl79fV4S28OKzh5DlpUgoe4dXbTbsw747qphO8183+BHzgLcYylYBPG7z3OpRh2ifBscDTAqFmO7DedEcaPAY/MUP/cIrNrtYcVSrWLQJdDzjH5fXdw3DRoOrWhW1HC6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIqNel/GhSVw25A7mizRuliz1eIA9zjQOOmTltjpuHc=;
 b=Ws7MgpT+2V2uaQ1Ks87mK7ms7DW9mxJDRONVRb6DS7THosxa5/0oSzovV50pzOi/ZOys8BlfcKsbCBEXvDcXc4auA5wiEu1w1+khJweCsMM8Nk4vHiWJhiEWiZYp1BdUjg17DKGfkWQfpW/X4puMyhr0arx1qB9GE3SfVUeVX6OgHxH+a2OfMBBtVNZqVCQ0dXF4c6+J87eNgXLR8msf7635xh8T86mSUb/8OTfFxkdAv1KCJnchyDNlJvyryDNWSwBH5fLtB/hstqHJBBPukQhThpKaJYPvdMwIYBu6MkgTpRHW4DxGqvu4e1fX+zTvKvZMjNkSbVygSxIJerV1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIqNel/GhSVw25A7mizRuliz1eIA9zjQOOmTltjpuHc=;
 b=fNq7gusELkd+8u9a8W/QxZLk+5S+QqUwvZ3Ii7X3vCi4Ec1IoGCmLGu+OdTy13dKQqLIxb3txQghpdZB/bQ/IAP3LFYSOdGdlkp6XvazHvVFfNPJVOzRUd/xvQAwTCI+Io/k49GNo0i2/fP7paG1dxTEHGN7X3JaomqJkuYgQX+/pwUDM8I7X9bPBFalF1ybpc9shifDSZFL0z76d9inlXfmWE4YE83UF4YRN/vN7LTG3uUToBAohCJ20IMweRzaGmRPmLaHEfqZd8eBQWoczGLS8RmhvHI+pjb5CEmRs2IPCIsjzhtkvMvmO87csAvfzqo3EJUi0NG70OKokHUerg==
Received: from BN9P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::23)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 02:38:22 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::7a) by BN9P220CA0018.outlook.office365.com
 (2603:10b6:408:13e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 02:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 02:38:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 02:38:19 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 18:38:16 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 04/10] drm/amdkfd: add SPM support for SVM
Date: Fri, 28 Jan 2022 13:38:13 +1100
Message-ID: <1728829.lT2U8lY8Lt@nvdebian>
In-Reply-To: <20220127030949.19396-5-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-5-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1810cc4-ee51-4878-4de6-08d9e2073fe5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4075:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB40750A88B6046DD91C753624DF229@DM6PR12MB4075.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9B1++c5DO2zGdCWo6M9RPZp0f5mtEUUchnAKxirci5+2JXKsMKBSXDH1ZD8VR1Jb8TFabsJjdpN30M2lh+t05BsP0Gd7BV5laOKy76ULX57wA8yo/vnI1QYADhSDWVJRfnG0W4sY83EMp5svAlh10mZfz9CyZ5Sx/VR2MNatYR36OUJE1UapJaLveEhxFCdXPQpg3tLwWJLdJ6o5yfIIDM/MNLKz2Yk6eKS75uH/IQBymieJSe9vY7ZNz898UnuSVJog0QSVE74r5Z1pd/uUt05dEnv383a0TR6EvpgKdzQbZJqMMYMvhE6I3CdmEksyc14bze439tkFiyb4L3dZoseZa3fKMKqHn2wp1ElN6DXmUKNCAh/Rey/LEYCMTzKChiHLTqXSjlY3czSdvMv8NHU6dW8WiJuqlmN84B6StqeI6T/OMel/O8NRJTAy84U0p5F2hW7RLxE14l2UpNF5Absa7/vR+Db4YHKXB9lYwhyULuo7bR0SXr+Qq5n0wHCD3wLcW7pdBayPW4QGJg8thP69hgzXJrUU/ILyHzkuxro5rrXV3rNOstLKwW86YukQoc5hOjEVEHVuxgu5ibJEn8gEZmcNEe/jwNBgihqQ4/04jvyA125HeATb2XmiZK+S9RAbJMr4Njya9jjtXWep3WJEXBymhpTxbgK+PKy/nLItJFL3ofT3s6HKHYowhg0Sjhto5o6AfU9YOYvcbMRhM/sJBDXYt8a9GtT57v5XFsbuTAcIGBV47mnj0Xnskc1
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(9576002)(54906003)(110136005)(82310400004)(508600001)(70206006)(70586007)(4326008)(426003)(336012)(8936002)(33716001)(316002)(86362001)(9686003)(83380400001)(8676002)(7416002)(5660300002)(26005)(40460700003)(558084003)(186003)(16526019)(36860700001)(81166007)(47076005)(356005)(6666004)(2906002)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 02:38:21.2557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1810cc4-ee51-4878-4de6-08d9e2073fe5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 January 2022 2:09:43 PM AEDT Alex Sierra wrote:

[...]

> @@ -984,3 +990,4 @@ int svm_migrate_init(struct amdgpu_device *adev)
>  
>  	return 0;
>  }
> +
> 

git-am complained about this when I applied the series. Given you have to
rebase anyway it would be worth fixing this.



