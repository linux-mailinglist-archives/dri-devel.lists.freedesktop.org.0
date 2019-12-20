Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCA128536
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 23:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99ED6ECCC;
	Fri, 20 Dec 2019 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FFB6ECCC;
 Fri, 20 Dec 2019 22:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToiLmMU9KMIgLp3idZdnQN1sIAP9luk5a7pxIM6pL7Nd7UOwOnPZuNfQOt9fFgYl60fe7SwIKKmU1ZFQNGPwMildjxGc2xUPgQpIymL6zUQbJvHYBvI87nSsqGN2m3yBhYIhPk0qSlD0AuiWud26N4gSt4bpjN71H+fVy8Zh16TvFpnbE7s9vE/7hHJWlv3a1MJEL83nnCiyNEB7IT+9B4IF4ZmdS0ZfAjiiDi/S9aGduekrI6FtlG8UaGs7fBYSAuYwWnQ4zBaFjKtVmeudOyNi7TRBiRmiVBqYiC2MCIjuwY9saezJVB9k4s0L7hQG60skmmLSb/VvxZQEGNFlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNA3MJoKqBYhozZTzpQyQ7So0bf++f2EzguGOTWzOPI=;
 b=Yx3jINMzhHdhorbAaaEvOcR/Z0Ektcbo8s4L8a9d/3jxEnInsgDhNjyr2oqYldt4gTf+xVXT/BNLbD8DQ/Utb3CHLGO5JyqLQ3j57Wmsq3nhetNsRFBkn04qIWJYrjS2kfvOGvl/ncymptS/o1BNudEVaOC8dMfCfeX/1UU2XLu/t5vdi6rK9xht6uj4Hr95uicpwZ4ye36RQZ1RCR7Gh3yCwuvN3uQQ0TO9+8qFLVKKHFEaP+TqxPDIZyj/eV89f0E4DKYGlyjHUgoDfD3+BhtG67WYb+E33YVqrpeX5lZOH9fw/+NZBxKsbXHSxN+/bGP/HE6e/kp2GG3aXX5TlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNA3MJoKqBYhozZTzpQyQ7So0bf++f2EzguGOTWzOPI=;
 b=LB4OLGM13NRdevKmr5bz21hX6MsvdMpLOiguZ8hxDcB4RLsVJKbuGhvUSByhkNRQM9m6DgIBvDFqas/PmIx8AcW9mBcYVXGjyFWiL0x16gRYrYCUeH4PFhRFWw7HSFMUK393HKq9ut3zRU1AOaEhoyPPeS3shKcRn2rWcV549Do=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2659.namprd12.prod.outlook.com (20.176.27.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15; Fri, 20 Dec 2019 22:50:07 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::a0b1:68d3:6053:b419]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::a0b1:68d3:6053:b419%5]) with mapi id 15.20.2538.022; Fri, 20 Dec 2019
 22:50:06 +0000
Subject: Re: [PATCH v9 14/18] drm/amd/display: Add PBN per slot calculation
 for DSC
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-15-mikita.lipski@amd.com>
From: Leo <sunpeng.li@amd.com>
Message-ID: <ab4f81d3-c277-3067-ddfc-b5868cd94bd9@amd.com>
Date: Fri, 20 Dec 2019 17:50:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
In-Reply-To: <20191213200854.31545-15-mikita.lipski@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::32) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1495a8ef-b1e6-40e8-719a-08d7859ef57b
X-MS-TrafficTypeDiagnostic: BN7PR12MB2659:|BN7PR12MB2659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR12MB265926710AD85E6905AFE75C822D0@BN7PR12MB2659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 025796F161
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(199004)(189003)(8676002)(36756003)(478600001)(66476007)(66946007)(81156014)(8936002)(52116002)(81166006)(316002)(2906002)(450100002)(31696002)(2616005)(6512007)(4326008)(5660300002)(53546011)(66556008)(6486002)(186003)(4001150100001)(6506007)(31686004)(86362001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2659;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqTYSrPIjr78FrRh1LLv4PGpll1PgqUFfoT9Y6RnuRdUsn3s4wDZfzymxl0PMBcJEGPbQkq4ivqoJr2EK/fxQqLfFcuoPfv6qIBv8d4717B7PZSClWBi88SbzOII4/NI4Zk2iNHeri9QzqQm4sF2VNeTouPM3fIPeVQPZ3WF3lnagjkevgfZfzZywxeohEGjQKmYQ3lGrqMeaHo3KWG/n2Pf7lp/ciu/7ATRgNg+j/qHSo9V5vVbJP6sWMTh819Tyna/qn/DFbmpqrCXv4AsORX78g32IoiGLBRUFi6TRbFamw6qG/xyM5ReplE82lUh5gR2oaDNAaKmRI8fiIqD3HXgjYRACPv5kzvnhN9DOSzfUiTSZwDbknIfUSsL8XJqBpAXlikI286SNMDfzJtKo2wrj8vVVDL65Ua6bRU8b86Ff7hPkPhau4QUoXLobbij
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1495a8ef-b1e6-40e8-719a-08d7859ef57b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 22:50:06.9157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SarQiyR2QZBjt7IvE1Z7RFV8b8ttMaIo4QIGV5wZNoHSrZni0vHkX4VEoYnM3528
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2019-12-13 3:08 p.m., mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> Need to calculate VCPI slots differently for DSC
> to take in account current link rate, link count
> and FEC.
> [how]
> Add helper to get pbn_div from dc_link
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 8 ++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h   | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7557edee7db0..c376c8ccd391 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -491,3 +491,11 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  		aconnector->connector_id);
>  }
>  
> +int dm_mst_get_pbn_divider(struct dc_link *link)
> +{
> +	if (!link)
> +		return 0;
> +
> +	return dc_link_bandwidth_kbps(link,
> +			dc_link_get_link_cap(link)) / (8 * 1000 * 54);

Had to take a look at the DP spec to understand this conversion here, section 2.6.4.1.
LGTM,

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> index 2da851b40042..a553ea046185 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> @@ -29,6 +29,8 @@
>  struct amdgpu_display_manager;
>  struct amdgpu_dm_connector;
>  
> +int dm_mst_get_pbn_divider(struct dc_link *link);
> +
>  void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  				       struct amdgpu_dm_connector *aconnector);
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
