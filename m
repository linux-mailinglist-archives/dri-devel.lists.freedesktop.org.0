Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257C4862D4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 11:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA910F2AE;
	Thu,  6 Jan 2022 10:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57DA10F2AE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 10:20:04 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2067Xs3O020263; 
 Thu, 6 Jan 2022 10:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Wlu66oMeY1SAE4gHTCnt9gxCBgqgj9vVSYx4GifzhHk=;
 b=0deZiZbzUQ+tYwMFqzTfjDSgzC34k6s7LrPU1ASgELO7cJSMs0UPoEOpzjTVo26IjngA
 s2lFf+M+Br6Dvj/Jfgd512A8XI8omD0UFwI9/XdVfBRn9HyeUImgJOKR7ZdHXZ/SOatw
 tDZiBpHUkOsBIn48BNsu/8Pv8ZlnBgu+l5+S/cS401wDY85BjbpZGvlyKENBN59q+s/y
 ejqq3JXYFMY57d8Yhj7WAEr0FvkEEYMbTHc+nLKqhKzuRtNZtsShXpaJ1zAu0mNIoMRM
 jlJtNPmBAcb4uKnpAUQkfnAbEjDNetLFoyDJtSmC6A+V+yicmeXICPCmB+0Iip0vjDhY Yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ddmpdhb2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 10:20:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 206AFRmD176354;
 Thu, 6 Jan 2022 10:20:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3020.oracle.com with ESMTP id 3ddmq6g400-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 10:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZxs5DvncBFDSE6yuS/kYIonF6QoI1Xb4tRlHjkFa62nkx3ox3VoNBCOATZ9ZUWCvpDjUxKp25nHTkXoylCAfe88zOunlN8UkMEqhMAbjBgxmfHN7Um81Sva1c4S+c/BHT5gzxxoDctT6goZ0p546OV2uBtcwhc8X8fk7c/yxMLAaKtz7Z6BqK5wzhAiq7oVJw0w0pQzB7tIJsRWB+TdUUXEFIVa0N6flJN9AgnSQJ/EvZbubXfinNfLpBlPKRoziw1O8OQNRdrHT5MZHa3g94xiIjM7wuDoSUphqUM1tRs+81jkpecjiJW4H7PDhLUB4pOhGt6TaDILBArL/4XaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wlu66oMeY1SAE4gHTCnt9gxCBgqgj9vVSYx4GifzhHk=;
 b=UAbQdqURdrRyJ8bAVaGy1fsENgiaHrcKTtUYPQjrAJkhpfd1004s7bh1JkVdWptCH0+bJpKJ45pweSsLxUSnvbbwiN9Xgu73N0PvAk0UffgttxImkyxvjwYghIqJMNrM/Y2K+GhrwMarNOAmeDTWM/AN41KU+JJB0qkRXPwCA+R+RluinlxnSBBsP7fGsKtaHPsxQjNhc8UhpLREkmDDLcclGvWlTLt+QlotnDEW60jdT/wNmxD4/rC3/9iG0iUmNJVvZL7y/VS4diWudMwatf46HbRfoctUglRl8hXJDqo5i/x0WwmpM3B0nWr0Xp0gWbT68flq4ygWvoZpc5vPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wlu66oMeY1SAE4gHTCnt9gxCBgqgj9vVSYx4GifzhHk=;
 b=vI8hfqNgX7jfGj0mG5Gu30QyM1zvl6tdnh8WRxn3NZOXf0K31rcXp45ac4o8PNRE7v6mRF6ZVnM82jxi5PjHPM93uI+e6XyzOx0lbYEgJFMpA1S04oVz760MRnRdd8tAnOnpYCnsRPCmVKFQX/G7D0/tA1RfbKVRhLvKXn2fyjI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5667.namprd10.prod.outlook.com
 (2603:10b6:303:19c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Thu, 6 Jan
 2022 10:19:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 10:19:58 +0000
Date: Thu, 6 Jan 2022 13:19:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tzimmermann@suse.de
Subject: [bug report] drm/ast: Handle failed I2C initialization gracefully
Message-ID: <20220106101946.GA25857@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e17abbc-3ca4-4d7d-3a13-08d9d0fe1783
X-MS-TrafficTypeDiagnostic: MW5PR10MB5667:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB56677D2379119E297AF8A3758E4C9@MW5PR10MB5667.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y5JzrtLSsnfPFAoq7rNZMWIY42N6xjxEAkhagtk99+KhFu7e8aH6kif/c97MeV1MvmOMTo8dEuCofmVZiy860sRh8zYuJwoucsq7FRiLs3kjYKQWkd8UTkPy/ksIXbij6mXTHEZNeRz6HYf8GCwk9dKiA5932sI84KDOttB9cwhc9lrzsa4vIWVwqJ4v9igV1ioUJlxL+HJeDBm81HDTxuawb4+G9eLOpyUZfFBh4MqMTZf13z4inXDmNHzcmbjixvjKgoKT45KXB5LWCNTiJLVYFXMMEWc263ws/QSCbBKglOk0shhJ2yrIES0ILLuN3C8SP57VRD3IUxr7FwAfj89QOyys5koKClqd2KbCjEsodzaWzUo+Eb0rB3OYA+SviXBp07ImAQtj7gUc7dLHBUcMbRhciDChpEeBtBxTv3XuuPx97Lkyqx1yIkNaKxJpA+BulxlcKy4NNHTF2vtjqUKgpm+/3fiUc9cdVpDqVp238WXbfIDd+sRfXwZLZAR1lhzbwfenizN+cPVtE2bI3ArM5h7soi3GCMY4p8KCoKtR6arZk5n8KBlLT6BdXH8m3B+M/wJuHP5HE9wYyjJ7KaKheiqdR2kVu0uRMwKwqIJDycUapqQ6D7b6ka5BU+QncXytMlVaqtvJ5qu4HrfSB9+IG4XZb2ZkzG04HUO4oVBHB9jV4/rELhrlOSl4WmZf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6512007)(44832011)(6486002)(6916009)(38350700002)(33716001)(5660300002)(33656002)(8676002)(83380400001)(4326008)(66476007)(38100700002)(66556008)(508600001)(8936002)(52116002)(66946007)(2906002)(26005)(316002)(186003)(86362001)(6666004)(1076003)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OlWqZAYNQqWQxdIQKec8p+o8rEwcowbriZwJIqe5cdnocTuUjNN4w7yDa1ik?=
 =?us-ascii?Q?JCoHsvUEhwdunuSjxzsILrl/YA8VkHrjSsjPcNtQMLmNuO77ak20PK5W7phf?=
 =?us-ascii?Q?sTQEMP5E7x2ohrwGy27eogynqB/KMyFcIZQIBFxosoFD8kSDlRPdc+IzsgZL?=
 =?us-ascii?Q?Sx2ZTbwMm7fcMf0u3RMppS0MhLwCwBfkeqQTbdvbmzKXkHcnD4opgYYNhjyP?=
 =?us-ascii?Q?8xsQyZvQjtL4EBTI3AO2o6Uok7YUu9MItxYg1IOqBgoKYA0aBIUUdOJQ0v9h?=
 =?us-ascii?Q?FEjGvcTCvTnedeXk8dpBDmZqJGMAOrgkAYgFvv8+A1Mf4cETZt5GG6ZbRyxP?=
 =?us-ascii?Q?hHJlf+hvBwVwa+ZR4YVfQkeM7+sYYLxkG/kJR1et7RP4BTdBGIDRC7WorUQC?=
 =?us-ascii?Q?6iXt9pRTfUlhKNc8lUuVRhYcRdpxQxXYM0FaCwWVnw9GV2mKO4zjUT5k8mNM?=
 =?us-ascii?Q?T/lj+vrlF8gtURebdjrd3gfwPwRDPqoFyjgCYjjf+V+h70li/fs5QpYQHCMT?=
 =?us-ascii?Q?aPHLUywZdnXP4NJ1zPZNHecuPCb86JWWWDAWw+dtz+uo1j7XybUAUsHPlOMp?=
 =?us-ascii?Q?R/WBCyU7OYfy2eGVyhns12tRPZey/qE8otluw+Qkg2uwkCEe9egyPkvsQKqt?=
 =?us-ascii?Q?Tn3wUE9wvv3nUPYRSG4Cj+Xu96fx5VSswp3N4AtP1I6HEHquqXmZFtHOSNvh?=
 =?us-ascii?Q?Xoda1RLuckzaxl1NIPiINEilfLkwZQgAVP0Jl9AW1E/DRj5ktFYjQWwvou6o?=
 =?us-ascii?Q?gOOKHhnFY8Atg6e553eKS35OtT/PUpmIumDd5ZgIabpUHAnYBy7Ok1RX3iYR?=
 =?us-ascii?Q?dFo59jqEPLTYV6EY88EYeVDlSnDys9jkpJqzB6WpwZ1RQnM8v9mLM8BESPHn?=
 =?us-ascii?Q?iU01j/kVTkDLSAfeUVsN2IIndpS/lGFsaPxA0ZthBw9POk+gT4LzTrA45+De?=
 =?us-ascii?Q?aNLSp7DZbrwDQnFAXj1zp6N34XhocWyKJS2G86ahyZCmfBX+rzPJ6HX8riMO?=
 =?us-ascii?Q?T/GOQ3fnT+ipTjuSvlHoW8Tk5vaZvnMuLUaeAk5TajZYguAjBA0o9MBpvgyn?=
 =?us-ascii?Q?k4AI5KHNqv+28yua5xXTHkxzkHRS9htBqIU9NCddidUv1WQpak+16kC6sBEW?=
 =?us-ascii?Q?0cmcAqs24NMB888DtrhbG4gwnn9kBwxpFqVzpge2BFBZzBwMUrWlqKC8mkqE?=
 =?us-ascii?Q?tO6zZawY5Qgq//xgMu7zLBXshjeFxBbSdMwmxv+5FU6UkEd/vpDGpdr99KOC?=
 =?us-ascii?Q?enkJrEaCDxyc+alMcIDkvchl/yNz8jPSbcMEy4vq+M3i/rFzcLGfayxl7Tpf?=
 =?us-ascii?Q?o+LF/Ubk0C18YNzs6fjKuK5ScJ0T88bKALb0MW84nWOxYNgGxiN80Lnf3yg6?=
 =?us-ascii?Q?MmISNCNVHB9SA9FeCFVXkSFa5+8wRxECa+RsuevtTszcX7zMHKnjVJqUaVNT?=
 =?us-ascii?Q?36oSgrr5dfvouksyee+yK8BjPw+29KKpyoJ3KOCRaoB0wtqCtVc7WtG+ErU6?=
 =?us-ascii?Q?fBIxcGjxuQurMFSSLDWKQNyu7u5QjauKX0pP5AVEHNB4Cnz0S1MvBbxFIbhw?=
 =?us-ascii?Q?uSMO+mPbsnpyoqISdPzLkLmsWyaTuzmIbWuTjOmYK4ESNNtdg+hHUy/ZBszf?=
 =?us-ascii?Q?2zE6Y88ceZkm+CwAayTNT8AifoqUT7JrRlsjBJwBxErr8EufEzWTaCSq3N4A?=
 =?us-ascii?Q?dwmxfOUTNwabwinKHbPgxCtcTU0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e17abbc-3ca4-4d7d-3a13-08d9d0fe1783
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 10:19:58.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQt5OpALQ6nZ5B/mXRjUSocTFyL20nvmuHpcAu4xGpM7skc27EL3k+aAgVFRSjmTcrGj44Ly822EyjA4FMqB45eey6iRcictvEWR/KelxeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5667
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=490 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060073
X-Proofpoint-ORIG-GUID: n9nQD5Y2t2247RWu6RubaUidZTk5yOih
X-Proofpoint-GUID: n9nQD5Y2t2247RWu6RubaUidZTk5yOih
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

