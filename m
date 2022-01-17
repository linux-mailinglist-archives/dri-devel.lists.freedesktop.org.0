Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A350D490B71
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1FE10E2A1;
	Mon, 17 Jan 2022 15:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351FC10E18C;
 Mon, 17 Jan 2022 15:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCyv4slg0AQ2+S1xnKO2eXl8pWYet+IVWiWpCykz9DJdXUi2sovbmO3a58eUvSn/n8z/gVKdjmiM15BYelfYw7NwC5oCnnTw6WY0ndj+xwbkWVT+xzZQqOFEqGpfD2/kkjcBkCM6bLwPeEKIlO1oypz12dw65lTMyrdD0GJ98mA/BLvNmBtIy9wl2jlqTjcFu7wXO5COf8b672yZjV5T0IGHZH646Y6A4GeMCZNoXKX2oyld5dg3L9AuRpzU489JykwxdyrAvMAfDH6+3lOfSRdtuG0SJ2MGcAw3fPrVcfco1OJ0Bbt8k4CZs6pChip9NBri17v+Doisltylhh3RVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmR8nNlMg+f20Zz/n46bTCzy9mvqcGENV0DiAE/L9k8=;
 b=GYGTr5RWXLon+joqraGj6vCAke45DLZk7BGoXzAV/BR0bK+Oy/GL1iXUQI2IL/fC/YaqkF5i4BuQi5mFvU1Sk7cz6+SUxnj5Rsd0Dnyhq81EUY7m0pvcy24aIhIUv3NcjJHrXMyFcr6EnENckJITUaCQbl5j1NXQMhEyOVV7fNCCwQysfCFDW/Gdu4+Ic2tBfzDJzXKUqADpa1PuU0+ytDIXBVLZPqEFuW2UjipSSbb6UEFj6f5uF5ub+dma7zrKUqnbXSvNE/9wZptYFKWNo8XN+Ym+iVp5+RDmn0d+WnqeQ0tGPej+WPsCb2vxkwCJi835B11YQMp3PPeZ/gsCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmR8nNlMg+f20Zz/n46bTCzy9mvqcGENV0DiAE/L9k8=;
 b=o6ipN4VRRIUwwHY9wlBsd2JDfe8vOFI1Hion4AxR3TLQv9t0hgEBuNiYydDBbnWs16gN4ezeFqDEH+fzcvxHvllm+nhUsl2Pd+MRc2AsWSfXw+WblldbJWRh9yJPUY1cxKdY5RXM9gQ09FNICalaoi/uYtW8pTjsXw7bKFPewAijyGZ7vSrGH5yirQJ2qjV5o9DuHth27IaruNrYOSWdU/qcFbzXD2bFQ3pXpEm83Vsufseh/9Cv1ZjupYHiL7NzHe5tAIkXxWbRn4i7/QiFxKWd4mSrfaBQIto0i/GZLzgZERD2/J9sCM/K0hCV+jocOuXHz+rUvtUzL4ukP90ecQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BYAPR12MB3541.namprd12.prod.outlook.com (2603:10b6:a03:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 15:35:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::464:eb3d:1fde:e6af%8]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 15:35:28 +0000
Date: Mon, 17 Jan 2022 11:35:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the
 struct vfio_ccw_private to the mdev
Message-ID: <20220117153527.GA84788@nvidia.com>
References: <PH0PR11MB5658A7BB11922E5B6267892AC3619@PH0PR11MB5658.namprd11.prod.outlook.com>
 <595bba117f20742dd581fd951555b0e1f630264e.camel@linux.ibm.com>
 <PH0PR11MB565874CB787A1ACFB12CFF6CC3679@PH0PR11MB5658.namprd11.prod.outlook.com>
 <24628dc7-c6b2-1287-b435-e12e7b3d59a8@intel.com>
 <9866678ecaafffebbfad8493e192e248b8be8f27.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9866678ecaafffebbfad8493e192e248b8be8f27.camel@linux.ibm.com>
