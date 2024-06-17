Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15690B715
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 18:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6AF10E465;
	Mon, 17 Jun 2024 16:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dig/4ifY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dig/4ifY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118B110E465
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:54:40 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QcpABlOFJTadSvZcGLQXl61L0poEBd6UIK263NHl/aSbCsOfHVSpOyRDQR+WW3zUdbWFSan4GYaD8/aHt3zoMY2gCAAoch3lImR1NNfXvwpVkR77Gmyw/scnSNEL/IPnsWt5VxkXByS+haOV2wrsGrYYC2GXxNjD+0Qh54+LLgv1G9T5z4itQoP5wE4BmxIKyt6f5+SR8L3jQmYRKEhIwGjPlZnkuoD00TXhpXEEzQ+BHkmldrLn0JHwSnLL8Es2HRxTsXV6Fbg6VexGSfchJqR+ySE6pXWsHUMBrwBtNbDIdcb2f+eRt0wbexYFff9WmgSqam8YkQrsD3fLxbrjMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTtUfCbHRo9XyzoKq5KtGz2gbn9skv5YWLgIru9Rnsk=;
 b=MWK1/f8e890+u9rU71fVmY9sFPtw46fNlNcgqOaJQ+I7VT+vHNbLJEWAm1iitWBdSfgIpYemUAusiwk/7o+hCDZdJOb4O0VrETMi9Jae8c3ea33k7q9G+H48FA2+Dpl5R5j4+icWBsYd0/84vYAmnrVigyv+OcJsKw0GuFUkVzDhspefK2uhoejMFxQX6pB5OcQmJYA/rDgL7HmY4ss1ZmEzPtZdwakKIGa0FjY0BrxL/86oY5uXajwce8dGYtasatExub7h2qIEi1wHiV1N4Lb6dlWUPD8b2IJiMKTfRgzy3CqovRtzi2Qcas4GnWci7q+7ZmVfWovAH+dzNRlrng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTtUfCbHRo9XyzoKq5KtGz2gbn9skv5YWLgIru9Rnsk=;
 b=dig/4ifY/7+LsIsFc+cC03n+X5jJaN7bBLd+F2HIYz3E3/CGEjqyna+P1Gs4cl5IPcnvyN9B+yj9OOnWbevqNPmKLo89iJi7qb5qZ4xNJub7dexsd8kSQz/9+LfSzakCcA8mAd58lqLNE5n/Nf296udyPh172bwF/Udtefr6U1k=
