Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53F37F719
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA7C6ECF9;
	Thu, 13 May 2021 11:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E96ECF9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 11:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmtNCfcG7JcYffjUWFbovWLr11y/6kJX3W07Yu5iwT1bM+hCLS+IHrABNEcDh7rliaOb8C80OzzNc8LxCYVXMMJobfLWZi+buIhVS3XN+pNPnex99ryWadkFu3OO87ZmfbpPu7507+fpCp3h25r9ouOI4LwoxPr7GkbwF89A0+3mQn1bELVaWsWBJofycsuOYS0kiL7wRFr/YWXA2Fi4r/CAmeV5rlRTfSvlMwkUE/aNaQWhWarBQUpyoK1fgp5giif/1lj8fkfTvy6iRc6Zm7KTn+0qZNvSqhndiOzv3B/Mz5YIAFY16AkHMTe+vmnIZMLDbqP21mCfBzgHjFC/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyUhD+O496w+NzKlSXdXCrbR5UdX56y+UhYPQyKUgsk=;
 b=KpySK7DE5NngDqLKKde6349IVnBIPiUG2YexHiyiGN0o5o92R6gSaCfKAbnPVDby2dU6PKUu0QZLV5UFksvxFnmX3Kyo03+EcUehsWoO2vQtlv5oxtZBzst5GBX4YZaF5uOZMiJ6l5lXKtp2Q6PMR/sXr7KchNCWz5j7V55VuSXOe96tRNSYmJ12wx8QwEgUW1958YVSXelYlDT78IABQmo/c2Am9wBaw9qokGJUn6e1K4dAmxe7xph4+8/Y5qmwcuCOOAiGiU7uybFLySB6Y9D12Ut48tdu/MdUTsWTxk45up50bfoK8l/AqZGYt9g7rFAvp7NM9GvrpC0xh7tBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyUhD+O496w+NzKlSXdXCrbR5UdX56y+UhYPQyKUgsk=;
 b=kVAF3905EdH4L8jmX9kFFtLvmw8bPClAjrkQVUvVBxTcpgxm8UFjkbqRNnP3SLKb5M1mQlOS03TYlTNl3+GZFMDVJzoaMrNAZaoV3iXImfRtHNcvUXBpDtZaUs3SUAJuEZw/qwIlrSdEn1TRmEF56sXQITP/r5AaRINu9WW68n4=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2344.namprd11.prod.outlook.com (2603:10b6:903:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 11:47:12 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725%6]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 11:47:12 +0000