Hello Thomas Zimmermann,

The patch 55dc449a7c60: "drm/ast: Handle failed I2C initialization
gracefully" from Dec 6, 2021, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/ast/ast_mode.c:1232 ast_get_modes()
	warn: passing freed memory 'edid'

drivers/gpu/drm/ast/ast_mode.c
    1209 static int ast_get_modes(struct drm_connector *connector)
    1210 {
    1211         struct ast_connector *ast_connector = to_ast_connector(connector);
    1212         struct ast_private *ast = to_ast_private(connector->dev);
    1213         struct edid *edid = NULL;
    1214         bool flags = false;
    1215         int ret;
    1216 
    1217         if (ast->tx_chip_type == AST_TX_DP501) {
    1218                 ast->dp501_maxclk = 0xff;
    1219                 edid = kmalloc(128, GFP_KERNEL);
    1220                 if (!edid)
    1221                         return -ENOMEM;
    1222 
    1223                 flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
    1224                 if (flags)
    1225                         ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
    1226                 else
    1227                         kfree(edid);

kfree

    1228         }
    1229         if (!flags && ast_connector->i2c)
    1230                 edid = drm_get_edid(connector, &ast_connector->i2c->adapter);

If "!flags" is true but "ast_connector->i2c" is false

    1231         if (edid) {
--> 1232                 drm_connector_update_edid_property(&ast_connector->base, edid);

Then perhaps "edid" is free here.

    1233                 ret = drm_add_edid_modes(connector, edid);
    1234                 kfree(edid);
    1235                 return ret;
    1236         }
    1237         drm_connector_update_edid_property(&ast_connector->base, NULL);
    1238         return 0;
    1239 }

regards,
dan carpenter