Received: from AS9PR06CA0405.eurprd06.prod.outlook.com (2603:10a6:20b:461::35)
 by DB5PR08MB10285.eurprd08.prod.outlook.com (2603:10a6:10:4a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 16:54:37 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:461:cafe::57) by AS9PR06CA0405.outlook.office365.com
 (2603:10a6:20b:461::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.27 via Frontend
 Transport; Mon, 17 Jun 2024 16:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 17 Jun 2024 16:54:37 +0000
Received: ("Tessian outbound 1f4b4d2dc326:v339");
 Mon, 17 Jun 2024 16:54:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fef716aef22b9535
X-CR-MTA-TID: 64aa7808
Received: from fd83522892b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6694A071-8031-4FA5-9CD7-45CE38A9EDBB.1; 
 Mon, 17 Jun 2024 16:54:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd83522892b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Jun 2024 16:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCEbS384Zb0ESSjOsPwL39rc8D6fCDqPEw6R25RVlCpnfNkegKlKkwei4soYEvthL0IQT4P7+IGDVttpNdFeWocLNMRtJFMe61U46SwmUl8ELZE1TYJC1ZZ6FrzTRNSWGBHShbO6/vJQqsZhihtQtksNbpKtnK8FQpOn6n6zvgY00M9T23f250R9bBZjjXhkbkYBQTTq4EQVdeSX0DKUNZxStnlDWyzD2QEdwmPMnIJLa9cGz42nWE30+27sb5YnTQbS7xyAXZ0qt8cT+nxm/xXCoxeORThQXPX+eWOGWMGzU6M4VTFnffQ19Axa5AYvMVZlyewiZ2OUkw4BCn4fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTtUfCbHRo9XyzoKq5KtGz2gbn9skv5YWLgIru9Rnsk=;
 b=SNbrbnnt0l5AmfYPUXfTBNzESmiqHx+mLKArqtewcqzelSfYYsP5V8I7UUtpoQDgOPpynJqQa+nQpVr8N4BWgncdjS0sMBrKm25HDnU73SVdkfkrVpwbhXDfGyt0WTEOWNH3f4hdETJ8bWh0c12VS1LB9uFmfSpKTMpymf1gy85oSmt0Z+IHQcurhkj04g/Bav60hsRFFWM7gPMhW5viVtEmR1s8Cx+cPdGVZS8GJque+7JNWfvFQdGWoZ4afKR61SpApLR5wTpE3J7Wc9GX7ynNZJkGwM3Z5XhZ+FkZlYFPJ9vTiuOAklK9Ji/3v3TXQZr00FE5KoQrcHzVuemXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTtUfCbHRo9XyzoKq5KtGz2gbn9skv5YWLgIru9Rnsk=;
 b=dig/4ifY/7+LsIsFc+cC03n+X5jJaN7bBLd+F2HIYz3E3/CGEjqyna+P1Gs4cl5IPcnvyN9B+yj9OOnWbevqNPmKLo89iJi7qb5qZ4xNJub7dexsd8kSQz/9+LfSzakCcA8mAd58lqLNE5n/Nf296udyPh172bwF/Udtefr6U1k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by PAVPR08MB8919.eurprd08.prod.outlook.com (2603:10a6:102:324::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 16:54:26 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 16:54:26 +0000
Date: Mon, 17 Jun 2024 17:54:22 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "Hoosier, Matt" <Matt.Hoosier@garmin.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, nd@arm.com
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|PAVPR08MB8919:EE_|AM1PEPF000252DA:EE_|DB5PR08MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc1318a-fbf5-4ad8-ffed-08dc8eee2c15
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?T3ncv7wpbVLfoq+6YYkkB075SnaaR4ZDeFJAAGrCrxJ3KY3UbOsbSPs7teaR?=
 =?us-ascii?Q?S4c5TnjM2K8DycHPGtNnWvBq/KI3ydVKhk9ldGgBDClvXZf5uYxx747uBr0/?=
 =?us-ascii?Q?CmTHqCUD6rR4RfK5br+E4l389eOVGiEntv6hupwpwPVUJNnpFhVUeldMiVsZ?=
 =?us-ascii?Q?5zES8vs1TiaPZ55vkI5mhuwI7Uuyu5xfbrhdwQYCSJOW9UA0tPmJ5iflW7Eu?=
 =?us-ascii?Q?+k7Y5eWO00Ls31qsFo/ijZqxx9L7zhKaPmrgNeKrlPxBOLvs4nQu10PakY5L?=
 =?us-ascii?Q?lhnZ2uwaN5ErrkB9qaNs8igj5Y6R0t5ijp4S5iLMdFMEvgORQmNWFEmz5E4m?=
 =?us-ascii?Q?PtivtPTqHS0jtn3Wzgf9rP/LwBQ6CJlBFCOLW7TL38cvXFoJDWAhR51rMTPv?=
 =?us-ascii?Q?N6YOtSGWyas/9sJ7Q4KTcO5s86wnPp0B5BE7zZFXGWuAKDrR3GnOpUjIjq8z?=
 =?us-ascii?Q?f4vTBTTK+qF5TuzNQflyeuTayGOSk8JdZuh3tw+V7OF0WyZ7nKnPSX8kOwtd?=
 =?us-ascii?Q?TpEcAqjz7jhBW4AmmAVLqTfB9S+UjC5AZfa5PMf8QhlMNUWBAyI65alDG714?=
 =?us-ascii?Q?07u5RtC6ylDA2EI84b8el8cdJdwjGCzxXvbu97kWpAYPae3HrlRbfzjBISaq?=
 =?us-ascii?Q?/87qyTQvB7Ca2yG/pLWcvzF+xd5eb+qJPgRwdQFW/OwndjM985LBQAVrhI6l?=
 =?us-ascii?Q?Yae+G3eDpnxQ4eev043kfIFeKo60DPNbtL77+dhOzNp2zboK983Z8BuZdPAT?=
 =?us-ascii?Q?FWZ/tPBawB1SZ9B0F7yn2FZRAtfePvqAc8I9z+v6DMveJILfO6MFwMUQFUBb?=
 =?us-ascii?Q?pIds+XLUgd3MLoMF9QzNMdeIMLumQ+VzfeiBTKV48Y38cKbJ/xyRJ0AWJvpb?=
 =?us-ascii?Q?ijsKXsFTDJhU/cQixOsMwIIVYP11nuDl7e79JlVPYVDHGceMjGEsnV2uMkt3?=
 =?us-ascii?Q?zfsmcD5E+pBLmUy7Ur4PX03W+WkgD85ORDtQ0t49RT+njk2TOX7Mbv0rOsvx?=
 =?us-ascii?Q?DyDnrH5DkIfrT5cwEX0Vvv83UgeJuKNmXWDzTUj38zrqbbBph0HUc68N/ubA?=
 =?us-ascii?Q?AT5vygODbl8z6bDEK6xrKmyJQaus4bVQLQ8bHlpuJ6BwfNVcoIHPWGqmTwDo?=
 =?us-ascii?Q?FOPSmD/bYBIJgAhXtdRfJXxfatIX52GUD62piNzb1C4ZRiMvo9Akx7czWjZo?=
 =?us-ascii?Q?4d9uM3UIDaSu003yFoB1G1f9L1UPmxsSeE8UYQm69Vj27udjlo7qVaSwXv4A?=
 =?us-ascii?Q?kuvl1FQ/+0sJplf2bZBu?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8919
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 277edb26-b793-4bfe-ade7-08dc8eee25ce
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|35042699019|36860700010|376011|1800799021|82310400023|34020700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+5WSK5D7jOWkIG4JMBj/NRtHoIt7TCsepObHWjIeWjwg/SBaIrJmOLcw7roj?=
 =?us-ascii?Q?aQ/fowWyoK9R2wUJ942c2Ftc0sAM2dNSyuG5z71cafosd/hSw2Y2eLBFcRy4?=
 =?us-ascii?Q?D6DCuK8djkHelktbMZh3QmCMTy9d/Keev2270qlMacbaI0KP9DxBG7J23cAU?=
 =?us-ascii?Q?pi80dsWl6vMb5Z5zuaQ7RQ6WPBl+rJ3JKfKv6tMZWWN79D5qChiCqgHyl9VO?=
 =?us-ascii?Q?iDC6M2/9CYVndYXEfmPTOQfB+DikS3C15JSQ2NVFU/cvtMYskqGjDMVhe6EU?=
 =?us-ascii?Q?qGpcyH2C54ICFIPkLUuBNDntsQaPWhk6qEO7H8Z/TzvHHjYqKuCOYEWtcxv9?=
 =?us-ascii?Q?rMmzbJPHpq7In1xTNobkFqIlPcwg6SdbyH7Ez/MUV13m3sO28190NRp6RZPM?=
 =?us-ascii?Q?pn5ss3GSTE7lrB4ULeIRZJBqSv8QkKkam3IOTyVBMle0t7pDQiNUN/vWpnQJ?=
 =?us-ascii?Q?B+D/aQZ2CsiOwojVTuiF4M15RvkJXxAF69riwnXMshLyoOzRb9cIjOxZ/ZeR?=
 =?us-ascii?Q?+sYhDj/UpthT+vG7lR6FH7V53blUDqDfercNM9+XWUcnHEX7KtdyOnvlVwOZ?=
 =?us-ascii?Q?bktLdnKCP3YBbD+F4bXEZjFcJu2h8Ext2PfwSXvc+KXl5bM45ejMBepkAIiO?=
 =?us-ascii?Q?TOOp/0jLE1TZ06oH8s+IQW9FEsFQwKAUn9YW3kR/QzoIn6Fc/LCAoxkuNvhP?=
 =?us-ascii?Q?x4h7RKmwWI8cF9Gb053gdhyOkQjEAmlMA1OJpgNqprdRBUr0ajrjh0erz6lv?=
 =?us-ascii?Q?VlBUlMgNl1YblzfKYx89hfZhWsJBcKXEVDQq18oZ0zHZaFP/ZczYxmMQrmrB?=
 =?us-ascii?Q?n752QzfTGwo8v60KOjIDJpZgYhJdchV2csoYvz1Tw4VIiwqwNYggU/Lwsdrq?=
 =?us-ascii?Q?PIvX8Jh7CKcsQctfYQigt6VK/e8vNZZ7Vv8IWiLxSmuAsLr9PgOKheiIU9hb?=
 =?us-ascii?Q?27AVrlVkU9xU7x87xvDALrBkqF9d1nXtC76YSbF02Fj0HIhUSSHJJ9AWs4d6?=
 =?us-ascii?Q?TA7Vb6DJS4YngIFgS0xoAozRGYnPqmq2+6zSRRDYBdSx1Pme7qrFBkFrxi4+?=
 =?us-ascii?Q?LGOO4+vnA2lKrI4QTSbdkDsDEFVOMNM7f89pw8WVG9/zzWDTb7uYpnb6IAwz?=
 =?us-ascii?Q?Dj+L/jsSdS6bR0AEz4ast/pqj1QOdpHS5YxIRAANLvfO3FdkZLZJD+UzMl9l?=
 =?us-ascii?Q?KXrIB7xOVYa+ayiimbHJ9cyYGTc6xZx36Oo0iZRec7pF6T/uujNfamoIzoC5?=
 =?us-ascii?Q?kguU5xUJ29XuGg57HMvzC4oGUHXVdoTuWRmZnFKkOQMkDHSvjiTzRWWVejEB?=
 =?us-ascii?Q?zPICppuH8ktF3244BY/ib9Elan7se4sidX20ZhWQUhJVdWl/+gJ9wq95asdF?=
 =?us-ascii?Q?kjTiFxw=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230037)(35042699019)(36860700010)(376011)(1800799021)(82310400023)(34020700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 16:54:37.2298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc1318a-fbf5-4ad8-ffed-08dc8eee2c15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10285
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

Hi,

On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
>On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
>> Hi,
>>
>> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
>>
>> >  *  "WRITEBACK_OUT_FENCE_PTR":
>> >  *	Userspace can use this property to provide a pointer for the kernel to
>> >  *	fill with a sync_file file descriptor, which will signal once the
>> >  *	writeback is finished. The value should be the address of a 32-bit
>> >  *	signed integer, cast to a u64.
>> >  *	Userspace should wait for this fence to signal before making another
>> >  *	commit affecting any of the same CRTCs, Planes or Connectors.
>> >  *	**Failure to do so will result in undefined behaviour.**
>> >  *	For this reason it is strongly recommended that all userspace
>> >  *	applications making use of writeback connectors *always* retrieve an
>> >  *	out-fence for the commit and use it appropriately.
>> >  *	From userspace, this property will always read as zero.
>>
>> The question is whether it's realistic to hope that a DRM writeback
>> connector can produce results on every frame, and do so without dragging
>> down the frame-rate for the connector.
>>
>> The wording in the documentation above suggests that it is very likely
>> the fence fd won't signal userspace until after the vblank following the
>> scanout during which the writeback was applied (call that frame N). This
>> would mean that the compositor driving the connector would typically be
>> unable to legally queue a page flip for frame N+1.
>>
>> Is this the right interpretation? Is the writeback hardware typically
>> even designed with a streaming use-case in mind? Maybe it's just
>> intended for occasional static screenshots.
>
>So typically writeback hardware needs its separate crtc (at least the
>examples I know of) and doesn't make a lot of guarantees that it's fast
>enough for real time use. Since it's a separate crtc it shouldn't hold up
>the main composition loop, and so this should be all fine.

On Mali-DP and Komeda at least, you can use writeback on the same CRTC
that is driving a "real" display, and it should generally work. If the
writeback doesn't keep up then the HW will signal an error, but it was
designed to work in-sync with real scanout, on the same pipe.

>
>If/when we have hardware and driver support where you can use the
>writeback connector as a real-time streamout kind of thing, then we need
>to change all this, because with the current implementation, there's
>indeed the possibility that funny things can happen if you ignore the
>notice (funny as in data corruption, not funny as the kernel crashes of
>course).

Indeed, the wording was added (from what I remember from so long
ago...) because it sounded like different HW made very different
guarantees/non-guarantees about what data would be written when, so
perhaps you'd end up with some pixels from the next frame in your
buffer or something.

Taking Mali-DP/Komeda again, the writeback configuration is latched
along with everything else, and writeback throughput permitting, it
should "just work" if you submit a new writeback every frame. It
drains out the last of the data during vblank, before starting on the
next frame. That doesn't help the "general case" though.

>
>If we already have devices where you can use writeback together with real
>outputs, then I guess that counts as an oopsie :-/

Well "works fine" fits into the "undefined behaviour" bucket, just as
well as "corrupts your fb" does :-)

-Brian

>
>Cheers, Sima
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