From: quanyang.wang@windriver.com
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/2] drm: xlnx: add some functions
Date: Thu, 13 May 2021 19:45:38 +0800
Message-Id: <20210513114540.1241122-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.8 via Frontend Transport; Thu, 13 May 2021 11:47:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc9e31b8-e236-42c6-a3dc-08d91604d8d7
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1101MB23443710FE611EEDF91A54F4F0519@CY4PR1101MB2344.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYSsh0Irde3sUDLvB2C6sDk9ozJ/+toQfr9aQ7ITQIeCvhnB7bPLsRziueSCVU+rcS/tIoHHEwydiVG2iQAmay3IxodCVBjlRQu3GtACnGrquZGBj3seFobBmvfw8QQDUb5UAm5yV/rRgtS70k8IvMXLXHPj1WEYnqmdv1EG8GG9f+V6XvNiOpg/wR74M3oHyMxMwLiFBLqFHgGrXrWfW1wNYE5Me893CMAACV90EtMdx4l4GJwTVIMFEj0u1QBkA9mwbZNrVlNV6qKuHUmPTvKKrshSWZXRV0xPVq/u35HfoZPjleXQWs4TUGHq6x/2OWwbB2zBWHxPof8QeNwv3045j1kHm+0mLHFAU07MPPcZcZubuiX+luO3rrvCWrE8YYz30oXrpY8M4E1EvStfSqHKFjzwvFw7gfYmAk7VbQrVaD0jlci0IekiNMNnq1RzC4jSJHIsWEj+L4dGOLRMur/BF+djGzfo5JzGWSp+fI3feYHAwuNV4t1QaT/KryWGlv0OZAIWmegi5r/5EhZHJJPFO1rEuS0XSYYK/rcIQ2ATLZr3x7ZFzLm06gM75p7UeelMCXndQ+zYnjox2Dg/XnwRSldZut2EFVFTrfTCjmX+gihLbQ2gPQzwv8LQG+QF4lfU3uyGGJZu2bJkcyqIEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(36756003)(86362001)(52116002)(38350700002)(38100700002)(83380400001)(2616005)(6666004)(66476007)(66556008)(66946007)(2906002)(4326008)(107886003)(6636002)(6512007)(110136005)(316002)(8676002)(186003)(6486002)(1076003)(956004)(9686003)(16526019)(478600001)(26005)(4744005)(5660300002)(8936002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xOdwRwqtvzjdEtMmXJGVB9c5eFVjFATHW5joZVmfogbfSY0K1iVdClMEen+N?=
 =?us-ascii?Q?wh87dHdFFaZoJcz+zdukY4/97BItA9gdl2wmmAWFEL+8sTw/g9m8G1KXONB8?=
 =?us-ascii?Q?b3FJdNOCFelt6BKkmn3VjbGdno0qI39A+LKBqatH8YLFOZBQSdctMCKwcs3N?=
 =?us-ascii?Q?yVJ0JKwZ3loN5pMMRVUUBDNJvGAa3q/Zb66XNJPmdW4ZcNqQGnJ0LMx8SpU0?=
 =?us-ascii?Q?JPLCaJ3+yz6vonDvIADIIC8mPVJbixtGbdgPcbVmWpf/tXNVkzPoC9LMcb1W?=
 =?us-ascii?Q?sIQHOAKgHvH/72DF18jQPzjEMVwp3noZlFtcZi4Gxe2Giq2jt5hUsEfm2a9F?=
 =?us-ascii?Q?VDqmjmNAPCE4R+EcLgljmocChNDevrc8FkRXFGRluxgyoPDEUizV1i/G0bvd?=
 =?us-ascii?Q?QrYMKPgg4IsBbOH9Ya5xHCVQ5OMiaQULtw6k6OcZnSMp9n2H+axNiZaeCJUE?=
 =?us-ascii?Q?CsIA/QcseJoFzrbjFSgetqLmopSGkUOBea9k9ieOKN88HHAROqrya0bpI8oR?=
 =?us-ascii?Q?zElgIv35mRzf6G+/ujptRauuzBvM7Y0hJxdMepnoDMKZcY6VMEaPpkDWKTpP?=
 =?us-ascii?Q?7cZZ6W77jVvZX+cDlWUl3NVuuN8y/OKKFnC3eHkLS+IbxsXT1OC5N/XZ7oim?=
 =?us-ascii?Q?IqqusxC+OKYH7GiBZLv4iy1hzDjkMoKwwoMabtp5P9lt/jgCQKm4FOrEreVW?=
 =?us-ascii?Q?gto5ViBQUTbMZr8h3VNpWCoC3XZdopbWsKuL5Skt9hkpT/v2hEtSgZ5K2mvn?=
 =?us-ascii?Q?6Jmt4USao1N3CI+UUDjUu6dP6eiPBwp2EAhUvn99K1Q2TNK6x0cnuhn7Y/4j?=
 =?us-ascii?Q?O519ks+sApnCGtv2g/V8l2D49D6eD4ubakCFH9q/CGK1nVAqDM73iYc7IyKA?=
 =?us-ascii?Q?tFaKIRvTNTjtw1QReYxfaFOClnsc+dozlnk4f4V2f2n1XbMlHWJjXuk7Pclr?=
 =?us-ascii?Q?rQlcO9n/Lwux3ib68wi0MtNaKc6VY6yu/bg0XQiJ8pM0JKPLdjfasbsjLKYp?=
 =?us-ascii?Q?+QNf74h9DF017wwdla5lFosRG6x5QPEvkusq9dJpql6BNA2v42Bmwqc1tkmo?=
 =?us-ascii?Q?OpNo+HfDVu+VukqEo907Uv3zlsAaxwIpxGEY2BMZvKMu7irZBCXQ1JPLbpIk?=
 =?us-ascii?Q?ysrDLA1AGSm8OFnpTs7GCwxh2Q5wFL33ONjqeQWwIskVbogyd1YBS+TcDnkP?=
 =?us-ascii?Q?KXTaS2l/87dm08/2kN4JKBbVJ9V7q7pA0pZ0cUyycLbH5ojLcPXthpuh0NMN?=
 =?us-ascii?Q?lTpLM2KeimspkJpZQXcAK0QQQwPyi4fedtv27S1Jrtc+v3NRaVEjK6o886qm?=
 =?us-ascii?Q?AZnwkfrYHR1+heIMdgsN/fwd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9e31b8-e236-42c6-a3dc-08d91604d8d7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 11:47:12.6794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HcnuzBfk3MeOgQCkcB6yfGtdTK0xMMWfJOU2wqXfpoQampAty369kDu48jtTleSnCGCxIrPIFMthxGYyDgnnmkqGqitx6IS2pUVWB0+Ia0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2344
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
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

The patch "drm: xlnx: add is_layer_vid() to simplify the code" is to
simplify the code which judge the layer type.

The patch "drm: xlnx: consolidate the functions which programming AUDIO_VIDEO_SELECT register"
is to consolidate the code that can configure vid/gfx/audio to output
different mode (live/mem/disable/tpg) in one function "zynqmp_disp_avbuf_output_select".

Thanks,
Quanyang

Quanyang Wang (2):
  drm: xlnx: add is_layer_vid() to simplify the code
  drm: xlnx: consolidate the functions which programming
    AUDIO_VIDEO_SELECT register

 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 191 ++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  15 +-
 2 files changed, 116 insertions(+), 90 deletions(-)

-- 
2.25.1

