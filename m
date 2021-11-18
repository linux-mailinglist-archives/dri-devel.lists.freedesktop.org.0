Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEBD455ED5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 16:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF876EC95;
	Thu, 18 Nov 2021 15:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98666EC93
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 15:00:42 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIE6HNG019322; 
 Thu, 18 Nov 2021 15:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=IutJusrPCKgAL9jDUWEkX7DirpKTF9kNcyuD1bqBeo0=;
 b=oUhYdbe0tYtMqagpU0MuBS1fb2v0KJpOIe2vP3DDhDivBHxqBrS/DxwhIQlbcKFZ3HQz
 +2SdOKRosx9d5QIpzBfZYG4S9QtRnGgnDMK/6bgaucK4aUBNvgbhCArPfPCAROaMN/NG
 PH/BeV7qB0F1nM27emBY0xWbmOUf5lrPkS8zH3R2O3wr9XtFcaEkorlJPo0/u2CrvHiY
 5D58SwHzGVRRNPZ6GjpGGB6p4tWex+rylvURpEqsBhOKzo5S/D/OOQql4hqvBfGlsqcH
 ed7Zf8nP2jHOX7sDuwRNpdOEm7KFZAhzPAj0ziDBV+A7kynhzYNgZwPEcpwkvr8SX7k3 Lw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w8yexb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 15:00:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIEoWvO097799;
 Thu, 18 Nov 2021 14:59:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3030.oracle.com with ESMTP id 3ccccrv07j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 14:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZn/p10s/0DkFqRNMnJmrKzAmIf0x2jKsfCjb5e+B27WFKDbk/0yb000/fOsWwZ2w5ss5twF1A51XweTBUDO6D9aWttplWxYMvWuKHfoQ5tK6ZBRODru2SNOMJF3oiCR1zAFs+R2eEaAuzJTxf5sJj3r/Qeq3mNEvylAr4Qed6NB2K1I/j+8ZL70YScw9uvUGACOj7vVTw3Yb4KmvWeLZMBnZvuMLa5wh0IsNiyMGweEU7pDvN+0RDJn/7BVvHVqHDzQCqpUvG9yWuLR8QvW9J2jO4SfQgkIdATryqd15I5aFfCIZuwdbHEfWu6231/UOnIXQLRlYeCLC1dK32TmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IutJusrPCKgAL9jDUWEkX7DirpKTF9kNcyuD1bqBeo0=;
 b=SdJz6dRg1oeCVPtBfd3C4y/Q7mn0WnrWxrlNmjZEV/gmzmFCQSskT2HT+SLBkMduoB0N3FQdn2KzBVdokSDqZasuYgw+am3V7wcIFfLRsXiyeHvuJhwpUe8vWw8dET7701en0cug7oCzZvMs03NprnBIwLz45rdznJET2MNENWn7/ORSeGE5BMMr3ALSvSGeCKQOBAZJy0yQtC+QIDOh7wRs3HcW2zxiXo+iLUQ/8HnJeSKC2YdEOJobWODWsrdXZMZLcELoslbEGxYbwSfWEKCx5PGFgE3a42T5/gHgnoF0w7J4+DuaZl+AC23MPO97oLq3Q+S1bMTDQ/oVLsgx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IutJusrPCKgAL9jDUWEkX7DirpKTF9kNcyuD1bqBeo0=;
 b=lg3V7xhXdGSzM78MRKAY38D899/PtyOXMZFSeVuEmt1J7iBySyNg9ctq/7lagT8hF8+Pwrt2Rrk0mZWTKIY8DUK1kEQ21DYfOy5mysNGm/x6mQhoqk+F13NIhtxDGdtZml6nQysNW4UL5uX4XBdrp4sCqDmSTjTmMD84yOotTD0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5863.namprd10.prod.outlook.com
 (2603:10b6:303:18e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 14:59:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 14:59:47 +0000
Date: Thu, 18 Nov 2021 17:59:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: angelogioacchino.delregno@somainline.org
Subject: [bug report] drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver
Message-ID: <20211118145937.GA20921@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM6PR04CA0060.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::37) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by
 AM6PR04CA0060.eurprd04.prod.outlook.com (2603:10a6:20b:f0::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 14:59:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 818475a5-8df8-4941-3f59-08d9aaa40fd6
X-MS-TrafficTypeDiagnostic: MW4PR10MB5863:
X-Microsoft-Antispam-PRVS: <MW4PR10MB586373A24F5955B75070F70C8E9B9@MW4PR10MB5863.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7HcKQzy30ed/CIjeASAcN8xhQIAp3IGTRMQVUFcIghzAsACX6Pee9JJ+CByNr3NVCGB4hHoWlF8zbcqasUxxOUspuFIGiAcWh5zMVy/OcNZDPX3kZJNwg6/I5W441cMfDSvA5JKhIPJeaIJVgIIA2I0pXyYYEgXKPG/nHYohes2taEG6CEmBmDjcxVzxrO4k+UDpdXzPhrZtSnR6E0cDcQ1uhiLzNrgg2lIBYLQAiqySAPLUrSnlid7wq07QMVuCgqPWjYVbTpknrref1h3lIRt1X4+CCP07GCloEicQ+4c7GQjggEf/Nvbx5vbWmqaiDK9uNlGSIr2nkDiBYCS3/hOD10iBrC4LdY36BeNqfIScKU7YayR9PMh24hdZzq6e2OprWIi6vLfYjhuY+4Aa/A8/ppMJRCTWX+GlP73sTQmrkCNm4UvwZrIRbSR0GaAFKALIurfiHLWIEWt8CPh0djt4WEZbbqJXGsqTcJDIpN9xZ4QFXYOtX4aua/4QaagzjD90QN9VfTAh38IrUoZnri8BEJC9/C81MQrBfUsV5j/m/lTyzZz5g32gCcPzy2EKW0axUVgwQ+wv8nmKyyMVQRDeciKKDoxYwoSwJA39J6oEh73bQKJH6BI8J5C3VYYM/uFL/oGN/PLjGDQR1OwWOnpOeaxgODuJ/o43c9XvlHQhvP8HR1lalImaY86nAP6meJ75dJqL+aAKwrzFlIEe8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(44832011)(83380400001)(38100700002)(33656002)(9686003)(66556008)(316002)(38350700002)(5660300002)(9576002)(956004)(33716001)(4326008)(6496006)(8936002)(2906002)(52116002)(8676002)(508600001)(26005)(86362001)(6666004)(66476007)(1076003)(6916009)(66946007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kVUmEOsl1ZQl4wZo8T+tzHrHunqLC5LDDX+4mcMuh9u+s1b7tjYqC1+r0spi?=
 =?us-ascii?Q?IXfLUFKqi1apeELsDqD0JQqHH7uXLsrIaba/FvfBwJ7YNfPfnUu5fvwp5U2R?=
 =?us-ascii?Q?T3KRZBzNvlDlSn0qBBjx0A26qibdGuYDC2Zq3cGUaxL5Xow1q0nC9qghKICC?=
 =?us-ascii?Q?gjzR/+ATGBlhSTtTUHV5iRrROqB7rENwMQYCApaaFaBXDiyAi6ywRAl00sno?=
 =?us-ascii?Q?nTpiyApI2Hb51kLH1khHj2YVLyLy9NEDuyqHiA16vL33qODuPndRFL8U6/3h?=
 =?us-ascii?Q?qcPFQeTLPHgdChjLkXS5IeWl76xeAm5IXiyPe/6ibqyuoZff2P/JhL/xJF57?=
 =?us-ascii?Q?zA0nL+IBAqmsqnHvYyP9/QOwBq+L3wR92gP4fd5ujSr04L/a1W1uf7pRsFZz?=
 =?us-ascii?Q?klxLDFFv1UzwPRHcSwBxfoYdcM3SX76OObN1/aTjjtbtzoVwoJ5JKuR1Ujsw?=
 =?us-ascii?Q?COblaviguN/xNE0ixpmCB/deYxuY3FN3cFbWC+gmUBBAXm0IOlJ6FdBE3Uwr?=
 =?us-ascii?Q?DISNzLxKriTgGwfiUoIs975vxwTcpFFCFEhiBJ9ygKq7lsXV+N+rrMthDBLx?=
 =?us-ascii?Q?EeD2dlJZ2PNZ1GE8n3AdGCo4gJfiMRJrO6lqGNePEc/dAWDqvwQOKULFVHp5?=
 =?us-ascii?Q?q1luRrA3K7RPjEIrU1y8MEIihqvxUGp3Kypy7A53e61R1c00FLqCUw/rNi4O?=
 =?us-ascii?Q?MRnq8nK5ZLgWMChxq85g+1Z2OG9Vn4pdFBlW/kiwlmA6vMtZJp8nhlA4I08I?=
 =?us-ascii?Q?QybZ0Sjl6cS+2Ia62K9l3/3yGSUTnPY0bpYm62bXMLQOqGcduqY5awwlQai6?=
 =?us-ascii?Q?TsqaQTnqvkonHOEA5Nq1X9Ty3C1cRdLNKnk3TUXMmyYciYm1X/etjZtlT/9u?=
 =?us-ascii?Q?gNOHTfMJGOHEFj00WEj+bPftxAhVkq5LmcmRX2OmG5fSCOFczrrw71W74ChW?=
 =?us-ascii?Q?ISFmv7AAXVUi9tYzM/Y6hCDr25Z6o/9UbsQ3KPQylKq8t9Tluwn8Ud0MfwaK?=
 =?us-ascii?Q?rXZDW6qdjMcR0OQa49Q5/2HQHkS6Ilneeixf/DQFg9Fyt+lICUf6jDMVLCe4?=
 =?us-ascii?Q?EyTrmJFGh2gsn7fDEEd9EzsdxpTeAuV6bBltgL+c/bypKWD3tp/aCjoPFP5X?=
 =?us-ascii?Q?LaskGL6vJ7wtm1z82GH2uk6HFNAsUb/X1PNbsnM5nITCeuvCdVLwCXKRX7fB?=
 =?us-ascii?Q?4xb+kFDubADGPtaPERlZ0Wxt4z9BJMctuliNmkV2PscuF7G8+gXEGQUqDSR9?=
 =?us-ascii?Q?vJGO8bD7PM/yWmclsDTUjhloha3/ETui4PwmZQRzupTtro9MAh2uI1R85imG?=
 =?us-ascii?Q?CHyYuyMVtSy9UNpCo3nZ8GtJmdm/u3838iG8OXPzUyhJghHB04Qy93ZZBNjR?=
 =?us-ascii?Q?dNQR6IM5vPcGu+mhoucnYhdOmq2sVf70tUkMooCDWVkRRB4o+OAKS5elH2yA?=
 =?us-ascii?Q?SluD7GsTRkmv35QVW+8oj3yMktjnjuNnFe4MT/GAkwKc7oTjdLZg/qEqsX5M?=
 =?us-ascii?Q?usGOVw23VjZLD1GLj9ydU2xUobgKBGDKdhkUIe/TWH624L8a4Kj8prM6vqsR?=
 =?us-ascii?Q?u+HCYTnz0QbUP1UvzmhoK7feKQaNGfKel7VfLtfTaprxKAkn5L8SrCJbzZ0r?=
 =?us-ascii?Q?sV1iFfbaMCyzPKzgNwhj4fe6vw6ifmeSxtASnp9IpEkWwuzyEQZ2L7V62GwV?=
 =?us-ascii?Q?Itp9CYchtNPJMaYxujpTWqTfTDs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818475a5-8df8-4941-3f59-08d9aaa40fd6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 14:59:47.0061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR8KnXs52tngKf5vLY/YonIYR+aPFjTQyD6HSO7CTEVy/AghIJevt/C+OrUpp7HutllXNX9mHgVToiCEeU/hQF3+lr8kjWSPaVBeGpmpPN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5863
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=94 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180083
X-Proofpoint-GUID: q9tjEZvgT7TbogPUfAN3d4PUO6zLkXrN
X-Proofpoint-ORIG-GUID: q9tjEZvgT7TbogPUfAN3d4PUO6zLkXrN
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello AngeloGioacchino Del Regno,

The patch a19125a28112: "drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED
panel driver" from Sep 1, 2021, leads to the following (unpublished)
Smatch static checker warning:

drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:317 boe_bf060y8m_aj0_init_vregs() info: return a literal instead of 'ret'
drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:322 boe_bf060y8m_aj0_init_vregs() info: return a literal instead of 'ret'
drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:327 boe_bf060y8m_aj0_init_vregs() info: return a literal instead of 'ret'
drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:332 boe_bf060y8m_aj0_init_vregs() info: return a literal instead of 'ret'
drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:338 boe_bf060y8m_aj0_init_vregs() info: return a literal instead of 'ret'

drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
    296 static int boe_bf060y8m_aj0_init_vregs(struct boe_bf060y8m_aj0 *boe,
    297                                        struct device *dev)
    298 {
    299         struct regulator *vreg;
    300         int ret;
    301 
    302         boe->vregs[BF060Y8M_VREG_VCC].supply = "vcc";
    303         boe->vregs[BF060Y8M_VREG_VDDIO].supply = "vddio";
    304         boe->vregs[BF060Y8M_VREG_VCI].supply = "vci";
    305         boe->vregs[BF060Y8M_VREG_EL_VDD].supply = "elvdd";
    306         boe->vregs[BF060Y8M_VREG_EL_VSS].supply = "elvss";
    307         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(boe->vregs),
    308                                       boe->vregs);
    309         if (ret < 0) {
    310                 dev_err(dev, "Failed to get regulators: %d\n", ret);
    311                 return ret;
    312         }
    313 
    314         vreg = boe->vregs[BF060Y8M_VREG_VCC].consumer;
    315         ret = regulator_is_supported_voltage(vreg, 2700000, 3600000);
    316         if (!ret)
                ^^^^^^^^^

--> 317                 return ret;

It's more clear to "return 0;" instead of "return ret;"

The documentation for regulator_is_supported_voltage() says it returns
bool but actually it returns negatives for if regulator_get_voltage()
fails and one for if it's supported and zero for when it's not.

These if (!ret) seem wrong.

    318 
    319         vreg = boe->vregs[BF060Y8M_VREG_VDDIO].consumer;
    320         ret = regulator_is_supported_voltage(vreg, 1620000, 1980000);
    321         if (!ret)
                ^^^^^^^^^

    322                 return ret;
    323 
    324         vreg = boe->vregs[BF060Y8M_VREG_VCI].consumer;
    325         ret = regulator_is_supported_voltage(vreg, 2600000, 3600000);
    326         if (!ret)
                ^^^^^^^^^

    327                 return ret;
    328 
    329         vreg = boe->vregs[BF060Y8M_VREG_EL_VDD].consumer;
    330         ret = regulator_is_supported_voltage(vreg, 4400000, 4800000);
    331         if (!ret)
                ^^^^^^^^^

    332                 return ret;
    333 
    334         /* ELVSS is negative: -5.00V to -1.40V */
    335         vreg = boe->vregs[BF060Y8M_VREG_EL_VSS].consumer;
    336         ret = regulator_is_supported_voltage(vreg, 1400000, 5000000);
    337         if (!ret)
                ^^^^^^^^

    338                 return ret;
    339 
    340         /*
    341          * Set min/max rated current, known only for VCI and VDDIO and,
    342          * in case of failure, just go on gracefully, as this step is not
    343          * guaranteed to succeed on all regulator HW but do a debug print
    344          * to inform the developer during debugging.
    345          * In any case, these two supplies are also optional, so they may
    346          * be fixed-regulator which, at the time of writing, does not
    347          * support fake current limiting.
    348          */
    349         vreg = boe->vregs[BF060Y8M_VREG_VDDIO].consumer;
    350         ret = regulator_set_current_limit(vreg, 1500, 2500);
    351         if (ret)
    352                 dev_dbg(dev, "Current limit cannot be set on %s: %d\n",
    353                         boe->vregs[1].supply, ret);
    354 
    355         vreg = boe->vregs[BF060Y8M_VREG_VCI].consumer;
    356         ret = regulator_set_current_limit(vreg, 20000, 40000);
    357         if (ret)
    358                 dev_dbg(dev, "Current limit cannot be set on %s: %d\n",
    359                         boe->vregs[2].supply, ret);
    360 
    361         return 0;
    362 }

regards,
dan carpenter
