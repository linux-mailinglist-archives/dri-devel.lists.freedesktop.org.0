Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F0CFB697
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAF210E557;
	Wed,  7 Jan 2026 00:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VoCPeorB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013027.outbound.protection.outlook.com
 [40.93.196.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCB110E550;
 Wed,  7 Jan 2026 00:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYLor0gOcnSy2SjgZ8C7lHUzTD3HpSoCTYiL36jVPYIYgZ6Nd6f+dD7s7QJhP1xuy5JSKR1Zd5F7Y+Gom8DGa98fGq3uHyioPNunLFMNzCKQ2/ntK6XdxmNI5X0ib+lUnXwpo2CIEp0QZIbjz6Qa8h8Nse4AGGuWQQ6H0e/1P8s4XlsQoGxo5qcn7u9RcXicujPwqu8x0PK8H89T3K4UmsxZ+TAvmXMYgYP5iaOqHAI/CKZzVmxpN1dZVUvNv88NahRSi1IagsY+gF0F7pWfaF2sicXsRyCAzoe9bQi1z3Ppp4OGVBtExGbW/514fwcTWsDCgLPyDxvicMX5dn2LGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrjvbCkxEklfXHVyhGxlpXTiU8j+hEQ+wYQGhB0n41c=;
 b=mjepe3gVsKaU3CtF9pietlkiG7Of9U2w4twnwGGBJlNl5bcBLOHWDRxDq1Wd9K+BpmJUq2y45xLaQG7l53cG6t9kYFz46nSUWrkLBJ2EfbvRggVZO5jvRIZN3wC0UrGy0Ry7Bqo1Dq58IBVlya7lKhkpQyyTk7KAhd8F8WI1AmUdt4Y2M2gBXmFi4ZVRHez8KxNoWAwXTDeYkUperC278X1/6DVo24t5HDN0A/jujcPp11NfEk+OkQCxlsvR/iGcp3ZzygMvaC+CxJv75cex6zuyCscXLoXAKoGSX1ler5Lr2vrIZf09cIjy31E+m9P2INeTWuMb7oAdBLWMZU8RCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrjvbCkxEklfXHVyhGxlpXTiU8j+hEQ+wYQGhB0n41c=;
 b=VoCPeorBtdKhHOx9LUgwJp8Ho+Z4w5QdHPVwdjRqM1emNyQEN1mCPsT8D1SMP2430hgGjYQctxcSn1uYN5eVh453DI6e7zUTrtPsJyxohlDbkLvIh5DIQAJloEq4x5ym9XSiod/w6RSWF6QM2GeAZ5cjSNxHrDkdT9UtcnZ9/Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 00:04:43 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:04:42 +0000
Message-ID: <734258fe-0c13-4a5c-9165-e39e6f75bf15@amd.com>
Date: Tue, 6 Jan 2026 17:04:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm: Clean up colorop objects during mode_config
 cleanup
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 539af027-10de-4cab-bde3-08de4d805bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE4wc05VTEJtZGdsZkswUkVpZ1NySERqcW8zaTNvOVJXQ21zbkZ2RFYzZEJy?=
 =?utf-8?B?NnVUTCt1c0hHN3kvSkFBMVE1UU9iYXVNY0VSWllUT2hiUDVGd3VkaWRla0JE?=
 =?utf-8?B?QVdxeVZBSjhHa25lcERNSDQyNjNuRE81RThqbWIrbS9oelgwVXkwRmVhbm96?=
 =?utf-8?B?aitFL3duRHVxTWdubjVMR0N1cVNaK2ZYbVBxZyt6aHNiODdmdXhqUFlXOEhQ?=
 =?utf-8?B?UmhiQUFQSm1ybnlKRnlqZTF4L1ZnMzBkVCsydTU1cjdTU3hVcS9SNG9BemEw?=
 =?utf-8?B?SzlRVWFhN1lBOFRLWkNPc1NYaXlkZjZrVXh3bFJtNXBaMXJPTitsdXRnMGRK?=
 =?utf-8?B?azR0bkpqbHJmUnJGZTB5dnpidElQQUw0M1pFQ2YvQWVTWW5sN2JjM2RSTFZP?=
 =?utf-8?B?czU5eGpqeWxIRUQwSDFBZGdxZFFFS2JzOUNseWZDVlhXRmJ1eWZtWU9VNDRN?=
 =?utf-8?B?M1JRQ0I0UVZOS1diT09JL1FEb29raDZFZitycDR4SXY0cXE3R21rK2dTaXRO?=
 =?utf-8?B?QXQ2SGRBbjc3OWNGL2J0S3hEUFF3Z0RhLzIwNGluOTBIZWd3UUlsUWtMemtw?=
 =?utf-8?B?elVYTFpyTys1SWxnY1NRcEZFR0NML0ZpWHVybzNUSnRWRGpLY0djS29najJx?=
 =?utf-8?B?WXBpVlRMY1JIRmwxdGdsbW01RDdCUDlsWGd6UlJIZ3dvRm5GdVJqTENWUkNO?=
 =?utf-8?B?cS9MK3UrLzgrdmVaaXd1UmJGNW01eFR6K3h5VW1jOEtHeEMyOVRNOEs1NzhZ?=
 =?utf-8?B?ZDNOU2tOdE9iQW1zUlVmNFQ5eGJmQ3ArY3VoSUp6TXdSMVQ3Y3hncXQzRnQz?=
 =?utf-8?B?NjFhZC9DUzYvRi9BS1REZkczQXUraUxZajhJUVQ0cUlTMmdQZHRLcW5nSExJ?=
 =?utf-8?B?RDJ2cXUrNW9DSElzemVTRlRiTDEyT2FkMStuUWFDVXh4ZkQzUXJHMVMxbmd3?=
 =?utf-8?B?eHYxU1BLVW9McC93VEg2eFdNZVNxS2VVODZhTkNqTURsd1RjYm9mZ20xVWRa?=
 =?utf-8?B?K0dHSTdJb0gwQ3JGRU1tSzc3ZjR2ZXRnWnVteFFjMG1iSDFMMVVCdjFYL1VL?=
 =?utf-8?B?VDFWQndXRjE4QUU0T2cxVHFWWXJvWWx0ZEM4N0krQW1SbS9MWm5hazBERWR2?=
 =?utf-8?B?cVRkcGJQL1RVOWFaUUhDMW1XMjNSQUFNQno3bUZzMEc5RTFWT3NrRmdtSndi?=
 =?utf-8?B?dXhtYlJSZ0pzOGhTOUtuWjk3UDByN1kxcFNySGtFNktVbndQMGhEeGYxZWxP?=
 =?utf-8?B?WDlIZ042WEM1cFlxbEVlMnBNQXpVeGd3VUNpTng0Sm9xS0NHNGtadjQreFc2?=
 =?utf-8?B?UElWMGJDUVUwZGxyZGJQbVZNTGd0bWxQQkpjUHZ6cDYwNGVjRXVhVThFME5G?=
 =?utf-8?B?T0lTTW9DL3FIUWo5YjBHcms1d0xVQ2xJNXovS01kTGZDSE9lVWJtZTZvYWpF?=
 =?utf-8?B?NWdrb0pZQk1yYncxdEZaWFN6aUVVenhnUzNrY0d6UU5sa3BMSEMvMGRjL1ky?=
 =?utf-8?B?REtYZkFwTGpnRm9IVkh3Nm12T3ZOeDZuL3hjUjAvTlJCcHdhMm1FYWlwZFdh?=
 =?utf-8?B?T1g4dWVod0tEUmV2cWZ0a3FOVDFrRFhLQ0lwZmNUeHRVOVhqNkxlMXJ6UGwr?=
 =?utf-8?B?ZDlYenVNQkNDTVQ2UmFWMTViaVlSaFY5SzBHQ0xZSVAvYXlucGJyQWJybDYx?=
 =?utf-8?B?TUxWaEhzbnUrdmRERG9keVozUys0dEZDOWdyWU9pcXIyVEFyRDQ3VTZ4MmI1?=
 =?utf-8?B?UkZ4UXNxOXRsdXJjRnNIWklkZjJob0NZeW1HMzJTMFhBbTMvYWdUcHE3Y3RH?=
 =?utf-8?B?U04vdUxZSFJ2QTVGd1lHUS8rZWxRM095WE5nVFVzYXpLUGxYc3l2REdqS2N0?=
 =?utf-8?B?K1Y0aFNQaS9XMHRJRDdqY0lFdUV5d2JLNVo3WSs4YUpnZGRZcHdDWTlkcVp1?=
 =?utf-8?Q?AD1udPDw9BGyr6E2/qnhmVDDUlvU/0Gd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjZnRnFUN0RUZEJFOXp4L1YwN3dFZmhCU3lUN0UvUXltMUQreGMxaFpvT2RC?=
 =?utf-8?B?SXdMZUJWbzR2YWJ0dk03Y2E4MG1MTzJXejd2U1NLeFNPWUhmVHJsOGFtVW5m?=
 =?utf-8?B?NlVhK0psOWl2WGJKMnFCaFMxUjJUdzFFMmE4S201d09pVmtUei90RTFZN2Nn?=
 =?utf-8?B?RXIzQ3A3ckRGTVdBbVFRSkVublNzb08rWVpOb1N2aHRrVXVBSWU0eTJ6OTVt?=
 =?utf-8?B?WCsvenBFcExwKzloZVNYSVlWQkJ4QlVWbG5jRnExV09Ybk1wN3M4UEo4clB6?=
 =?utf-8?B?eUJDMDBtMUdQOFJyckswR241SGl4Ui9ybHVhUndzM21LZEY1ZllvbUo2aGNN?=
 =?utf-8?B?TUxqbkNUUkYyMVRqWXpPL1ZiZWVwM1M1bDdpMDZjaEp5YjlaSUlGbGdNTWtv?=
 =?utf-8?B?TFY0bnhPa1ZBd2dLUzN6UTRyWWJxUUNlK051T2Z5N0Z4MHBRNmJyZ3ltbFZC?=
 =?utf-8?B?WlB2L0FpeFJ3cU94YzhQMDdzUjdDaEc2UHVtcGpWakdXT2JhSFJYWjcwNmFM?=
 =?utf-8?B?T3dTUm5wMUxXUGNVRWRocjZ0MGRRb2JIQTBBL08vcGU5ZUdvSjVycE9ZOWRl?=
 =?utf-8?B?Sk5hRVkvVEpqcWR2OGM0TTRRK3JvS3JGc0F1aW95YXVJdGRkcVFxN3FabHhv?=
 =?utf-8?B?c1FkKzlnbzNqN0FuSHpheE80TXNhUEh5MzZFQmREcmNtOXhVMDNGQ3RIUlVV?=
 =?utf-8?B?SDF5bGRZaFExbE1kQlIwR1B2TEV5OE1FSmMrTmVsMUhEbTFwQjliVWpIK1lq?=
 =?utf-8?B?Y3hmRWhuK2dFbVA5OUthbUN4MXR4eEl6RHM1T2JqMi9XUEdNeDIrL3RySkNK?=
 =?utf-8?B?dHExZCsvYkdsU1I2SDAvaS9SYmVIQ21veERIWGJUUkRYMWc2RmZDVWRsSXE0?=
 =?utf-8?B?Q2tKeG1EL3dvcXVjWVdEMTVBQnZ2WWdJU3hKaktkTTNRcWwvRGovVktVZGUw?=
 =?utf-8?B?V1RjRzN6MHBlRFpqWDVwWmtrYTB1QzNXMC9mU1pVcmFOay9qM2hIQ1NNalJB?=
 =?utf-8?B?SlNtWUdZc1VQL2xBNG96RFpNa0psR0FFOVhHUENqZTBhR1hjenFsZHZqQ0Rm?=
 =?utf-8?B?ZmpqZUJyU1B0NnZpUFg2bFJxVHdKdGxlejR0WStyMzZpODBVM1lYR3RIR0xr?=
 =?utf-8?B?YWlpb3dnbzMvbTZhWEtqa3A2QlF2anBTeW4xVnlDcjdiSnNTa20wN0dwdG5I?=
 =?utf-8?B?YVJ5VkNNYzVpWkNPMEsvdllVTDhzanJjTU90cThDUEdoWVpocmliY0RScTZz?=
 =?utf-8?B?WDhnS294dFNaVDl4bnp4NEZGbm80b0c3UUpJT29kek56YjhWWFAva25yT1Zm?=
 =?utf-8?B?V1VhNnlSMlY4djgzYnNFV0Zsc3lZUUlBV2lCa3ZWczRCbllKNmg3R3ZYUzBG?=
 =?utf-8?B?ZzMxNENWZzBaUHdQL1RWT0RQVVI2S3ZueU94R3kzK1lVcFhtYjdVTTlXR3pi?=
 =?utf-8?B?V0x5ZjEzYnZ4ZUhxR1VhNzNtQ0tTakxJbXpjaDk3bXBQb2paaTBrYzdURERp?=
 =?utf-8?B?Qnk1NU5QT2FDRmx5Y0V0cXFlL3VRT1I4VDFnaVVEeVVQZS9odkhWN2RoTU50?=
 =?utf-8?B?cjM1T2NXMUJ0bDBpdndEQjlIYVpjY3lJWjBuS1d3YlM2aGtscThZd01UdXR5?=
 =?utf-8?B?cDBOeXBiTTk4NktVc0drTXhZNVI1U2RyRlA5N2tFbHBVM3dWQTc2bVNTS1gw?=
 =?utf-8?B?Z2RrSjBpTkNnYUtzdjh4eGFOMU02WHl4eVBrRGprVG8zQmFnaGtFV0NlR0Jw?=
 =?utf-8?B?cXNxOVhrVldXbWluOHVPZ3M3aWs3QXlaaTJhUEplQWVzWDZnMndLTGZtQnpa?=
 =?utf-8?B?eFVKWEVaa2ovMVZmNjg4dTJBNHhocEZqcFVlYlY1MjVSMVlFV1VJY25QRitX?=
 =?utf-8?B?WHZCa3lOM2dmR1A4VG9RN3U1L2puN2ZvZ3JtSFRPdXlFOC84MmJuQ2k2S1hS?=
 =?utf-8?B?MHQzSlE1NFlXeGRaWnFST085eTVBNHpNYW5DV3J6NEN2ZmUxVGNHQXI5enN5?=
 =?utf-8?B?aDlreFdIc29hWURUOGY1NGxoRXhSSG42TFFKSEh0L1hTVmo0VVJ0N3FjeEV2?=
 =?utf-8?B?UWptL1Uvb0NNdEZ2VGpQQzhJS0QxZGNHbXRIY0ExQXB5K09EWlBjZ2JRVFIx?=
 =?utf-8?B?eDV3K3J0UnZBOU9ndVVxdVl1NndIcm1GT1FpSFMyQVJVaXJZaEdYQjJxbmlU?=
 =?utf-8?B?RkFTYURvR2JvRjRpTEpGZ1pZYWRWNUdJaHZScU1NTDhOSFh1VjFBbTZZdEN2?=
 =?utf-8?B?VWFuTTRJc0ljazBTd0IvMURkSy9uTUtjVFgvaGgySHRNTXMrL0ZLb1RRakU1?=
 =?utf-8?B?RUQrQnF0YitaNS9Ec1NlQkJ5NVhBMW16aWUyaDlIelRjZGd2Y2dnZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539af027-10de-4cab-bde3-08de4d805bd2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:04:42.6695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loO5tb2OtqlAARjjQ6flS3gpaXYRDtsKMSbdb+XBitEqk0BpASuXBwmLDNJd1EsgyJBIDbY1iQCzk7XO2PR2Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Tear down all registered drm_colorop objects during
> drm_mode_config_cleanup() by invoking their destroy callbacks.
> 
> This ensures proper cleanup of color pipeline objects during DRM device
> removal.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/drm_mode_config.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index d12db9b0bab8..84ae8a23a367 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -524,6 +524,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>   	struct drm_property *property, *pt;
>   	struct drm_property_blob *blob, *bt;
>   	struct drm_plane *plane, *plt;
> +	struct drm_colorop *colorop, *copt;
>   
>   	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
>   				 head) {
> @@ -553,6 +554,11 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>   		drm_property_destroy(dev, property);
>   	}
>   
> +	list_for_each_entry_safe(colorop, copt, &dev->mode_config.colorop_list,
> +				 head) {
> +		colorop->funcs->destroy(colorop);
> +	}
> +
>   	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
>   				 head) {
>   		plane->funcs->destroy(plane);

