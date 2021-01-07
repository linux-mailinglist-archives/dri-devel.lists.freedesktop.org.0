Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B22ED604
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4166E4BA;
	Thu,  7 Jan 2021 17:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEE36E4B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOzi0BF94itj6Ey+x2poxw/Nm8Q94jbfkk1VgguvMZH3DpyaXafmFz5SKddCYGzQQWBut6JsmL/hGqMoS7UWdorsWZSlvmSn83CvvbD6GIEXm3j+iqX1KiVWhGmMrf8PJQ2azw3vEDmPftry1HZRoGqqXDNg8yeDZb5DIyamfASzcNf/NHrXfp5dELD3SpxblksnuwLEyZTPAfcUb6nqtG+KF3mAxG6eTfhKpl6PZ3Hz0648k8T7Q7/4Z2630Uixcy+nxN7h4PkeHw6C7ugHffiioPk9kZ4aWeiI57X9GjVImHpantUQ/WYicYCIyOPyRsyQ2qr0uVcszcgLpOOP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWxLjz4LseBfUY3MCQckcJBAJIwDZcJnJWBT+aGHAA8=;
 b=cpF3T/Ydmolm5yUKsNr7u5ZREkBqY7tGFm7klLqZT2kursSNUvm4b1+XE/+vkpowj8eQQU/xPCN7Nx0rsWQSX7Gl1ve7q9Kcxo9hVZk6GNPy1lIQQWGzQo7KikJnFViit8bZIi2IwgKgGpe9ZXFMKJGeIh1CxlAEkMvxa0QICkH08Y3BbK536VYoW+4NQDJ+8kbiZyyRMzewMux04M4JCs+YZTtvvmGR8E4Xjf2sSdxSKcZgwFFLoNG3yXUXKj8nQ8zgGrNUPuHyP8sVtaZX+gKWHfJntI/UQKaWF+ZMmWB2AnH3lNzUNDndKOHGFSxUD2DVr8St0X1cdvCtTwjXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWxLjz4LseBfUY3MCQckcJBAJIwDZcJnJWBT+aGHAA8=;
 b=cHIUCyY3s2b/Hqn8jaw5mhuvlQ3NtABKa3Eu2NhkI3KfODjyHk/GgTqwalEXoHF1ae0rF6udSwjVMvF3xhPvPUX4KKosNEeTEZyxks2spcgvi7yMJklRLG1YOZ9D2AI4zriIkc671SHYIOnZA3YbVc7ggFgiUjKuGPlmbz2bF30=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:50:46 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 17:50:46 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 0/4] A PCI quirk for resizable BAR 0 on Navi10
