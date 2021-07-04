Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0513BADA5
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 17:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349F68984E;
	Sun,  4 Jul 2021 15:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558D48982A;
 Sun,  4 Jul 2021 15:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0ulAHSKcAf5JT15Lykmwsvkb0xqyarfPk6dTvnN6YAgdxxt6YzDEMoQ5vyBSp/m5fFZJwRVW4pgpqiKzvNNaFXG2Tkano+z+DI0vp+14fIOoihLTL0S2MN5hEmVSmkfNAFqMSlA1pZfsW7XdoIhyedcdnAC2gr/3Z2iojAsNWMYR+qkDE5mjwqEsjS6TANwhEnS6m4tKWWwCXf8cYzRyleQCYb/Eb7PH/pFELgIAEakWZK1bVtD2z3ZeiPe1G/eN/OBpWmfHGUyU5wlctUfuiU7w5NyuJbD/5ho+R9hrAakY/8CX3XHjhz1eUwtoTnU/4a0YxQPuoEqZKWHH41eRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV5jJmoboJCXeL/BtOwYzkPX/SbxRotqs900KKGZHnw=;
 b=U9gs+V+PHsZ2SXNhqkLrL2TtzWlCaF0/hszEwjTVC4abbzymbL+vVYBPvmra/ocR7MTcFdnruXOHg7i7onojjvqCPy9XuZ67s7RyM85uuUN4x05szERfO0NN6I0huyYaL5Ll5aFs4L7Tx/kQfYh1XmjNjmcL2VXOZWBj7JCKxqJKFZgXiimjTJfOKXwJBqjqKTCtuAr8l0nJyq+vd5YkrxKKVjvBVhynCBKqL+S44VDFqGdFMgad6Glsotu5EGwXHKfdx13il48UF+SpGd4BQ8z22TfDfOokkGbzmtQNSrJ1apCycX3hGT5WgTTunyd0JduJSaUMSXK6ZFaCf1JNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV5jJmoboJCXeL/BtOwYzkPX/SbxRotqs900KKGZHnw=;
 b=AinY7xcZYz8YCWE+IzBdw0uSQr9/mlfvfCPfDovfA/mr8gcS/OXelA3I1gQ3q/taIUyD3mOnLXIjcy45unB4O5fowtgNhOpAXknO1Ku3MisAkN0SXpvRVCBAE03ey48HeKCBrDx1WqHD8V3+v5xwI+mvFyWgUXlpbCx0yv9U1fc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sun, 4 Jul
 2021 15:18:37 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257%4]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 15:18:37 +0000
Subject: Re: [PATCH 1/4] drm/amdgpu: fix a signedness bug in
 __verify_ras_table_checksum()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <YOAsdyWeZAHF0oll@mwanda>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <bb78075f-2249-8311-2f75-c0dfaa333ec4@amd.com>