X-ClientProxiedBy: MN2PR12CA0007.namprd12.prod.outlook.com
 (2603:10b6:208:a8::20) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3a4f5db-b8b8-41f0-de87-08d9d9cefd28
X-MS-TrafficTypeDiagnostic: BYAPR12MB3541:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3541DE710AADEC408E1E8405C2579@BYAPR12MB3541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sp7mp2jL+13KpP1FbhzF4JTdRShi/tPTrMlvRhX1KC8HxfpARtKNqKbx0/jCtrDshJAP27lIO4e3rMp0Po0Ep7lE/PGbN+z6JXpk0/oudZvRLo5jopVbh+F4C36KcA+9P9dQ4ThN2FrU42IEFO77oopOCI87Ssmcw34xfuscw8HvN15ZgC9AgU5gllaj0Sybr8u+02U4E9TxiAdsw3/4lBkDXX8XgRWvX2HAPf/AFJf6NYxZ7/pTqp4WcEB+zRVcXwt2id+AVsZDWECymAMJYjG6PmWouZ5dOR8mDwpHlfxtp88KZj0VDH1GN5DoyNgr7E1WY8QsS54glF8OLrPj6athF6l/O47oJIq6raN7MxAgMrKT8c0vrR/RAI7+L607JrIo5Mp9wq9QZySXZW4iiXJYtyNeDo8CeS+2Dnpx69F8RGoCpbVLsl5FoSDo4lT00npR87Bhb6jbfgTkxnhqqyMfO9lk4dPN4vgq837OGFZiWFGUaNWMpd9pkLXw/ao1/AQHvSBP54PIWmr8+XfOgrTLxc9B3XaFcZAMcOXLdo5+0JrW377U4qkMtpIXZsB8KaTV29aAaHjvWrmd2ocTsBlUogXN3FaB457kahz0dZRoMtppMSjPyb5DDFNJP+zY14zCuvJomOhuZsJqUb0fYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(33656002)(2906002)(36756003)(5660300002)(6486002)(2616005)(1076003)(508600001)(38100700002)(6512007)(4744005)(8676002)(7416002)(4326008)(8936002)(26005)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(86362001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyukQBtDx0LlPmbjquT4fLQoyJbSeqpaVQwX7hoF9QG8yh3y2bEZGU2EQ66Z?=
 =?us-ascii?Q?t0iaBBT28cGvcc9aWdzgVEmbTJJhauaRLdnjnxxf1885YYJEf+KUYirxiDJi?=
 =?us-ascii?Q?eNB6MG5dnyFAWUD1N8i4X3HMOEUmRFm20FMbowUuBylZUiEOGDYDyxaib20h?=
 =?us-ascii?Q?KCnobwQlvkWk/Tgx+K3EyZqOg0CsUjxR3oC7CRMJJsB0oJRE1EJwm8+vMnyt?=
 =?us-ascii?Q?MGl0qfWDSnanTzSTwtjUlhrOH4/vYXlgC0bo+Z68I1epqXloC/YWikpq2WjE?=
 =?us-ascii?Q?OWUJqpeGok9DZfAmcVEi0mQ/OQ6LopAWVzOZU/aiRu44pweo39YHB8zdi5Vj?=
 =?us-ascii?Q?jAohhR2WqWeND7y9iz7UqB2eWNR4zGKAYkUJWhjYwAHBn5WDt/mUE6TsdwUc?=
 =?us-ascii?Q?Wjwku9zKlp0aT/lqzx8YtacMw7B051FPyBle3s+G/UJarY05mVVTOYaIKIof?=
 =?us-ascii?Q?1HuZWHwtZVg3rA3wqqRX7KWJ5yCnztUpScdpJtDBUb9NS1WukFw4LattC9bY?=
 =?us-ascii?Q?opbWLaGX/1TckN7UQbpAoGIh+7uF/V4wFPcSOSHMrRSI/nVOGIXZzoMQ/8AY?=
 =?us-ascii?Q?LViWzQdkHbmqs0/DNxrkgZzaH/4uWuwU07TQiFrUSYzhmx/lo3uNp1XCoir5?=
 =?us-ascii?Q?OUokwI6xHUnci5u78Xte0BLdE1zPw9ckN+t8zCfbbFkb5tgMyoZBMOdlLmcq?=
 =?us-ascii?Q?wMkZ8qs8KHzgiywCWwp4Xd7S+9pH8eB0AHTFfSkW6aJ10Z+qStWVv6+4v9/S?=
 =?us-ascii?Q?cbivC3COgGq8iBjlbRdRFnC8/Da9xB0IZkNgolKuMS2WL3VksebimN/GUVr4?=
 =?us-ascii?Q?rt+U7/v4WOfMwf9c7xJQo/GHP6TFxj3GK+LUlqYQqeKNJQLC09GTtZZWck1x?=
 =?us-ascii?Q?NXDI+phYQR9HPVpGZzUQf1bIh/eGwZytPkYzdpaSQs5xZ2hs0Wn7zUpJWEBk?=
 =?us-ascii?Q?tTwuuLt32FSz4TkM6oDoeHW6jSlYC1X15SZoXKI0oqZk2UfTygcYeNEEMohE?=
 =?us-ascii?Q?MQnptHaPJVkgWkeO1eIFKu9UAopBt8M1HeC8kL5TEnGBfqnEYjliIsEo5qGb?=
 =?us-ascii?Q?eonB+BptfJnlrsQnb671YIqDMyVBhlW0YjQGb2k8SXvn1fmMI1ZBoefA2/NW?=
 =?us-ascii?Q?o0R8KjR4gnajbZjQ7238Vmnt1iriPCFatsN2exnO1MIV8HODgx88nSWhaPF8?=
 =?us-ascii?Q?4xzidDnhi6t8B/QeGW+BrkBy8AnGkOJNsW9vEpWKSyVeXr8m/uiW6nDQlWpj?=
 =?us-ascii?Q?6FiTqIzqS1ROh/YCitAU/VmepiCS0CY+ZEQiVyxou5toFNwm2LIG1p8Osf9F?=
 =?us-ascii?Q?vS73oOi9BYxkI+2ghZYpl+I49037zU7r11JRFl3W/URGwmS78/DogUUcuMjZ?=
 =?us-ascii?Q?8BX1bXSYvaLPzxIu+9q7CSTC6z+qZ2GS4tgiVNMQan1mkn2VD1bO5gDHp+l8?=
 =?us-ascii?Q?2fn7U59vMQxEWDkyKrIpANJvB4JmrQD7Pk5MbBz0bjWYqkt1j74MXMQ5PY2w?=
 =?us-ascii?Q?Wj35b4V/0zdEXvP9RMcIsOWq0yC1tWudybtZuIAU/N53p3m+uIPUrxRN3wub?=
 =?us-ascii?Q?ldL+0x19ZU80CY/rjNc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a4f5db-b8b8-41f0-de87-08d9d9cefd28
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:35:28.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fus8QrqwSSJzq6Bxuf9AU4cl9BQvkZnzxzH3kj/PjrDrCec2/PRKM/LrQHhlwK+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3541
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Liu Yi L <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 11:30:36AM -0500, Eric Farman wrote:
> On Fri, 2022-01-14 at 20:28 +0800, Liu Yi L wrote:
> > Hi Eric,
> > 
> > Hope you are back from new year holiday.:-) Have you got chane to
> > consider
> > this patch?
> 
> Hi Yi Liu,
> 
> It's coming up the list, but it's not there yet. Haven't forgotten. :)

Liu would like to see ccw use a normal lifecycle for the vfio_device
backing memory, is there a shorter path to achieve that then what I
came up with?

Jason