Date: Thu,  7 Jan 2021 18:50:13 +0100
Message-Id: <20210107175017.15893-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [217.86.111.165]
X-ClientProxiedBy: AM0PR03CA0093.eurprd03.prod.outlook.com
 (2603:10a6:208:69::34) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.165) by
 AM0PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:208:69::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 17:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b55d7d7-9e20-4c6b-6070-08d8b334c2fb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30660235526160DFD6B9D3108BAF0@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwhmuoR+vRidJI814P89aSnzZIRcxVrYdNOuvMptBy8HP7oZE/+WFcloyEAOcvEfPsb+H0M7ZRbWv00a8NaG8q1npQNw+Kuno4ycLfUOcA+9zN13wxqvO8COzRmoWVGpDO/dvxIPUrbmngPbaMtvgFKa2E9BVuM/vnl8JduKBF5l2NwdXemZZ2Uu8oXhFhw2zqj0I3yX0Rxf/VJrcshc98DBc8hrW/5YETg5TD1gra6vOb+YNzDIQpKKKE6WsWd/jTaICo0Mp5AHSXclKmsEZ0U3U9KqZoKjTchQkf/3zYVPWudpIIQhBfSb56ryoCY58WH4ektPSFHT/QZiTa/Y45XCJmq9baziKYUsKlL1JA1hMsx6BYF+d976ipxAFx+Za7T4RYTToSSgJuS8uEBgTkxa8x+WICb6/7PuMxR9tlAOZR6vyFW3xGP+lyzXHlbjV9GEgUBG/nZH/wX+YXBbxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(966005)(4326008)(6916009)(316002)(1076003)(478600001)(6486002)(36756003)(26005)(66476007)(66556008)(5660300002)(8936002)(66946007)(2616005)(4744005)(16526019)(44832011)(2906002)(52116002)(6506007)(8676002)(86362001)(6666004)(956004)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dktTOENKZytKSmR6cHlkUDg1bzQyMHRqMHBkYi9RSkYyRWpneEtkdkRibmIv?=
 =?utf-8?B?YmQ4WmJrU09IQVhtK1B4SmJ5MEkyOVEzVjZ3SVhoS1NxVlcwZzB2ZG9vYW9S?=
 =?utf-8?B?cUJmOE5HZmhESHZFQmNTeFVoY3V0ZE9JcVplNnlWdzRzOFNXVVRacEI0N0J3?=
 =?utf-8?B?bWphb0xYcmRzMDQ4ZHFSdFZONVRTTkhkeExDN1NrZFErK1VISWk1UWZxU0pn?=
 =?utf-8?B?L25GZ01hdnVHNXo0eDNaMmw2SlA1SjR1ZW9OdnhCM2o3bEo1T3d0RU0zWkR5?=
 =?utf-8?B?dlFtaVNnZ3p4eDI5RU5HbmRMbDVxc1BpMWdoRTVrSERVVkxLenIrbUp6UmM2?=
 =?utf-8?B?eHJTK2RVWmJhZXBJT09HcjdjTkQ1djdURVZvWUVsU2tGb21xRFJra0tLQ2hK?=
 =?utf-8?B?cGFIemhxZjNlWHZBUGtnVVNiTUNNSXllR01qbVFoWWdDZ25QYzNtclR0M1ZJ?=
 =?utf-8?B?amdjQ3dQRE9weHJ6Uld4MFFTUksrMW9zbkw5akxldFArY2kwUkx1MGY0bnB1?=
 =?utf-8?B?Z2E4bnpVWmI0UDd2Q0lvaTROckU4NnZ4bldBaW02dXVlOXFRTVplUTdIMHFo?=
 =?utf-8?B?dFk3c0twMWdwUjd4c2hNYXk0SE5ySFl5aFhEY0xRM2NhZXRFU0ZuRUpsbS9E?=
 =?utf-8?B?YUx5Nnpjc0N1SWJtQUhCT0xBSldEa0UzL2tQNEVldGFoM1VhcXp2Ry9nTmhU?=
 =?utf-8?B?OVVHbmRqZDJYdUhyaDg4VDNIem15WUQ5NXpoVEh1N2JQNDVIQ3NUQkQzR2RQ?=
 =?utf-8?B?VytBNEZ1WUpkOTdYM3BlSlNtbTlpZGkraW9scVRGTDNyYzR5a29jNVo1SkZM?=
 =?utf-8?B?QWhocjVqVDQ4SzNTdzJ3eldVcXBjWXZteC81RnBIZlhSa1lVZzR1Tm91eHdZ?=
 =?utf-8?B?KzNXbmMzajgvbWtSbys5TllZUHlOd3JBUWMrOUZoSFk1eXNsZ250TGhEVk0x?=
 =?utf-8?B?enp0MU1lN2trUnQvcGVVNmQ0Yk8xdVlJYWlncjM0aDlJSWh2UXB2Unlzd1VR?=
 =?utf-8?B?TUc5UWJYZ2VIcVhEajl2RTZNNGRwd2FZbXJGWGx5Vm9qcVlSQVNQRit1dU5m?=
 =?utf-8?B?MXJZWWZiQ1BWK2JORDBtc2crT1JMY2srTUJETW4rQXV2bzNBUWRTbUE5K2NJ?=
 =?utf-8?B?bm1sb0xWRWNMYlZHc2EwdDAwUUc0T216TVFZdUlzMllEVEk1OVBVZ0ZISkZS?=
 =?utf-8?B?VUgvc05nUFY1TE94Y2YweGp3VHM3S29EQzlOR1phWlhTMDRicVZOeWl2T2w1?=
 =?utf-8?B?WlhuTzBNcmIrUllCMzZBVHREREFBeWNQd1QzaW5LMXhnU091VDdUUklhZmsv?=
 =?utf-8?Q?fbr54K+SLLeI/5A86SGg73q3uRSvVGAfNq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 17:50:46.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b55d7d7-9e20-4c6b-6070-08d8b334c2fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxMM5twa+XggW0MAkM1R4VC+JODTmBJffczbEwj76bJ8+2Qj+05Cft8ktLnpJINKveCQAQLo0R9Q/qDvM1+vrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: devspam@moreofthesa.me.uk, ckoenig.leichtzumerken@gmail.com,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

I cleaned up the patch series[1] that Christian sent
earlier to fix wrongly exported resizable bar
capability dword by VBIOS of RX 5600  XT Pulse card.

I didn't split #2 patch instead merged amdgpu changes
of #2 patch to #3 patch and removed changes related to
pci_rebar_size_to_bytes() as it isn't needed anymore.

Apart from that I clean up rest of the patches as you suggested.

Please let me know if I missed something.

Regards,
Nirmoy


[1] https://www.spinics.net/lists/linux-pci/msg103422.html

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