Date: Sun, 4 Jul 2021 11:18:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOAsdyWeZAHF0oll@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Sun, 4 Jul 2021 15:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c93e13a-e268-4255-9603-08d93efefec8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40582FDAA598CD6224705FE1991D9@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yRY3P5BXpmB1qhbOGkHAXkbuKW2jvWMLr7pHXU/5nnUhHfBDrms4Bvh/X+BbNT3Yn2lVMJKfYRJ9IVR9mGIWc2olI/36ogGTjxFnfkYPFOHz9Od1A8xayHD8nfMRCEFJ9GXqU/OomKsa2HexAC37QridkVTnisr6ZX+tgsJbQP2L3WgjFJC/pdN33EN3flERqeVlCydhzNGRL87L01TkcRdvhoYjbxijcreuUqZ66mF+KWfsja38wIQNhYXVQaGig7hOukQcX81mQYBWLTT3wtzWa5hxsxsafcgXAZRFWVd0cADa4KDqpFU7RFzYZcK5FKxjLV0boi5JrytMPidNrkFay7z7U2YoLZh2XJuoI8Ou4IcrIeyTJ0OzSALAIS7SUEbKMVkpk09JLZGyjWihIpWhJG58+f/jes+gynQ/gqmYDCR6P7FXairl+e5R3tQ1QKeHvpY4/nG6zXf5GJxmBNRrHSZDeowlDZV4V6vXs+MbukLsBjrhDhbEZaKroLW4ShIV3VeS/wmRAOQ1oC+VgC4SkYebXbfU4/XQLNRW7cNv+Nt0/BKwSGvQeWx+2494WSL7C7yxFrP3dUIw8wjaO8oeeJuZPANxcd5fxZD0KOXHPCT4DDsqi+RgECKEfIQsfZO2/93H2FzYbzWs9G8cupPXt4ZiHfs0O8PqUjtD2s70qhzcb422OdoIwbktPrNkuqOA3mPHNuP0em90thVKBMqHZtB9Q8JxKx2+5mvAUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(31696002)(86362001)(55236004)(4326008)(83380400001)(16526019)(53546011)(6506007)(26005)(6512007)(38100700002)(54906003)(110136005)(186003)(316002)(66946007)(5660300002)(36756003)(6636002)(6486002)(2906002)(8936002)(66476007)(31686004)(2616005)(66556008)(478600001)(956004)(44832011)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3cvdUFHQmYwZno1ZWI5a1VuRXlqbG92d2NCWng0UTYvNzJuR0FuRzYrSVN3?=
 =?utf-8?B?cVpqSmJGeEIzenpMMTJTRlBIVktab1E3b0gvQ2lhV0p4aGRHSjlycVJ6eG5v?=
 =?utf-8?B?R2hxc09nSkd6d0RjVnZRbW1zNHBES0Nvb3prK1Jmb0dIcE9qdmhSU2tvY1Z6?=
 =?utf-8?B?aURxNW1rZ0k3QTFSQlhwcXRWZnphN3o2NmczVUY2UU1nTzhzdjIyNXhjMm5i?=
 =?utf-8?B?WWQ4RkFlT2Nmclpoa2o0bkgrc25qMno1aTJ2K1Mwdkk5WncwaWV1c1NyVVNE?=
 =?utf-8?B?eVVLTFYvTm5pTy9ub0NRRDg3SXFVVGVrcXRRM1JRaFZQQmd4OFlUR2RFRW5S?=
 =?utf-8?B?TWM3V1kvdjdvYlc0Z2YyYUx1MGk2aGh1VGg3cE5VdDhOOVJBNGdiYXRQSWgw?=
 =?utf-8?B?eFhydXY5SGhDM2xXeFBueVZmOW9qVGFEVzN6VDhtbHc3RlppaC9hMlM1TlA1?=
 =?utf-8?B?Uk43Slg1QVVQZWxxY01mcXF6cnlqOExEa2VtOEF0Z0k1S2s5V2s0QlZ1ZzVF?=
 =?utf-8?B?UlRlNnVvdmVDcmhiaHl0T28vdmVjTGxrUkFsY2ExN1E1Y0JHWjVQQmxhc1I2?=
 =?utf-8?B?SmlRbUNFVXVtdjhkeXJjQ1ZjMHl2eElIVW9pdHlXcUo3dTRJLzZUUjRKOTdP?=
 =?utf-8?B?L0lDenZSYkY1UjdXdERhQTlaNDZVeExtYjFhN21lSTlrVjN2dzc1MmRnNmVq?=
 =?utf-8?B?OVBUd2YyZG9jWmxOU2xBWGY2S3djMG9rU0gzTDN5d29oME5zMGdmZ3hrbXo5?=
 =?utf-8?B?UHJEMWZrS0VJM2JlQlpHY2NHc1JjbzdmRjJkd2ZncTNHMFZCc1oyMGNiSmxO?=
 =?utf-8?B?ODBhYi9Rb2JJalBydlJFVDNoR21sTXBBdXhGNkhRYTQyVC8zNkg5dkNlK2hS?=
 =?utf-8?B?T09CV21mS3lid3NObEpDWTh1VDQxTmtUNkRLbFhLMk5wSWdtajVhSXdtNmNx?=
 =?utf-8?B?YlFhK3FFMEFPWjBvd0hib2IwL2lmazZrZEJtcHBEbFB1OFprVkFJUk5aL0o4?=
 =?utf-8?B?VXRzVzBrTFdIZnVVY3Y0aTRpeEMyU3hQWVorZ3IybmRzaVErRWw0bzlMV1M0?=
 =?utf-8?B?bUFhTXNyV2dYLzJUMWtBREN3MExTcFc2R3lwTnlsZWdpQk95eEdvSFVieFpo?=
 =?utf-8?B?dXlFZmhzZ2lMcWEzRjNzNjFOYmhhVUtydVdxckZnQ3hRbVc1TVU4OXgwbHFk?=
 =?utf-8?B?dGpiOTJ3Yi85MXNYbXVsRE9GOTl2ZUNrTjdmblNRT0dUY0FwMzRBUjNhN25C?=
 =?utf-8?B?TUdrNC8xL1ZDc1R1N3E1TWRmSW1DTlpFSngybW1mcnhvdncxMjVQZEVlNEFT?=
 =?utf-8?B?SEM0aDlZUWpLY3B5SjNBQ2l0WllWWDg4ZzN0RTNjaXVzSS8yMWs2NE9NQ0xX?=
 =?utf-8?B?L0Qxa3NPaFR4aytYSmNjdnVmajcrWkpvR0xXajRtSEdlTlRhb2taSkVZZTJW?=
 =?utf-8?B?YU5ESmZXUGkzQlJSQzNWUVcyYVY0bnE4NFlXYklTTHBhaXArME9MSGltSVND?=
 =?utf-8?B?RCtLbXRDQk9WaHhIL0J2anZTRGMwcitKc2tFVll5eFJKM2RLYTJ4dUtjdWJM?=
 =?utf-8?B?dGN2VnFmOC93c2VRWnpJWXNST3ZraXVyVHlRTXJIaHhBM0ZGelZyWCs4ekpC?=
 =?utf-8?B?VVJTNVRyNlBwckZwbWRTWEJZWE1ydUJEekNHYnI0SmhvZFM1WmgrRS9nejJu?=
 =?utf-8?B?MlRvWCtRdGo2T0FoYXhBM3NMQ3VDakFRY1F2TjVYTiswbUxSYXRpU0x4aUh5?=
 =?utf-8?Q?GyNglk6qOuTGKsbRSat6eJgx5HEmM0qhbb08o3N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c93e13a-e268-4255-9603-08d93efefec8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2021 15:18:36.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc6ntGd7Bqebinvw2Ix9gs5oQBOP2VGxu7pMG4D835M29IyqhZWU5SLtpHTAO2VE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is,
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2021-07-03 5:44 a.m., Dan Carpenter wrote:
> If amdgpu_eeprom_read() returns a negative error code then the error
> handling checks:
>
> 	if (res < buf_size) {
>
> The problem is that "buf_size" is a u32 so negative values are type
> promoted to a high positive values and the condition is false.  Fix
> this by changing the type of "buf_size" to int.
>
> Fixes: 79beb6114014 ("drm/amdgpu: Optimize EEPROM RAS table I/O")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> It's hard for me to tell the exact upper bound that "buf_size" can be,
> but if it's over USHRT_MAX then we are well toasted.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index fc70620369e4..f07a456506ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -978,9 +978,8 @@ const struct file_operations amdgpu_ras_debugfs_eeprom_table_ops = {
>  static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control)
>  {
>  	struct amdgpu_device *adev = to_amdgpu_device(control);
> -	int res;
> +	int buf_size, res;
>  	u8  csum, *buf, *pp;
> -	u32 buf_size;
>  
>  	buf_size = RAS_TABLE_HEADER_SIZE +
>  		control->ras_num_recs * RAS_TABLE_RECORD_SIZE;

